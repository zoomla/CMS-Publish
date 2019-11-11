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
public class user :APPAPI_Base,IHttpHandler {
    public void ProcessRequest (HttpContext context) {
        throw new Exception("接口关闭");
        InitHeader(context);
        retMod.retcode = M_APIResult.Failed;
        HttpPostedFile file = HttpContext.Current.Request.Files[0];
        try
        {
            switch (Action)
            {
                case "upload"://保存上传的文件
                    {
                        //SafeSC.SaveFile("/UploadFiles/", file, "test.jpg");
                    }
                    break;
                default:
                    {
                        retMod.retmsg = "file.[" + Action + "]接口不存在";
                    }
                    break;
            }
        }
        catch (Exception ex) { retMod.retmsg = ex.Message; }
        RepToClient(retMod);
    }
    public bool IsReusable { get { return false; } }
}