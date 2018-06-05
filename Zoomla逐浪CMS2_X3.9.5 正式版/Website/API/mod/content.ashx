<%@ WebHandler Language="C#" Class="content" %>

using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using ZoomLa.SQLDAL;
//用于内容转载,删除
public class content : API_Base, IHttpHandler
{
    B_User buser = new B_User();
    B_Content conBll = new B_Content();
    private int Gid { get { return DataConvert.CLng(Req("Gid")); } }
    public void ProcessRequest(HttpContext context) 
    {
        throw new Exception("接口关闭,请联系管理员开启");
        M_UserInfo mu = buser.GetLogin();
        retMod.retcode = M_APIResult.Failed;
        if (mu.IsNull) { retMod.retmsg = "请登录后再操作"; RepToClient(retMod); }
        //retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            switch (Action)
            {
                case "add":
                    break;
                case "edit":
                    break;
                case "edit_field"://修改附表字符,只有发起人可修改
                    {
                        string field = Req("field");
                        string value = Req("value");
                        M_CommonData conMod = conBll.SelReturnModel(Gid);
                        DataTable dt = DBCenter.Sel(conMod.TableName, "ID=" + conMod.ItemID);
                        if (conMod.SuccessfulUserID != mu.UserID) { retMod.retmsg = "你无权修改该内容"; }
                        else if (!dt.Columns.Contains(field)) { retMod.retmsg = "指定的字段名称不存在"; }
                        else
                        {
                            DBCenter.UpdateSQL(conMod.TableName, field + "=@value", "ID=" + conMod.ItemID, new List<SqlParameter>() { new SqlParameter("value", value) });
                        }
                    }
                    break;
                case "del"://删除自己的转载或内容
                    {
                        //M_CommonData conMod = conBll.SelReturnModel(Gid);
                        //if (conMod == null) { retMod.retmsg = "内容不存在"; }
                        //else if (!conMod.Inputer.ToLower().Equals(mu.UserName.ToLower())) { retMod.retmsg = "你无权删除该内容"; }
                        //else 
                        //{
                        //    conBll.SetDel(conMod.GeneralID);
                        //    retMod.retcode = M_APIResult.Success;
                        //}
                    }
                    break;
                case "forward":
                    {
                        
                    }
                    break;
                default:
                    {
                        retMod.retmsg = "[" + Action + "]接口不存在";
                    }
                    break;
            }
        }
        catch (Exception ex) { retMod.retmsg = ex.Message; }
        RepToClient(retMod);
    }
    public bool IsReusable { get { return false; } }
}