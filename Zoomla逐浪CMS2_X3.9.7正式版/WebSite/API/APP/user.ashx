<%@ WebHandler Language="C#" Class="user" %>

using System;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.User;
using ZoomLa.Model;
using Newtonsoft.Json;
using System.Data;
using ZoomLa.SQLDAL;
using ZoomLa.SQLDAL.SQL;
using ZoomLa.AppCode.Common;
public class user : APPAPI_Base, IHttpHandler
{
    B_User buser = new B_User();
    public void ProcessRequest (HttpContext context) {
        throw new Exception("接口关闭");
        base.InitHeader(context);
        retMod.retcode = M_APIResult.Failed;
        try
        {
            switch (Action)
            {
                case "register":
                    {
                        string uname = HttpUtility.UrlDecode(Req("uname"));
                        string upwd = HttpUtility.UrlDecode(Req("upwd"));
                        M_UserInfo mu = buser.NewUser(uname, upwd);
                        M_Uinfo basemu = new M_Uinfo();
                        mu.HoneyName = "";
                        mu.TrueName = "";
                        mu.UserFace = "";

                        basemu.Mobile = "";
                        basemu.UserSex = true;
                        basemu.BirthDay = "";
                        basemu.Province = "";//省市县
                        basemu.City = "";
                        basemu.County = "";
                        mu.UserID = buser.Add(mu);
                        basemu.UserId = mu.UserID;
                        buser.AddBase(basemu);
                        mu = buser.SelReturnModel(mu.UserID);
                        M_AJAXUser user = new M_AJAXUser(mu);
                        user.openid = buapi.CreateOpenID(mu);
                        retMod.result = JsonConvert.SerializeObject(user);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "login":
                    {
                        M_UserInfo mu = buser.AuthenticateUser(Req("uname"), Req("upwd"));
                        if (mu.IsNull)
                        {
                            retMod.retmsg = "用户不存在";
                        }
                        else
                        {
                            M_AJAXUser user = new M_AJAXUser(mu);
                            user.openid = buapi.CreateOpenID(mu);
                            retMod.result = JsonConvert.SerializeObject(user);
                            retMod.retcode = M_APIResult.Success;
                        }
                    }
                    break;
                case "update_basic"://用户更新用户名等基本信息
                    {
                        M_UserInfo mu = B_User_API.GetLogin(OpenID);
                        if (mu.IsNull) { throw new Exception("用户信息不正确"); }
                        mu.HoneyName = HttpUtility.UrlDecode(Req("name"));
                        buser.UpdateByID(mu);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "list"://用于好友列表等
                    {
                        int uid = DataConvert.CLng(Req("uid"))==0 ? 0 : DataConvert.CLng(Req("uid"));
                        PageSetting setting = new PageSetting();
                        setting.cpage = DataConvert.CLng(Req("cpage"), 1);
                        setting.psize = DataConvert.CLng(Req("psize")) == 0 ? 20 : DataConvert.CLng(Req("psize"));
                        setting.t1 = "ZL_User";
                        setting.pk = "A.UserID";
                        setting.fields = "UserID,UserName,HoneyName,salt AS UserFace";
                        setting.where = "1=1 and UserID <>"+ uid +"ORDER BY NEWID()";
                        DBCenter.SelPage(setting);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(setting.dt);
                        retMod.page = new M_API_Page(setting);
                    }
                    break;
                default:
                    {
                        retMod.retmsg = "user.[" + Action + "]接口不存在";
                    }
                    break;
            }
        }
        catch (Exception ex) { retMod.retmsg = ex.Message; }
        RepToClient(retMod);
    }

    public bool IsReusable { get { return false; } }

}