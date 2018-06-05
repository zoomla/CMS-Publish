<%@ WebHandler Language="C#" Class="JSServe" %>

using System;
using System.Web;
using System.Data;
using ZoomLa.SQLDAL;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.CreateJS;
using ZoomLa.Model;
using ZoomLa.Common;
using ZoomLa.PdoApi.TencentIM;
using System.Linq;
using Newtonsoft.Json;

public class JSServe :API_Base,IHttpHandler
{
    B_CodeModel codeBll = new B_CodeModel("ZL_User_TencentIM");
    B_User buser=new B_User();
    public void ProcessRequest(HttpContext context)
    {
        M_UserInfo mu = buser.GetLogin();
        retMod.retcode = M_APIResult.Failed;
        //string result = "{\"returnValue\":1000,\"returnMsg\":\"\",\"returnData\":{\"type\":0,\"userinfo\": {\"headpic\":\"\",\"nickname\":\"咖啡时光\"}}}";
        //var loginInfo = {
        //    'sdkAppID': sdkAppID, 
        //    'appIDAt3rd': sdkAppID, 
        //    'accountType': accountType, 
        //    'identifier': "admin1",
        //    'identifierNick': '咖啡时光', 
        //    'userSig': "eJxlj9FOgzAUhu95iqa3GkfLujATLxTnRgIxG0y33ZC6npIOKRXqlBjfXcUlNvHcft9--nM*PIQQzpPsgu-3zau2he0NYHSJsI-P-6AxShTcFkEr-kF4N6qFgksL7QAJY4z6vusoAdoqqU4GF7XSxOGdqIqh5HfB*DtNCaGhq6hygOlsHcXL6FYl27nZpKN*tl11TWSW-fTmSb7EC16zu3SXLzIBTO6mq7e4zKoJgXV5FufX9Eirx*Z*Q9MHeeCRMIcE5FjPy*cuGUHaXDmVVtVwOigkE0qD0P3pCG2nGj0I1CeM0MD-Gex9el91pl2A",
        //    'headurl': 'img/2016.gif'
        //};
        //retMod.callback = CallBack;//暂不开放JsonP
        if (mu.IsNull) { retMod.retmsg = "请登入后再请求"; RepToClient(retMod); }
        try
        {
            switch (Action)
            {
                case "im_getlogin":
                    {
                        IM_LoginInfo model = GetLoginInfo(mu);
                        retMod.result = JsonConvert.SerializeObject(model);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "live_enter"://进入直播房间(暂定为只有一间)
                    {
                        Live_Return model = new Live_Return();
                        model.loginInfo = GetLoginInfo(mu);
                        model.returnData.hls_play_url = "http://5625.liveplay.myqcloud.com/5625_bc17cc23c0e011e69776e435c87f075e_550.m3u8";
                        model.returnData.playurl = "http://5625.liveplay.myqcloud.com/5625_bc17cc23c0e011e69776e435c87f075e_550.m3u8";
                        model.returnData.userinfo.headpic = "/Images/userface/11.gif";
                        model.returnData.userinfo.nickname = "逐一主播";
                        model.returnData.userinfo.frontcover = "";
                        HttpContext.Current.Response.Clear();
                        HttpContext.Current.Response.Write(JsonConvert.SerializeObject(model));
                        HttpContext.Current.Response.End();
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
    #region Tools
    public IM_LoginInfo GetLoginInfo(M_UserInfo mu)
    {
        DataTable dt = codeBll.SelByUid(mu.UserID);
        DataRow dr = null;
        if (dt.Rows.Count > 0)
        {
            dr = dt.Rows[0];
        }
        else
        {
            C_QQIM_Sign qqsign = new C_QQIM_Sign();
            dr = dt.NewRow();
            dr["UserID"] = mu.UserID;
            dr["IMSign"] = new C_QQIM_Sign().GetUserSign(mu.UserName);//用户必须在IM中有同名用户
            dr["CDate"] = DateTime.Now;
            codeBll.Insert(dr);
        }
        IM_LoginInfo model = new IM_LoginInfo();
        model.sdkAppID = C_QQIM_Contasnt.appid.ToString();
        model.appIDAt3rd = C_QQIM_Contasnt.appid.ToString();
        model.accountType = C_QQIM_Contasnt.accountType.ToString();
        model.identifier = mu.UserName;
        model.identifierNick = mu.HoneyName;
        model.userSig = dr["IMSign"].ToString();
        model.headurl = mu.UserFace;
        return model;
    }
    public bool IsReusable { get { return false; } }
    #endregion
    //----------------------------------------------------------------------------------
    //直播的一些信息,如直播人,房间名,播放地址等 
    public class Live_Return
    {
        public int returnValue = 1000;
        public string returnMsg = "";
        public IM_LoginInfo loginInfo = new IM_LoginInfo();
        public Live_ReturnData returnData = new Live_ReturnData();
    }
    public class Live_ReturnData
    {
        //0:直播回放或点播,1:直播中
        public int type = 1;
        //主播的ID,可不返回,直接用nickname
        public int userid = 0;
        //直播地址
        public string hls_play_url = "";//mu3u8
        //点播或回播地址
        public string playurl = "";//hls
        public int likecount = 1;//点赞人数
        public int viewercount = 1;//观看人数
        //未知可能用于标识直播状态
        public int status = 1;
        public Live_UserInfo userinfo = new Live_UserInfo();
    }
    //主播与房间方面的信息
    public class Live_UserInfo
    {
        public string headpic = "";
        public string nickname = "";
        public string frontcover = "";
    }
    //用户登录信息,用于IM
    public class IM_LoginInfo
    {
        public string sdkAppID = "";
        public string appIDAt3rd = "";
        public string accountType = "";
        public string identifier = "";
        public string identifierNick = "";
        public string userSig = "";
        public string headurl = "";
    }
}