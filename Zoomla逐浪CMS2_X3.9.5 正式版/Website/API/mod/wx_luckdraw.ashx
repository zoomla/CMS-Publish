<%@ WebHandler Language="C#" Class="wx_luckdraw" %>

using System;
using System.Web;
using System.Collections.Generic;
using System.Linq;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.Model.Other;
using ZoomLa.BLL.Other;
using System.Data;
using ZoomLa.SQLDAL;
using System.Data.SqlClient;
using Newtonsoft.Json;
/*
 1,用户必须已注册且登录,微信中必须将其自动同步
*/
public class wx_luckdraw :API_Base,IHttpHandler {
    B_User buser = new B_User();
    B_WX_LuckDraw luckBll = new B_WX_LuckDraw();
    B_WX_LuckDrawList ldListBll = new B_WX_LuckDrawList();
    public void ProcessRequest(HttpContext context)
    {
        retMod.retcode = M_APIResult.Failed;
        M_UserInfo mu = buser.GetLogin();
        if (mu.IsNull) { retMod.retmsg = "用户未登录"; RepToClient(retMod); }
        int id = DataConverter.CLng(Req("id"));
        //-----活动是否正常执行
        M_WX_LuckDraw luckMod = luckBll.SelReturnModel(id);
        if (luckMod == null) { retMod.retmsg = "活动信息不存在"; RepToClient(retMod); }
        else if (luckMod.SDate > DateTime.Now) { retMod.retmsg = "活动尚未开始"; RepToClient(retMod); }
        else if (luckMod.EDate <= DateTime.Now) { retMod.retmsg = "活动已经结束"; RepToClient(retMod); }
        //retMod.callback = CallBack;//暂不开放JsonP
        try
        {
            switch (Action)
            {
                case "enroll"://仅报名,后期再统一抽奖
                    {
                        if (ldListBll.Exist(id, mu.UserID)) { retMod.retmsg = "用户已报名参加过该活动"; RepToClient(retMod); }
                        M_WX_LuckDrawList ldListMod = new M_WX_LuckDrawList();
                        ldListMod.UserID = mu.UserID;
                        ldListMod.UserName = mu.UserName;
                        ldListMod.LuckID = id;
                        ldListBll.Insert(ldListMod);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "draw"://给特定的活动的权限,允许客户端提交
                    {
                        if (id != 2) { retMod.retmsg = "不允许客户端提交"; RepToClient(retMod); }
                        string prize = Req("prize");
                        int uid = DataConvert.CLng(Req("UserID"));
                        List<SqlParameter> sp = new List<SqlParameter>() { new SqlParameter("prize", prize) };
                        DBCenter.UpdateSQL(ldListBll.TbName, "Prize=@prize", "LuckID=" + id + " AND UserID=" + uid,sp);
                    }
                    break;
                case "luckdraw"://报名的同时抽奖
                    {
                        if (ldListBll.Exist(id, mu.UserID)) { retMod.retmsg = "用户已报名参加过该活动"; RepToClient(retMod); }
                        M_WX_LuckDrawList ldListMod = new M_WX_LuckDrawList();
                        ldListMod.UserID = mu.UserID;
                        ldListMod.UserName = mu.UserName;
                        ldListMod.LuckID = id;
                        List<M_WX_LuckPrize> prizeList = JsonConvert.DeserializeObject<List<M_WX_LuckPrize>>(luckMod.Prize);
                        //总计累加应该为100%
                        prizeList.Add(new M_WX_LuckPrize() { Name = "免单5元", Count_Total = 500, Percent = 20 });
                        prizeList.Add(new M_WX_LuckPrize() { Name = "免单10元", Count_Total = 200, Percent = 10 });
                        prizeList.Add(new M_WX_LuckPrize() { Name = "免单50元", Count_Total = 100, Percent = 9 });
                        prizeList.Add(new M_WX_LuckPrize() { Name = "免单4999元", Count_Total = 3, Percent = 1 });
                        prizeList.Add(new M_WX_LuckPrize() { Name = "免分期服务费", Percent = 20 });
                        prizeList.Add(new M_WX_LuckPrize() { Name = "提高白条额度", Percent = 20 });
                        prizeList.Add(new M_WX_LuckPrize() { Name = "未中奖", Percent = 20 });
                        ldListMod.Prize = LuckDrawPrize(prizeList);
                        ldListBll.Insert(ldListMod);
                        retMod.result = ldListMod.Prize;
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "shake":
                    {
                        //每人可抽三次奖,中奖率约10%
                        if (ldListBll.ExistCount(id, mu.UserID) >= 3) { retMod.retmsg = "已经没有抽奖机会了"; RepToClient(retMod); }
                        if (ldListBll.ExistWithPrize(id, mu.UserID)) { retMod.retmsg = "你已中过奖了,不可重复抽奖";RepToClient(retMod); }
                        M_WX_LuckDrawList ldListMod = new M_WX_LuckDrawList();
                        ldListMod.UserID = mu.UserID;
                        ldListMod.UserName = mu.UserName;
                        ldListMod.LuckID = id;
                        List<M_WX_LuckPrize> prizeList = JsonConvert.DeserializeObject<List<M_WX_LuckPrize>>(luckMod.Prize);
                        ldListMod.Prize = LuckDrawPrize(prizeList);
                        ldListBll.Insert(ldListMod);
                        retMod.result = ldListMod.Prize;
                        retMod.retcode = M_APIResult.Success;
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
    //根据算法获取奖项,返回奖品名称,前端依此定位
    private string LuckDrawPrize(List<M_WX_LuckPrize> list)
    {
        double index = new Random(System.Guid.NewGuid().GetHashCode()).NextDouble();
        index = Convert.ToDouble((index*100).ToString("F2"));
        //已经发了多少奖品
        DataTable dt = SqlHelper.ExecuteTable("SELECT COUNT(*) AS [Count],Prize FROM ZL_WX_LuckDrawList GROUP BY Prize");
        //去除掉已无奖品的
        for (int i = 0; i < list.Count; i++)
        {
            if (list[i].Count_Total == -100) { continue; }
            DataRow[] drs = dt.Select("Prize='" + list[i].Name + "'");
            //如果礼品已送完,则移除该选项
            if (drs.Length > 0 && DataConvert.CLng(drs[0]["Count"]) >= list[i].Count_Total)
            {
                list.Remove(list[i]);
            }
        }
        #region 设定好Index范围
        {
            double totalPercent = 0, multiple = 1;
            for (int i = 0; i < list.Count; i++)
            {
                M_WX_LuckPrize model = list[i];
                if (i == 0)
                {
                    model.Index_Start = 0;
                    model.Index_End = model.Index_Start + model.Percent;
                }
                else
                {
                    M_WX_LuckPrize pre = list[i - 1];
                    model.Index_Start = pre.Index_End + 0.01;
                    model.Index_End = pre.Index_End + model.Percent;
                }
                totalPercent += model.Percent;
            }
            multiple = (totalPercent / 100);
            for (int i = 0; i < list.Count; i++)
            {
                list[i].Index_Start = list[i].Index_Start * multiple;
                list[i].Index_End = list[i].Index_End * multiple;
            }
        }
        #endregion
        M_WX_LuckPrize prizeMod = list.FirstOrDefault(p => (index == p.Index_Start || index == p.Index_End) || (index > p.Index_Start && index < p.Index_End));
        return prizeMod.Name;
    }
    public bool IsReusable { get { return false; } }

}