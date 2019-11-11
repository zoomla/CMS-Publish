<%@ WebHandler Language="C#" Class="Notify" %>
using System;
using System.Web;
using System.Data;
using ZoomLa.BLL;
using ZoomLa.BLL.User;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Components;
using System.Collections.Generic;
using Newtonsoft.Json;
using System.Linq;
public class Notify : API_Base, IHttpHandler
{
    /*
        string notify_url = CustomerPageAction.customPath2 + "Shop/Orderlistinfo.aspx?ID=1";
        ZoomLa.BLL.User.M_User_Notify notify = new ZoomLa.BLL.User.M_User_Notify();
        notify.Title = "有新的订单了";
        notify.Content = "<a href='" + notify_url + "' target='main_right' style='font-size:12px;'>订单号:test for you,点击访问</a>";
        notify.NType = 1;
        notify.Gid = "1";
        notify.AppendReceUser("admin");
        ZoomLa.BLL.User.B_User_Notify.Add(notify);
     */

    B_User buser = new B_User();
    public void ProcessRequest(HttpContext context)
    {
        M_UserInfo mu = buser.GetLogin();
        retMod.retcode = M_APIResult.Failed;
        if (mu.IsNull) { retMod.retmsg = "用户未登录"; RepToClient(retMod); }
        //retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            switch (Action)
            {
                case "add"://授权开放
                    break;
                case "list":
                    {
                        var list = B_User_Notify.ReadNotify(mu.UserID.ToString());
                        if (list.Count < 1) { retMod.retmsg = "没有通知信息"; }
                        else { retMod.retcode = M_APIResult.Success; retMod.result = JsonConvert.SerializeObject(list); }
                    }
                    break;
                case "admin"://获取管理员通知
                    {
                        string sid = HttpContext.Current.Session.SessionID;
                        if (lastNotify != null && (DateTime.Now - lastNotify.cdate).TotalSeconds > 15)
                        { lastNotify = null; }
                        //同一session下不重复发放
                        var list = B_User_Notify.ReadNotify("admin");
                        if (list.Count < 1)
                        {

                            if (lastNotify != null && !lastNotify.readed.Contains(sid))
                            {
                                lastNotify.readed += "," + sid;
                                retMod.result = lastNotify.result;
                                retMod.retcode = M_APIResult.Success;
                            }
                            else { retMod.retmsg = "没有通知信息"; }

                        }
                        else
                        {
                            //前台十秒读一次
                            //加入缓读机制,缓存最近一次的信息,15秒内,其它浏览器也可读取
                            retMod.result = JsonConvert.SerializeObject(list);
                            retMod.retcode = M_APIResult.Success;
                            lastNotify = new M_NotifyCache()
                            {
                                cdate = DateTime.Now,
                                readed = sid,
                                result = retMod.result
                            };
                        }
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
    public static M_NotifyCache lastNotify = null;
}
public class M_NotifyCache
{
    public string readed = "";//以,号切割
    public string result = "";
    public DateTime cdate = DateTime.Now;
}
/// <summary>
/// 返回的通知结果
/// </summary>
public class M_NotifyResult
{
    public int retcode = 1;
    public int num = 0;    //一级重要信息,不二次封装,如消息数量等
    public int num2 = 0;
    public int num3 = 0;
    public string msg = "";//正常等时的提示
    public string errmsg = "";//错误时的提示
    public override string ToString()
    {
        return JsonConvert.SerializeObject(this);
    }
}