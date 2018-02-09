<%@ WebHandler Language="C#" Class="Common" %>

using System;
using System.Web;
using ZoomLa.Common;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using System.Data;
/*
 * 仅允许Form提交
 * 用于价格计算,增减商品
 * -1:失败,1:成功或直接返回值
 */
public class Common : API_Base,System.Web.IHttpHandler{
    B_Cart cartBll = new B_Cart();
    M_Cart cartMod = new M_Cart();
    B_User buser = new B_User();
    public void ProcessRequest(HttpContext context)
    {
        M_UserInfo mu = buser.GetLogin();
        retMod.retcode = M_APIResult.Failed;
        string CartCookID = B_Cart.GetCartID(context);
        //retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            switch (Action)
            {
                case "cart_del":
                    {
                        string ids = Req("ids");
                        cartBll.DelByIDS(CartCookID, buser.GetLogin().UserName, ids);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "setnum"://兼容
                case "cart_setnum"://ID,数量,Cookies,可不登录,数量不能小于1
                    {
                        int id = DataConverter.CLng(Req("id"));
                        int pronum = DataConverter.CLng(Req("pronum"));
                        if (id < 1 || pronum < 1)
                        {
                            retMod.retmsg = "商品ID与数量不能小于1";
                        }
                        else if (string.IsNullOrEmpty(CartCookID))
                        {
                            retMod.retmsg = "CartCookID不存在";
                        }
                        else
                        {
                            cartBll.UpdateProNum(CartCookID, mu.UserID, id, pronum);
                            retMod.retcode = M_APIResult.Success;
                        }
                    }
                    break;
                case "deladdress":
                    {
                        B_UserRecei receBll = new B_UserRecei();
                        int id = DataConverter.CLng(Req("id"));
                        if (mu == null || mu.UserID == 0 || id < 1) { OldRep("-1"); }
                        else
                        {
                            receBll.U_DelByID(id, mu.UserID); OldRep("1");
                        }
                    }
                    break;
                case "arrive":
                    {
                        B_Arrive avBll = new B_Arrive();
                        string flow = Req("flow");
                        string ids = Req("ids");
                        double money = double.Parse(Req("money"));
                        DataTable cartdt = cartBll.SelByCartID(CartCookID, mu.UserID, -100, ids);
                        if (cartdt.Rows.Count < 1) { retMod.retmsg = "购物车为空";RepToClient(retMod); }
                        M_Arrive avMod = avBll.SelModelByFlow(flow, mu.UserID);
                        M_Arrive_Result arrMod = avBll.U_CheckArrive(avMod, mu.UserID, cartdt, money);
                        if (arrMod.enabled)
                        {
                            retMod.retcode = M_APIResult.Success;
                            //已优惠金额,优惠后金额
                            retMod.result = Newtonsoft.Json.JsonConvert.SerializeObject(arrMod);
                        }
                        else { retMod.retmsg = arrMod.err; }
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
    public void OldRep(string result) { HttpResponse rep = HttpContext.Current.Response; rep.Clear(); rep.Write(result); rep.Flush(); rep.End(); }
    public bool IsReusable { get { return false; } }
}