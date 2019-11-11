<%@ WebHandler Language="C#" Class="pub" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.User;
using ZoomLa.BLL.Helper;
using ZoomLa.Common;
using ZoomLa.Model;
using ZoomLa.Model.User;
using ZoomLa.SQLDAL;
using Newtonsoft.Json;
/*
 * 用于头像上传等
 */
public class pub : API_Base, IHttpHandler
{
    B_User buser = new B_User();
    //$.post("/API/Mod/Pub.ashx?action=add&pubid=1&id=1",{data:json},function(data){});
    //-----
    const string ApiKey = "ZLWXAPP137934j&21";
    public void ProcessRequest(HttpContext context)
    {
        throw new Exception("closed");
        retMod.retcode = M_APIResult.Failed;
        context.Response.ContentType = "text/plain";
        context.Request.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
        context.Response.ContentEncoding = System.Text.Encoding.GetEncoding("UTF-8");
        HttpPostedFile file = context.Request.Files["file"];
        try
        {
            if (file == null || file.ContentLength < 1) { throw new Exception("未指定需上传的文件"); }
            if (SafeSC.FileNameCheck(file.FileName)) { throw new Exception("不允许上传该后缀名的文件"); }
            string savePath = ZLHelper.GetUploadDir_System("wxapp", "images", "yyyyMMdd");
            string filename = DateTime.Now.ToString("HHmmss") + function.GetRandomString(6, 2) + ".png";
            retMod.retcode = M_APIResult.Success;
            retMod.result = SafeSC.SaveFile(savePath, file, filename);

            //switch (Action)
            //{
            //    default:
            //        {
            //            retMod.retmsg = "[" + Action + "]接口不存在";
            //        }
            //        break;
            //}
        }
        catch (Exception ex) { retMod.retmsg = ex.Message; }
        RepToClient(retMod);
    }
    public bool IsReusable { get { return false; } }
}