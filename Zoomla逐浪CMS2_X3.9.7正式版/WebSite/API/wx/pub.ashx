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
using ZoomLa.SQLDAL.SQL;
using Newtonsoft.Json;

/*
 * 互动模块接口,以DataTable接收存储和修改
 */
public class pub : API_Base, IHttpHandler
{
    B_User buser = new B_User();
    //$.post("/API/Mod/Pub.ashx?action=add&pubid=1&id=1",{data:json},function(data){});
    //-----
    const string ApiKey = "ZLWXAPP137934j&21";
    int PubID { get { return DataConvert.CLng(Req("pubid")); } }
    int Mid { get { return DataConvert.CLng(Req("id")); } }
    string Mdata { get { return "[" + Req("data") + "]"; } }//添加与修改时传递的数据,需要转DataTable,所以外置[]
    B_Pub pubBll = new B_Pub();
    B_OrderList orderBll = new B_OrderList();
    B_Content conBll = new B_Content();
    M_Pub pubMod = new M_Pub();
    public void ProcessRequest(HttpContext context)
    {
        throw new Exception("closed");
        retMod.retcode = M_APIResult.Failed;
        M_UserInfo mu = new M_UserInfo();
        pubMod = pubBll.SelReturnModel(PubID);
        //if (pubMod == null) { retMod.retmsg = "[" + PubID + "]互动模块不存在"; RepToClient(retMod); }
        try
        {
            switch (Action)
            {
                case "pub_add":
                    {
                        DataTable dt = JsonConvert.DeserializeObject<DataTable>(Mdata);
                        ForDataColumn(pubMod, dt);
                        DataRow dr = dt.Rows[0];
                        int id = DBCenter.Insert(pubMod.PubTableName, BLLCommon.GetFields(dr), BLLCommon.GetParas(dr), BLLCommon.GetParameters(dr));
                        int uid = DataConvert.CLng(dr["PubUserID"]);
                        //生成支付信息,给予前端调用,并生成订单
                        //将相关信息写入订单,便于查询出来
                        {
                            mu = buser.SelReturnModel(uid);
                            M_OrderList orderMod = orderBll.NewOrder(mu, M_OrderList.OrderEnum.Fast);
                            //将购买时的信息存入订单
                            orderMod.Extend = Req("data");
                            switch (pubMod.Pubid)
                            {
                                case 8:
                                    #region 课程报名
                                    {
                                        M_CommonData conMod = conBll.SelReturnModel(DataConvert.CLng(dr["kcid"]));
                                        string pic = DataConvert.CStr(DBCenter.ExecuteScala("ZL_C_bxmx", "pic", "ID=" + conMod.ItemID));
                                        orderMod.Ordermessage = JsonHelper.GetJson(
                                      new string[] { "gid", "title", "pic" }
                                    , new string[] { conMod.GeneralID.ToString(), conMod.Title, pic });
                                    }
                                    #endregion
                                    break;
                                default:
                                    {
                                        //M_CommonData conMod = conBll.SelReturnModel(DataConvert.CLng(dr["gid"]));
                                    }
                                    break;
                            }
                            //互动内容的ID
                            orderMod.Money_code = id.ToString();
                            orderMod.id = orderBll.insert(orderMod);
                        }
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "pub_edit":
                    {
                        //修改对用户ID校验
                        //DataTable dt = JsonConvert.DeserializeObject<DataTable>(Mdata);
                        //ForDataColumn(pubMod, dt);
                        //DataRow dr = dt.Rows[0];
                        //List<SqlParameter> splist = new List<SqlParameter>();
                        //splist.AddRange(BLLCommon.GetParameters(dr));
                        //DBCenter.UpdateSQL(pubMod.PubTableName, BLLCommon.GetFieldAndPara(dr), "ID=" + Mid + " AND PubUserID=" + mu.UserID, splist);
                        //retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "pub_del":
                    {
                        int pubid = DataConvert.CLng(Req("pubid"));
                        int id = DataConvert.CLng(Req("id"));
                        int uid = DataConvert.CLng(Req("uid"));
                        if (pubMod == null || string.IsNullOrEmpty(pubMod.PubTableName)) { throw new Exception("互动信息错误"); }
                        DBCenter.DelByWhere(pubMod.PubTableName, "ID=" + Mid + " AND PubUserID=" + uid);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "pub_list"://用于取出指定的互动列表,或单条的数据
                    {
                        int uid = DataConvert.CLng(Req("uid"));
                        int cpage = DataConvert.CLng(Req("cpage"), 1);
                        int psize = DataConvert.CLng(Req("psize"), 10);
                        string where = "1=1 ";
                        if (uid > 0)
                        {
                            where += " AND PubUserID=" + uid;
                        }
                        if (Mid > 0)
                        {
                            where += " AND ID=" + Mid;
                        }
                        PageSetting setting = new PageSetting()
                        {
                            cpage = cpage,
                            psize = psize,
                            t1 = pubMod.PubTableName,
                            where = where,
                            order = "ID DESC"
                        };
                        DBCenter.SelPage(setting);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(setting.dt);
                        retMod.page = new M_API_Page(setting);
                    }
                    break;
                case "pub_view"://仅用于列表展示[extend]
                    {
                        int uid = DataConvert.CLng(Req("uid"));
                        string where = "PubUserID=" + uid;
                        PageSetting setting = PageSetting.Single(1, 30, "ZL_Ex_PubView", "ID", where, "PubAddTime DESC", null, "*");
                        setting.pageMethod = "row";
                        DBCenter.SelPage(setting);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(setting.dt);
                        retMod.page = new M_API_Page(setting);

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
    private void ForDataColumn(M_Pub pubMod,DataTable dt)
    {
        M_UserInfo mu = buser.GetLogin();
        string[] fields = "PubAddTime,PubUserName,PubUserID,PubIP,Pubupid,Pubstart,PubTitle".Split(',');
        foreach (string field in fields)
        {
            if (!dt.Columns.Contains(field)) { dt.Columns.Add(new DataColumn(field, typeof(string))); }
        }
        DataRow dr = dt.Rows[0];
        dr["PubAddTime"] = DateTime.Now;
        //dr["PubUserName"] = mu.UserName;
        //dr["PubUserID"] = mu.UserID;
        dr["PubIP"] = IPScaner.GetUserIP();
        dr["Pubupid"] = PubID;
        dr["Pubstart"] = pubMod.PubIsTrue == 1 ? 0 : 1;//是否审核
        if (string.IsNullOrEmpty(DataConvert.CStr(dr["PubTitle"])))
        {
            dr["PubTitle"] = pubMod.PubName;
        }
    }
    public bool IsReusable { get { return false; } }
}