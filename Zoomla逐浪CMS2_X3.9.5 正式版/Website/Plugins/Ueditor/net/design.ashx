<%@ WebHandler Language="C#" Class="design" %>

using System;
using System.Web;
using System.Web.SessionState;

public class design : IRequiresSessionState, IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        if (ZoomLa.Components.SiteConfig.SiteOption.DesignIsClose) { throw new Exception("动力模块已关闭"); }
        Handler action = null;
        switch (context.Request["action"])
        {
            case "config":
                action = new ConfigHandler(context);
                break;
            case "uploadimage"://根据站点ID,将其存在
                action = new UploadHandler(context, new UploadConfig()
                {
                    Plat = "design",
                    SourceUrl = context.Request["SourceUrl"],
                    AllowExtensions = Config.GetStringList("imageAllowFiles"),
                    PathFormat = Config.GetString("imagePathFormat"),
                    SizeLimit = Config.GetInt("imageMaxSize"),
                    UploadFieldName = Config.GetString("imageFieldName")
                });
                break;
            default:
                break;
        }
        action.Process();
    }
    public bool IsReusable { get { return false; } }
}
