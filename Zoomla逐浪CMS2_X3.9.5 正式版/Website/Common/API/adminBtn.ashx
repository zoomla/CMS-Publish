<%@ WebHandler Language="C#" Class="adminBtn" %>

using System;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using Newtonsoft.Json;
using ZoomLa.Components;

public class adminBtn :API_Base,IHttpHandler {
    B_User buser = new B_User();
    B_Admin badmin = new B_Admin();
    B_Node nodeBll = new B_Node();
    B_Product proBll = new B_Product();
    B_Content conBll = new B_Content();
    public void ProcessRequest (HttpContext context) {
        retMod.retcode = M_APIResult.Failed;
        //retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            B_Admin.CheckIsLogged(context.Request.RawUrl);
            string editTlpUrl = CustomerPageAction.customPath2 + "/Template/TemplateEdit.aspx?setTemplate=" + SiteConfig.SiteOption.TemplateDir.TrimEnd('/')+"/";
            HttpResponse Response = context.Response;
            switch (Action)
            {
                case "init"://不同有同名用户,同名管理员存在
                    {
                        if (!SiteConfig.SiteOption.UAgent) { retMod.retmsg = "后台未开启管理按钮功能"; }
                        M_UserInfo mu = buser.GetLogin();
                        M_AdminInfo adminMod = B_Admin.GetLogin();
                        //必须管理员登录才可开启并返回配置文件 
                        if (adminMod == null) { retMod.retmsg = "管理员未登录"; RepToClient(retMod); }
                        T_AdminConf conf = new T_AdminConf() { path = CustomerPageAction.customPath2 };
                        retMod.result = JsonConvert.SerializeObject(conf);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                #region 页面传参,详可见 adminBtn.html
                case "index_tlp":
                    Response.Redirect(editTlpUrl + "&filePath=" + HttpUtility.UrlEncode(SiteConfig.SiteOption.IndexTemplate.Trim('/')));
                    break;
                case "index_siteinfo":
                    Response.Redirect(CustomerPageAction.customPath2 + "Config/SiteInfo.aspx");
                    break;
                case "index_siteconfig":
                    Response.Redirect(CustomerPageAction.customPath2 + "Config/SiteOption.aspx");
                    break;
                case "content_tlp":
                    {
                        string tlp = "";
                        M_CommonData conMod = conBll.SelReturnModel(Convert.ToInt32(Req("id")));
                        if (!string.IsNullOrEmpty(conMod.Template)) { tlp = conMod.Template; }
                        else { tlp = nodeBll.GetModelTemplate(conMod.NodeID, conMod.ModelID); }
                        Response.Redirect(editTlpUrl + "&filePath=" + tlp);
                    }
                    break;
                case "content_node":
                    {
                        M_CommonData conMod = conBll.SelReturnModel(Convert.ToInt32(Req("id")));
                        Response.Redirect(CustomerPageAction.customPath2 + "/Content/Node/EditNode.aspx?NodeID=" + conMod.NodeID);
                    }
                    break;
                case "node_edit":
                    Response.Redirect(CustomerPageAction.customPath2 + "/Content/Node/EditNode.aspx?NodeID=" + Req("id"));
                    break;
                case "node_tlp":
                    {
                        M_Node nodeMod = nodeBll.SelReturnModel(Convert.ToInt32(Req("id")));
                        string tlp = "";
                        switch (Req("nodeTlp"))
                        {
                            case "elite":
                                tlp = nodeMod.ProposeTemplate;
                                break;
                            case "default":
                            default:
                                tlp = nodeMod.IndexTemplate;
                                break;
                        }
                        Response.Redirect(editTlpUrl + "&filePath=" + tlp);
                    }
                    break;
                case "node_list":
                    Response.Redirect(CustomerPageAction.customPath2 + "Content/Node/NodeManage.aspx");
                    break;
                case "product_edit":
                    Response.Redirect("/AdminMVC/Product/AddProduct?ID="+Req("ID"));
                    break;
                case "product_tlp":
                    {
                        string tlp = "";
                        M_Product proMod = proBll.GetproductByid(Convert.ToInt32(Req("ID")));
                        if (!string.IsNullOrEmpty(proMod.ModeTemplate)) { tlp = proMod.ModeTemplate; }
                        else { tlp = nodeBll.GetModelTemplate(proMod.Nodeid, proMod.ModelID); }
                        Response.Redirect(editTlpUrl + "&filePath=" + tlp);
                    }
                    break;
                case "product_node":
                    {
                        M_Product proMod = proBll.GetproductByid(Convert.ToInt32(Req("ID")));
                        Response.Redirect(CustomerPageAction.customPath2 + "/Content/Node/EditNode.aspx?NodeID=" + proMod.Nodeid);
                    }
                    break;
                #endregion
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
    private class T_AdminConf
    {
        //后台管理路径
        public string path = "";
    }
}