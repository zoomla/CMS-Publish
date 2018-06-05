<%@ WebHandler Language="C#" Class="oacom" %>

using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.User;
using ZoomLa.Model;
using ZoomLa.SQLDAL;
using Newtonsoft.Json;

public class oacom :API_Base,IHttpHandler {
    B_User buser = new B_User();
    B_OA_Document oaBll=new B_OA_Document();
    B_Message msgBll=new B_Message();
    public void ProcessRequest(HttpContext context)
    {
        M_UserInfo mu = buser.GetLogin();
        retMod.retcode = M_APIResult.Failed;
        if (mu.IsNull) { retMod.retmsg = "尚未登录"; RepToClient(retMod); }
        //retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            switch (Action)
            {
                case "oadoc_undeal"://待处理公文
                    {
                        int count = oaBll.SelDocByUid(mu.UserID).Rows.Count;
                        retMod.result = count.ToString();
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "oadoc_newfiled"://1天之内的刚归档文件
                    {
                        int count = DBCenter.Count("ZL_OA_Document", "FiledDate IS NOT NULL AND FiledDate<='" + DateTime.Now.AddDays(1).ToString("yyyy/MM/dd 00:00:00") + "'");
                        retMod.result = count.ToString();
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "oadoc_newsend"://是否在指定的流程有发文
                    {
                        int count = DBCenter.Count("ZL_OA_Document", "SendDate<='" + DateTime.Now.AddDays(1).ToString("yyyy/MM/dd 00:00:00") + "' AND ProID IN (5,6)");
                        retMod.result = count.ToString();
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "email_unread":
                    {
                        int count = msgBll.GetUnReadMail(mu.UserID).Rows.Count;
                        retMod.result = count.ToString();
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                default:
                    retMod.retmsg = "[" + Action + "]接口不存在";
                    break;
            }
        }
        catch (Exception ex) { retMod.retmsg = ex.Message; }
        RepToClient(retMod);
    }
    public bool IsReusable { get { return false; } }
}