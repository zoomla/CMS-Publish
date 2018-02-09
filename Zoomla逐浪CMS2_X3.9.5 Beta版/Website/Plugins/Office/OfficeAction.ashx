<%@ WebHandler Language="C#" Class="admin" %>

using System;
using System.Web;
using System.Web.SessionState;
using ZoomLa.Model;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.Common;
using ZoomLa.Model.Common;
using ZoomLa.BLL.Common;
using ZoomLa.BLL.Helper;

public class admin : IHttpHandler, IRequiresSessionState
{
    OACommon oacom = new OACommon();
    B_OA_Document oaBll = new B_OA_Document();
    B_Com_File fileBll = new B_Com_File();
    B_User buser = new B_User();
    private int AppID { get { return DataConverter.CLng(HttpContext.Current.Request.QueryString["AppID"]); } }//AppID
    private string FName { get { return HttpUtility.UrlDecode(HttpContext.Current.Request.QueryString["fname"] ?? ""); } }//仅传文件名
    M_APIResult retMod = new M_APIResult(M_APIResult.Failed);
    public void ProcessRequest(HttpContext context)
    {
        HttpRequest Request = context.Request;
        HttpResponse Response = context.Response;
        string action = Request["action"];
        switch (action)
        {
            case "getword"://返回Word二进制文件
                {
                    #region
                    Response.Clear();
                    Response.ContentType = "Application/msword";
                    string fname = HttpUtility.UrlDecode(Request["fname"]);
                    int appid = DataConverter.CLng(Request["appid"]);
                    string vpath = "";
                    if (appid > 0)
                    {
                        M_OA_Document oaMod = oaBll.SelReturnModel(appid);
                        M_UserInfo mu = buser.SelReturnModel(oaMod.UserID);
                        vpath = oacom.GetMyDir(mu) + HttpUtility.UrlDecode(oaMod.PrivateAttach);
                    }
                    else
                    {
                        M_UserInfo mu = buser.GetLogin();
                        vpath = oacom.GetMyDir(mu) + fname;
                    }
                    Response.BinaryWrite(SafeSC.ReadFileByte(vpath));   //读取二进制的文件
                    Response.Flush(); Response.End();
                    #endregion
                }
                break;
            case "saveword":
                {
                    #region
                    if (Request.Files.Count < 1) { RepToClient("No File Upload!"); }
                    HttpPostedFile file = Request.Files[0];
                    if (AppID > 0)
                    {
                        M_OA_Document oaMod = oaBll.SelReturnModel(AppID);
                        M_UserInfo mu = buser.SelReturnModel(oaMod.UserID);
                        SafeSC.SaveFile(oacom.GetMyDir(mu), file, FName);
                    }
                    else//第一次创建
                    {
                        HttpContext curReq = HttpContext.Current;
                        M_UserInfo mu = buser.GetLogin();
                        SafeSC.SaveFile(oacom.GetMyDir(mu), file, FName);
                    }
                    Response.Write("true");
                    #endregion
                }
                break;
            case "db_getword":
                {
                    string guid = Request["guid"];
                    M_Com_File fileMod = fileBll.SelModelByGuid(guid);
                    if (fileMod != null) { Response.BinaryWrite(fileMod.FileContent); }
                }
                break;
            case "db_saveword":
                {
                    if (Request.Files.Count < 1) { retMod.retmsg = "未上传文件"; RepToClient(retMod.ToString()); }
                    string guid = Request["guid"];
                    M_Com_File fileMod = fileBll.SelModelByGuid(guid);
                    if (fileMod == null) { ZLLog.L(guid + "|为空"); fileMod = new M_Com_File(); }
                    fileMod.FileContent = IOHelper.StreamToBytes(Request.Files[0].InputStream);
                    fileMod.FileName = FName.Split('.')[0];
                    if (fileMod.ID > 0)
                    {
                        fileMod.UpdateTime = DateTime.Now;
                        fileBll.UpdateByID(fileMod);
                    }
                    else
                    {
                        fileMod.FileType = "套红";
                        fileMod.Source = "oa";
                        fileBll.Insert(fileMod);
                    }
                    retMod.result = fileMod.FileGuid;
                    retMod.retcode = M_APIResult.Success;
                    RepToClient(retMod.ToString());
                }
                break;
        }
        Response.Flush(); Response.End();
    }
    public void RepToClient(string txt)
    {
        HttpResponse rep = HttpContext.Current.Response;
        rep.Clear();
        rep.Write(txt);
        rep.Flush();
        rep.End();
    }
    public bool IsReusable { get { return false; } }
}