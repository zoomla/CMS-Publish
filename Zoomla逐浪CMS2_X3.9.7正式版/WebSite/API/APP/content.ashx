<%@ WebHandler Language="C#" Class="user" %>

using System;
using System.Web;
using ZoomLa.BLL;
using ZoomLa.BLL.CreateJS;
using ZoomLa.BLL.API;
using ZoomLa.BLL.User;
using ZoomLa.Model;
using Newtonsoft.Json;
using System.Data;
using ZoomLa.SQLDAL;
using ZoomLa.SQLDAL.SQL;
using ZoomLa.Common;
using ZoomLa.BLL.Helper;
using ZoomLa.AppCode.Common;
public class user :APPAPI_Base,IHttpHandler {
    B_User buser = new B_User();
    B_Node nodeBll = new B_Node();
    public void ProcessRequest (HttpContext context) {
        throw new Exception("接口关闭");
        InitHeader(context);
        retMod.retcode = M_APIResult.Failed;
        try
        {
            switch (Action)
            {
                case "content_list":
                    {
                        string nodeIds = "1,2,10,26";
                        PageSetting setting = new PageSetting();
                        setting.cpage = DataConvert.CLng(Req("cpage"), 1);
                        setting.psize = DataConvert.CLng(Req("psize")) == 0 ? 20 : DataConvert.CLng(Req("psize"));
                        setting.t1 = "ZL_CommonModel";
                        setting.t2 = "ZL_C_Article";
                        setting.pk = "A.GeneralID";
                        setting.on = "A.ItemID=B.ID";
                        setting.where = "A.NodeID IN (" + nodeIds + ") AND A.Status=99";
                        setting.where += " AND A.ModelID=2 AND A.TopImg !='' AND A.TopImg IS NOT NULL";
                        setting.order = "A.CreateTime DESC";
                        setting.fields = "A.GeneralID,A.Title,A.NodeID,A.Inputer,A.TopImg,A.CreateTime";
                        setting.fields += ",B.synopsis,B.content";

                        DBCenter.SelPage(setting);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(setting.dt);
                        retMod.result = H_ImageDeal(retMod.result);//对内容做处理
                        retMod.page = new M_API_Page(setting);
                    }
                    break;
                case "content_get":
                    break;
                case "content_add":
                    break;
                case "node_list":
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