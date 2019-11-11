<%@ WebHandler Language="C#" Class="wxapp" %>
using Newtonsoft.Json;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Newtonsoft.Json.Linq;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.Shop;
using ZoomLa.BLL.Helper;
using ZoomLa.BLL.WxPayAPI;
using ZoomLa.BLL.CreateJS;
using ZoomLa.Model;
using ZoomLa.Model.Shop;
using ZoomLa.Components;
using ZoomLa.Common;
using ZoomLa.Sns;
using ZoomLa.Sns.WXAPP;
using ZoomLa.SQLDAL;
using ZoomLa.SQLDAL.SQL;
#region helper
//提供数据获取逻辑
public class WXAppData
{
    public static string siteUrl = SiteConfig.SiteInfo.SiteUrl;
    //对内容中的图片路径进行处理
    public static string H_ImageUrlInContent(string content)
    {
        return content.Replace("/UploadFiles/", siteUrl + "/UploadFiles/");
    }
    //判断字符串是否为空
    public static bool H_IsEmpty(string text)
    {
        return (string.IsNullOrEmpty(text) || text.Equals("undefined"));
    }
    //为图片链接加上域名等信息
    public static string H_ImageUrl(string url)
    {
        if (string.IsNullOrEmpty(url)) { return siteUrl + "/UploadFiles/nopic.gif"; }
        if (url.IndexOf("://") > 0)
        {
            url = url.Replace("://", "");
            int index = url.IndexOf("/");
            url = url.Substring(index, (url.Length - index));
        }
        return siteUrl + function.GetImgUrl(url);
    }
    //获取指定节点下的所有子节点IDS
    public static string H_GetNodeIDS(int nid)
    {
        B_Node nodeBll = new B_Node();
        string nids = "";
        DataTable nodeDT = nodeBll.SelByPid(nid, true);
        foreach (DataRow dr in nodeDT.Rows)
        {
            nids += dr["NodeID"] + ",";
        }
        nids += nid;
        return nids;
    }
    //按条件筛选并统一字段
    public static DataTable Product_Sel(int cpage, int psize, Com_Filter filter)
    {
        List<SqlParameter> sp = new List<SqlParameter>();
        string fields = "id,proname,proinfo,LinPrice AS price,Clearimg as [image]";
        string where = "(ClearImg IS NOT NULL AND ClearImg !='')";
        if (!string.IsNullOrEmpty(filter.nids))
        {
            //H_GetNodeIDS(nid
            where += " AND NodeID IN (" + filter.nids + ")";
        }
        if (filter.pid > 0)//父NodeID节点
        {
            where += " AND NodeID IN (" + H_GetNodeIDS(filter.pid) + ")";
        }
        if (!string.IsNullOrEmpty(filter.skey))
        {
            where += " AND ProName LIKE @skey";
            sp.Add(new SqlParameter("skey", "%" + filter.skey + "%"));
        }
        PageSetting setting = PageSetting.Single(cpage, psize, "ZL_Commodities", "ID", where, "ID DESC", sp, fields);
        DataTable dt = DBCenter.SelPage(setting);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            dt.Rows[i]["image"] = H_ImageUrl(DataConvert.CStr(dt.Rows[i]["image"]));
        }
        return dt;
    }
    //取单条内容
    public static DataTable Content_Get(string title)
    {
        int id = DataConvert.CLng(DBCenter.ExecuteScala("ZL_CommonModel", "GeneralID", "Title=@title", "GeneralID DESC", new List<SqlParameter>() { new SqlParameter("title", title.Trim()) }));
        return Content_Get(id);
    }
    public static DataTable Content_Get(int id)
    {
        if (id < 1) { return new DataTable(); }
        string fields = "A.title,A.generalId,A.createTime,A.inputer,A.nodeId,A.modelId,B.*";
        string tbName = DataConvert.CStr(DBCenter.ExecuteScala("ZL_CommonModel", "TableName", "GeneralID=" + id));
        PageSetting setting = PageSetting.Double(1, 1, "ZL_CommonModel", tbName, "A.GeneralID", "A.ItemID=B.ID", "A.GeneralID=" + id, "", null, fields);
        DataTable dt = DBCenter.SelPage(setting);
        if (dt.Rows.Count > 0)
        {
            DataRow dr = dt.Rows[0];
            if (dt.Columns.Contains("pic")) { dr["pic"] = WXAppData.H_ImageUrl(DataConvert.CStr(dr["pic"])); }
            if (dt.Columns.Contains("images")) { dr["images"] = WXAppData.H_ImageUrlInContent(DataConvert.CStr(dr["images"])); }
            if (dt.Columns.Contains("content")) { dr["content"] = WXAppData.H_ImageUrlInContent(DataConvert.CStr(dr["content"])); }
        }
        return dt;
    }
}//WXAppHelp end;
#endregion
public class wxapp : API_Base, IHttpHandler
{
    B_Favorite favBll = new B_Favorite();
    B_Node nodeBll = new B_Node();
    B_Cart cartBll = new B_Cart();
    B_CartPro cpBll = new B_CartPro();
    B_OrderList orderBll = new B_OrderList();
    B_Product proBll = new B_Product();
    B_Content conBll = new B_Content();
    B_User buser = new B_User();
    B_CodeModel ubBll = new B_CodeModel("ZL_UserBase");
    //---------------
    public string ApiKey = "ZLWXAPP137934j&21";
    public string siteUrl = "https://a036.2018.z01.com/";
    public int AppId {get { return DataConvert.CLng(Req("appId"),1); } }
    //---------------Extend
    B_LiteUser liteBll = new B_LiteUser();
    //首页使用
    private class Packet_Index
    {
        public DataTable img1 = new DataTable();
        public DataTable img2 = new DataTable();
        public DataTable prolist;
    }



    public void ProcessRequest(HttpContext context)
    {
        throw new Exception("closed");
        retMod.retcode = M_APIResult.Failed;
        M_LiteUser litemu = liteBll.SelModelByOpenId(Req("openid"));
        try
        {
            switch (Action)
            {
                #region 节点
                case "node_list"://分类节点信息(首页只显示第二级节点)
                    {
                        string ntype = Req("ntype");
                        DataTable dt = new DataTable();
                        switch (ntype)
                        {
                            case "product":
                                dt = nodeBll.SelByPid(2, true);
                                break;
                            case "content":
                                dt = nodeBll.Sel();
                                break;
                        }
                        dt = dt.DefaultView.ToTable(true, "NodeID", "NodeName");
                        retMod.result = JsonConvert.SerializeObject(dt);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                #endregion
                #region 项目
                case "swiper_list"://获取首页滑动幻灯片
                    {
                        int nid = DataConvert.CLng(Req("nid"));
                        int cpage = DataConvert.CLng(Req("cpage"), 1);
                        int psize = DataConvert.CLng(Req("psize"), 10);
                        PageSetting setting = new PageSetting() { cpage = cpage, psize = psize };
                        setting.t1 = "ZL_CommonModel";
                        setting.t2 = "ZL_C_Article";
                        setting.fields = "A.Title,A.GeneralID,B.pic,A.CreateTime,A.Inputer,B.Synopsis";
                        setting.where = "A.EliteLevel=1 AND A.Status=99 AND NodeID IN (1)";//42
                        setting.order = "CreateTime DESC";
                        setting.on = "A.ItemID=B.ID";

                        DBCenter.SelPage(setting);
                        for (int i = 0; i < setting.dt.Rows.Count; i++)
                        {
                            DataRow dr = setting.dt.Rows[i];
                            dr["pic"] = WXAppData.H_ImageUrl(DataConvert.CStr(dr["pic"]));
                        }
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(setting.dt);
                        //retMod.page = new M_API_Page(setting);
                    }
                    break;
                case "packet_index"://将首页信息打包
                    {
                        Packet_Index model = new Packet_Index();
                        model.img1 = WXAppData.Content_Get("首页_必抢尖货");
                        model.img2 = WXAppData.Content_Get("首页_热销爆款推荐");
                        model.prolist = WXAppData.Product_Sel(1, 6, new Com_Filter() { });
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(model);
                    }
                    break;
                #endregion
                #region 内容
                case "content_list":
                    {
                        //专用修改,只允许上传一个节点ID,节点取第一个绑定的模型
                        int nid = DataConvert.CLng(Req("nid"));//要取哪个节点的数据
                        int elite = DataConvert.CLng(Req("elite"));//是否只抽推荐内容
                        int modelId = DataConvert.CLng(DataConvert.CStr(DBCenter.ExecuteScala("ZL_Node", "ContentModel", "NodeID=" + nid)).Split(',')[0]);
                        string ids = Req("ids");
                        //----------------------
                        if (nid < 1) { throw new Exception("未指定节点"); }
                        if (modelId < 1) { throw new Exception("未绑定模型"); }
                        int cpage = DataConvert.CLng(Req("cpage"), 1);
                        int psize = DataConvert.CLng(Req("psize"), 10);
                        PageSetting setting = new PageSetting() { cpage = cpage, psize = psize };
                        setting.pk = "GeneralID";
                        setting.t1 = "ZL_CommonModel";
                        setting.on = "A.ItemID=B.ID";
                        setting.fields = "A.Title,A.GeneralID,A.CreateTime,A.Inputer,A.TopImg";
                        setting.fields += ",B.*";
                        setting.where = "A.Status=99 AND NodeID IN (" + nid + ")";
                        if (!string.IsNullOrEmpty(ids))
                        {
                            SafeSC.CheckDataEx(ids);
                            setting.where += " AND GeneralID IN (" + ids + ")";
                        }
                        if (elite > 0) { setting.where += " AND EliteLevel=1 "; }
                        setting.order = "OrderID DESC,GeneralID DESC";
                        string tbName = DataConvert.CStr(DBCenter.ExecuteScala("ZL_Model", "TableName", "ModelID=" + modelId));
                        setting.t2 = tbName;

                        DBCenter.SelPage(setting);
                        //------------修改缩略图路径(统一使用Pic字段)
                        for (int i = 0; i < setting.dt.Rows.Count; i++)
                        {
                            DataRow dr = setting.dt.Rows[i];
                            dr["TopImg"] = WXAppData.H_ImageUrl(DataConvert.CStr(dr["TopImg"]));
                        }
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(setting.dt);
                        retMod.page = new M_API_Page(setting);
                    }
                    break;
                case "content_add"://添加一篇内容
                    {
                        //正文与附属内容
                        string content = Req("content");
                        string addon = Req("addon");
                        if (string.IsNullOrEmpty(content)) { throw new Exception("未指定内容"); }
                        if (string.IsNullOrEmpty(addon)) { throw new Exception("未指定附表内容"); }

                        M_CommonData conMod = JsonConvert.DeserializeObject<M_CommonData>(content);
                        string tbname = DataConvert.CStr(DBCenter.ExecuteScala("ZL_Model", "TableName", "ModelID=" + conMod.ModelID));
                        conMod.Status = (int)ZLEnum.ConStatus.Recycle;
                        conMod.CreateTime = DateTime.Now;
                        conMod.UpDateTime = DateTime.Now;
                        conMod.TableName = tbname;
                        DataTable dt = JsonConvert.DeserializeObject<DataTable>("[" + addon + "]");
                        DataRow dr = dt.Rows[0];
                        //--------------------------
                        conMod.ItemID = DBCenter.Insert(tbname, BLLCommon.GetFields(dr), BLLCommon.GetParas(dr), BLLCommon.GetParameters(dr));
                        conMod.GeneralID = DBCenter.Insert(conMod);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = conMod.GeneralID.ToString();
                    }
                    break;
                case "content_get"://单条内容获取,用于显示内容详情
                    {
                        int id = DataConvert.CLng(Req("id"));
                        DataTable dt = WXAppData.Content_Get(id);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(dt);
                    }
                    break;
                #endregion
                #region 商品
                case "index_tops"://首页推荐滚动图与商品
                    {
                        int nid = DataConvert.CLng(Req("nid"));
                        DataTable dt = WXAppData.Product_Sel(1, 4, new Com_Filter()
                        {
                            pid = nid
                        });
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(dt);
                    }
                    break;
                case "product_list"://根据节点等条件获取商品列表
                    {
                        int nid = DataConvert.CLng(Req("nid"));
                        int cpage = DataConvert.CLng(Req("cpage"), 1);
                        int psize = DataConvert.CLng(Req("psize"), 12);
                        DataTable dt = new DataTable();
                        PageSetting setting = new PageSetting()
                        {
                            t1 = "ZL_Commodities",
                            fields = "ID,Proname,Proinfo,LinPrice,Clearimg"
                        };
                        setting.cpage = cpage;
                        setting.psize = psize;
                        if (nid > 1)//获取其和其下子节点的数据
                        {
                            setting.where = "NodeID IN (" + WXAppData.H_GetNodeIDS(nid) + ")";
                        }
                        else { setting.where = " 1=1 "; }
                        dt = DBCenter.SelPage(setting);
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            dt.Rows[i]["Clearimg"] = WXAppData.H_ImageUrl(DataConvert.CStr(dt.Rows[i]["Clearimg"]));
                        }
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(dt);
                        retMod.page = new M_API_Page(setting);
                    }
                    break;
                case "product_get"://商品详情信息
                    {
                        int id = DataConvert.CLng(Req("id"));
                        M_Product proMod = proBll.GetproductByid(id);
                        proMod.Procontent = proMod.Procontent.Replace("/UploadFiles/", siteUrl + "/UploadFiles/");
                        proMod.Clearimg = WXAppData.H_ImageUrl(proMod.Clearimg);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(proMod);
                    }
                    break;
                #endregion
                #region 会员
                case "user_getlast"://用户获取本身的最新信息
                    {
                        litemu = liteBll.SelReturnModel(litemu.userId);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(litemu);
                    }
                    break;
                case "user_list"://[extend]
                    {
                        int storeId = DataConvert.CLng(Req("storeId"));
                        if (storeId < 1) { throw new Exception("未指定教练信息"); }
                        DataTable dt = liteBll.Sel(new Com_Filter()
                        {
                            storeId = storeId
                        });
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(dt);
                    }
                    break;
                case "user_info"://根据openid或者独有标识,获取会员信息
                    {
                        //retMod.retcode = M_APIResult.Success;
                        //retMod.result = JsonConvert.SerializeObject(new M_AJAXUser(mu));
                    }
                    break;
                case "user_login_openid"://用户使用微信的openid登录,仅用于教练登录
                    {
                        string code = DataConvert.CStr(Req("code"));
                        string openid = GetOpenIdByCode(code,AppId);
                        if (string.IsNullOrEmpty(openid)) { throw new Exception("用户授权失效"); }
                        if (DBCenter.IsExist("ZL_User", "CompanyName='" + openid + "' AND GroupId>1"))
                        {
                            //已存在,直接返回
                            M_LiteUser liteMod = liteBll.SelModelByOpenId(openid);
                            retMod.retcode = M_APIResult.Success;
                            retMod.result = JsonConvert.SerializeObject(liteMod);
                        }
                        else
                        {
                            retMod.retmsg = "微信尚未关联用户";
                        }
                    }
                    break;
                case "user_sync"://根据openid,用户自动注册或登录
                    {
                        //检测该微信用户是否已存在,新增或直接返回用户信息
                        string code = DataConvert.CStr(Req("code"));
                        string openid = GetOpenIdByCode(code, AppId);
                        if (string.IsNullOrEmpty(openid)) { throw new Exception("用户授权失效"); }
                        if (DBCenter.IsExist("ZL_User", "CompanyName='" + openid + "'"))
                        {
                            //已存在,直接返回
                            M_LiteUser liteMod = liteBll.SelModelByOpenId(openid);
                            retMod.retcode = M_APIResult.Success;
                            retMod.result = JsonConvert.SerializeObject(liteMod);
                        }
                        else
                        {
                            //不存在则新建用户再返回
                            string uname = "wechat" + DateTime.Now.ToString("yyyyMMdd") + function.GetRandomString(6);
                            M_UserInfo newmu = buser.NewUser(uname, function.GetRandomString(6), function.GetRandomEmail());
                            newmu.CompanyName = openid;//用于存储openid
                            newmu.UserFace = Req("userFace");
                            newmu.HoneyName = Req("honeyName");
                            newmu.GroupID = 1;
                            newmu.ParentUserID = "1";//推荐人暂默认为admin
                            newmu.UserID = buser.Add(newmu);
                            M_Uinfo basemu = new M_Uinfo();
                            basemu.UserId = newmu.UserID;
                            buser.AddBase(basemu);
                            //DBCenter.UpdateSQL(basemu.TbName, "xy_km='未分配'", "userId=" + newmu.UserID);
                            //----------------------------
                            litemu = liteBll.SelReturnModel(newmu.UserID);
                            retMod.retcode = M_APIResult.Success;
                            retMod.result = JsonConvert.SerializeObject(litemu);
                        }

                    }
                    break;
                case "user_code"://根据code更新绑定openid
                    {
                        int uid = DataConvert.CLng(Req("uid"));
                        string code = DataConvert.CStr(Req("code"));
                        if (uid < 1) { throw new Exception("未指定用户"); }
                        //-----------------
                        try
                        {
                            string openid = GetOpenIdByCode(code,AppId);
                            DBCenter.UpdateSQL("ZL_User", "CompanyName=@openid", "UserID=" + uid,
                                                        new List<SqlParameter>() { new SqlParameter("openid", openid) });
                            retMod.result = openid;
                            retMod.retcode = M_APIResult.Success;
                        }
                        catch (Exception ex) { retMod.retmsg = "Conver err:" + ex.Message; }
                    }
                    break;
                case "user_register"://用户注册
                    {
                        string name = Req("name");
                        string passwd = Req("passwd");
                        string email = Req("email");
                        int gid = DataConvert.CLng(Req("gid"),1);
                        if (string.IsNullOrEmpty(name)) { throw new Exception("用户名不能为空"); }
                        else if (string.IsNullOrEmpty(passwd)) { throw new Exception("密码不能为空"); }
                        else
                        {
                            M_UserInfo newmu = buser.NewUser(name, passwd,email);
                            newmu.CompanyName = "";//用于存储openid
                            newmu.UserFace = "/Images/userface/noface.png";
                            newmu.GroupID = gid;
                            newmu.ParentUserID = "1";//推荐人暂默认为admin
                            newmu.UserID = buser.Add(newmu);
                            M_Uinfo basemu = new M_Uinfo();
                            basemu.UserId = newmu.UserID;
                            buser.AddBase(basemu);
                            DBCenter.UpdateSQL(basemu.TbName, "xy_km='未分配'", "userId="+newmu.UserID);
                            //----------------------------
                            litemu = liteBll.SelReturnModel(newmu.UserID);
                            retMod.retcode = M_APIResult.Success;
                            retMod.result = JsonConvert.SerializeObject(litemu);
                        }
                    }
                    break;
                case "user_login_passwd"://通过用户名与密码登录
                    {
                        string name = Req("name");
                        string passwd = Req("passwd");
                        if (string.IsNullOrEmpty(name)) { retMod.retmsg = "用户名不能为空"; }
                        else if (string.IsNullOrEmpty(passwd)) { retMod.retmsg = "密码不能为空"; }
                        else
                        {
                            litemu = liteBll.SelModelByPasswd(name, passwd);
                            if (litemu==null) { retMod.retmsg = "用户名或密码错误"; }
                            else
                            {
                                retMod.retcode = M_APIResult.Success;
                                retMod.result = JsonConvert.SerializeObject(litemu);
                            }
                        }
                    }
                    break;
                case "user_update"://更新用户信息
                    {
                        M_UserInfo mu = buser.SelReturnModel(litemu.userId);
                        M_Uinfo basemu = buser.GetUserBaseByuserid(litemu.userId);
                        if (mu.IsNull) { throw new Exception("用户不存在"); }
                        ////传递模型上来,进行修改,不需要修改的留为空值
                        M_LiteUser lite = JsonConvert.DeserializeObject<M_LiteUser>(Req("mu"));
                        //检测手机号或身份证号不可重复,允许为空
                        if (!string.IsNullOrEmpty(lite.mobile) && !lite.mobile.Equals(basemu.Mobile))
                        {
                            List<SqlParameter> sp = new List<SqlParameter>()
                            { new SqlParameter("mobile",lite.mobile)};
                            if (DBCenter.IsExist("ZL_UserBase", "mobile=@mobile", sp))
                            {
                                throw new Exception("手机号已存在,请校验号码是否正确");
                            }
                        }
                        if (!string.IsNullOrEmpty(lite.idcard) && !lite.idcard.Equals(basemu.IDCard))
                        {
                            List<SqlParameter> sp = new List<SqlParameter>()
                            { new SqlParameter("idcard",lite.idcard)};
                            if (DBCenter.IsExist("ZL_UserBase", "idcard=@idcard", sp))
                            {
                                throw new Exception("证件号已存在,请校验号码是否正确");
                            }
                        }
                        mu.HoneyName = lite.honeyName;
                        mu.UserFace = lite.userFace;
                        buser.UpdateByID(mu);
                        basemu.Mobile = lite.mobile;
                        basemu.CardType = lite.cardType;
                        basemu.IDCard = lite.idcard;
                        basemu.UserSex = lite.sex == "男" ? true : false;
                        basemu.Address = lite.address;
                        basemu.Bugle = lite.age;
                        if (basemu.UserId == 0)
                        {
                            basemu.UserId = mu.UserID;
                            buser.AddBase(basemu);
                        }
                        else { buser.UpdateBase(basemu); }
                        //----------------
                        lite = liteBll.SelReturnModel(mu.UserID);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(lite);
                    }
                    break;
                case "user_updatepos"://仅用于更新理位置
                    {
                        int uid = DataConvert.CLng(Req("uid"));
                        string address = DataConvert.CStr(Req("address"));
                        string pos = DataConvert.CStr(Req("pos"));//lat,lng
                        if (uid < 1) { throw new Exception("未指定用户"); }
                        List<SqlParameter> sp = new List<SqlParameter>()
                        {
                            new SqlParameter("address",address),
                            new SqlParameter("pos",pos)
                        };
                        DBCenter.UpdateSQL("ZL_UserBase", "address=@address,xy_pos=@pos", "UserID=" + uid, sp);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "user_star_is"://用户是否已收藏,默认只用于内容
                    {
                        int uid = DataConvert.CLng(Req("uid"));
                        int gid = DataConvert.CLng(Req("gid"));
                        int type = DataConvert.CLng(Req("type"),1);
                        if (uid < 1) { throw new Exception("未指定用户"); }
                        if (gid < 1) { throw new Exception("未指定内容"); }
                        string where = "owner=" + uid + " AND InfoID=" + gid + " AND FavoriType="+type;
                        bool result = DBCenter.IsExist("ZL_Favorite", where);
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = result ? "1" : "0";
                    }
                    break;
                case "user_star_add"://用户收藏功能
                    {
                        int uid = DataConvert.CLng(Req("uid"));
                        int gid = DataConvert.CLng(Req("gid"));
                        int type = DataConvert.CLng(Req("type"),1);
                        if (uid < 1) { throw new Exception("未指定用户"); }
                        if (gid < 1) { throw new Exception("未指定内容"); }

                        M_Favorite favMod = new M_Favorite();
                        favMod.Owner = uid;
                        favMod.InfoID = gid;
                        favMod.Title = Req("title");
                        favMod.FavUrl = Req("url");
                        favMod.FavoriType = type;
                        favBll.AddFavorite(favMod);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "user_star_del":
                    {
                        int uid = DataConvert.CLng(Req("uid"));
                        int gid = DataConvert.CLng(Req("gid"));
                        int type = DataConvert.CLng(Req("type"), 1);
                        if (uid < 1) { throw new Exception("未指定用户"); }
                        if (gid < 1) { throw new Exception("未指定内容"); }
                        favBll.U_Del(uid, gid, type);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "user_star_list":
                    {
                        int uid = DataConvert.CLng(Req("uid"));
                        if (uid < 1) { throw new Exception("未指定用户"); }
                        string where = "owner=" + uid;
                        DataTable dt = DBCenter.Sel("ZL_Favorite", where, "FavoriteID DESC");
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(dt);
                    }
                    break;
                #endregion
                #region 购物车
                case "cart_num"://[e]
                    {
                        //修改购物车数量
                        int id = DataConvert.CLng(Req("id"));
                        int num = DataConvert.CLng(Req("num"));
                        if (id < 1 || num < 1) { throw new Exception("参数不正确"); }
                        M_Cart cartMod = cartBll.SelReturnModel(id);
                        cartMod.Pronum = num;
                        cartMod.AllMoney = cartMod.Pronum * Convert.ToDouble(cartMod.FarePrice);
                        cartBll.UpdateByID(cartMod);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "cart_add"://增加或减少购物车数量
                    {
                        int proID = DataConvert.CLng(Req("proid"));
                        int proNum = DataConvert.CLng(Req("pronum"), 1);
                        string op = DataConvert.CStr(Req("op"));//+ -
                        M_Product proMod = proBll.GetproductByid(proID);
                        M_Cart cartMod = cartBll.SelModelByWhere(litemu.userId, proID);
                        if (cartMod == null)
                        {
                            cartMod = new M_Cart();
                            cartMod.Cartid = litemu.userId.ToString();
                            cartMod.userid = litemu.userId;
                            cartMod.ProID = proID;
                            cartMod.Pronum = 0;
                            cartMod.Proname = proMod.Proname;
                        }
                        switch (op)
                        {
                            case "-":
                                cartMod.Pronum -= proNum;
                                break;
                            default:
                                cartMod.Pronum += proNum;
                                break;
                        }
                        if (cartMod.Pronum < 1) { cartMod.Pronum = 1; }
                        cartMod.FarePrice = proMod.LinPrice.ToString();
                        cartMod.AllMoney = cartMod.Pronum * proMod.LinPrice;
                        if (cartMod.ID > 0) { cartBll.UpdateByID(cartMod); }
                        else { cartBll.insert(cartMod); }
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "cart_del":
                    {
                        string ids = Req("ids");
                        if (string.IsNullOrEmpty(ids)) { ids = Req("id"); }
                        cartBll.U_DelByIDS(ids, litemu.userId);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "cart_list":
                    {
                        DataTable dt = SelByCartID(litemu.userId);
                        for (int i = 0; i < dt.Rows.Count; i++)
                        {
                            dt.Rows[i]["proimg"] = WXAppData.H_ImageUrl(DataConvert.CStr(dt.Rows[i]["proimg"]));
                        }
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(dt);
                    }
                    break;
                #endregion
                #region 订单
                case "order_get":
                    {
                        int id = DataConvert.CLng(Req("id"));
                        M_OrderList orderMod = orderBll.SelReturnModel(id);
                        if (orderMod == null) { throw new Exception("订单不存在"); }
                        retMod.retcode = M_APIResult.Success;
                        retMod.result = JsonConvert.SerializeObject(orderMod);
                    }
                    break;
                case "order_list":
                    {
                        string fast = Req("fast");
                        int cpage = DataConvert.CLng(Req("cpage"));
                        int uid = DataConvert.CLng(Req("uid"));
                        string where = "OrderStatus>=0 AND A.Aside=0 ";
                        switch (fast)
                        {
                            case "needpay":
                                where += " AND A.PaymentStatus=0";
                                break;
                            case "receive":
                                where += " AND A.StateLogistics=1";
                                break;
                            default:
                                break;
                        }
                        PageSetting setting = new PageSetting()
                        {
                            cpage = cpage,
                            t1 = "ZL_OrderInfo",
                            where = where,
                            order = "ID DESC",
                        };
                        DBCenter.SelPage(setting);
                        retMod.retcode = M_APIResult.Success;
                        retMod.page = new M_API_Page(setting);
                        //--------附加上购物车数据
                        string ids = StrHelper.GetIDSFromDT(setting.dt, "ID");
                        if (!string.IsNullOrEmpty(ids))
                        {
                            string fields = "CartId,ProID,AllMoney,Thumbnails,ProName,Pronum,ID";
                            DataTable cartDT = DBCenter.SelWithField("ZL_CartProView",fields, "ID IN (" + ids + ")");
                            retMod.addon = cartDT;
                        }
                        retMod.result = JsonConvert.SerializeObject(setting.dt);
                    }
                    break;
                case "order_del":
                    {
                        int id = DataConvert.CLng(Req("id"));
                        DBCenter.UpdateSQL("ZL_OrderInfo","OrderStatus="+(int)M_OrderList.StatusEnum.CancelOrder,"ID="+id);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                case "order_comment_add"://添加评论
                    {
                        B_Order_Share cmtBll = new B_Order_Share();
                        M_Order_Share cmtMod = JsonConvert.DeserializeObject<M_Order_Share>(Req("model"));
                        M_OrderList orderMod = orderBll.SelReturnModel(cmtMod.OrderID);
                        if (orderMod == null) { throw new Exception("订单不存在"); }
                        if (orderMod.IsCount) { throw new Exception("订单已被评论过"); }
                        if (orderMod.Userid != cmtMod.UserID) { throw new Exception("无权评论该订单"); }
                        orderMod.IsCount = true;
                        orderBll.UpdateByID(orderMod);
                        cmtBll.Insert(cmtMod);
                        retMod.retcode = M_APIResult.Success;
                    }
                    break;
                #endregion
                case "payment_cart"://购物车生成订单后支付
                    {
                        WXAPPAPI api = WXAPPAPI.Code_Get(AppId);
                        B_Payment payBll = new B_Payment();
                        //需要生成订单的购物车数据ID
                        string ids = DataConvert.CStr(Req("ids"));
                        M_UserInfo mu = buser.SelReturnModel(litemu.userId);
                        M_LiteUser liteMod = liteBll.SelReturnModel(mu.UserID);
                        DataTable cartDT = DBCenter.Sel("ZL_Cart", "ID IN (" + ids + ")");
                        M_OrderList orderMod = orderBll.NewOrder(mu, M_OrderList.OrderEnum.Normal);
                        foreach (DataRow dr in cartDT.Rows)
                        {
                            orderMod.Ordersamount += Convert.ToDouble(dr["AllMoney"]);
                        }
                        orderMod.id = orderBll.insert(orderMod);
                        M_Payment payMod = payBll.CreateByOrder(orderMod);
                        payMod.PaymentID = payBll.Add(payMod);

                        cpBll.CopyToCartPro(mu, cartDT, orderMod.id);
                        retMod.retcode = M_APIResult.Success;

                        retMod.result = api.CreatePayment(liteMod, payMod);

                    }
                    break;
                //case "payment_order"://根据订单支付
                //    {

                //    }
                //    break;
                //case "payment_checkout"://根据金额支付
                //    {
                //        #region 支付
                //        WXAPPAPI api = WXAPPAPI.Code_Get();
                //        int uid = DataConvert.CLng(Req("uid"));
                //        double money = DataConvert.CDouble(Req("money"));
                //        M_LiteUser liteMod = liteBll.SelReturnModel(uid);
                //        retMod.result = api.CreatePayment(liteMod, money);
                //        retMod.retcode = M_APIResult.Success;
                //        #endregion
                //    }
                //    break;
                //case "payment_checkout"://生成支付参数给客户端
                //    {
                //        #region 支付
                //        M_WX_APPID appMod = new B_WX_APPID().SelReturnModel(AppId);
                //        B_Payment payBll = new B_Payment();
                //        M_Payment payMod = new M_Payment();
                //        payMod.UserID = 1;
                //        payMod.MoneyReal = DataConvert.CDouble(Req("money"));
                //        if (payMod.MoneyReal < 1) { payMod.MoneyReal = 1; }
                //        payMod.PayNo = payBll.CreatePayNo();
                //        payMod.Remark = "wxpay";

                //        //appMod.APPID = "wx09dad97631f554e8";
                //        //appMod.Secret = "9abd0937154b41f3109631cc9c9fb631";
                //        //appMod.Pay_AccountID = "1511562441";
                //        //appMod.Pay_Key = "wfew32o32ofLF230fklflfelfewlfewl";
                //        if (string.IsNullOrEmpty(appMod.APPID)) { throw new Exception("未设置APPID"); }
                //        if (string.IsNullOrEmpty(appMod.Secret)) { throw new Exception("未指定Secret"); }
                //        if (string.IsNullOrEmpty(appMod.Pay_AccountID)) { throw new Exception("未设置商户号"); }
                //        if (string.IsNullOrEmpty(appMod.Pay_Key)) { throw new Exception("未设置支付Key"); }
                //        string notifyUrl = SiteConfig.SiteInfo.SiteUrl + "/payonline/return/WxPayReturn.aspx";

                //        M_LiteUser liteMod = liteBll.SelReturnModel(16);
                //        WxPayData wxdata = new WxPayData();
                //        wxdata.SetValue("out_trade_no", payMod.PayNo);
                //        wxdata.SetValue("body", string.IsNullOrEmpty(payMod.Remark) ? "微信支付" : payMod.Remark);
                //        wxdata.SetValue("total_fee", (int)(payMod.MoneyReal * 100));
                //        wxdata.SetValue("trade_type", "JSAPI");
                //        wxdata.SetValue("notify_url", notifyUrl);
                //        wxdata.SetValue("product_id", "123");//必填
                //        wxdata.SetValue("openid",liteMod.openid);//公众号支付必填
                //        wxdata.SetValue("nonce_str", WxAPI.nonce);
                //        wxdata.PayKey = appMod.Pay_Key;

                //        //获取预支付单号
                //        WxPayData result = WxPayApi.UnifiedOrder(wxdata, appMod, 20);
                //        // if (result.GetValue("return_code").ToString().Equals("FAIL")) { retMod.retmsg = result.GetValue("return_msg").ToString(); }

                //        string prepay_id = result.GetValue("prepay_id").ToString();
                //        //payBll.UpdatePlat(payMod.PaymentID, M_PayPlat.Plat.WXPay, appMod.ID.ToString());
                //        string timestr = WxAPI.HP_GetTimeStamp();
                //        string stringA = "appId=" + appMod.APPID + "&nonceStr=" + WxAPI.nonce + "&package=prepay_id=" + prepay_id + "&signType=MD5&timeStamp=" + timestr;
                //        string stringSignTemp = stringA + "&key=" + appMod.Pay_Key;
                //        string paySign = StringHelper.MD5(stringSignTemp).ToUpper();
                //        retMod.retcode = M_APIResult.Success;
                //        retMod.result = JsonHelper.GetJson(
                //            new string[] { "timeStamp", "nonceStr", "package", "signType", "paySign" }
                //        , new string[] { timestr, WxAPI.nonce, "prepay_id=" + prepay_id, "MD5", paySign });
                //        #endregion
                //    }
                //    break;

                default:
                    retMod.retmsg = "[" + Action + "]接口不存在";
                    break;
            }
        }
        catch (Exception ex) { ZLLog.L(ex.Message); retMod.retmsg = ex.Message; }
        RepToClient(retMod);
    }
    #region Tools

    public bool IsReusable { get { return false; } }

    //==========================================Logical
    public DataTable SelByCartID(int uid)
    {
        string fields = "A.id,A.proid,A.pronum";
        fields += ",B.proname,B.LinPrice as price,B.Clearimg as proimg";
        string where = "";
        //SqlParameter[] sp = new SqlParameter[] { new SqlParameter("cartid", cartid) };
        //if (uid > 0) { where = " (A.Cartid=@cartid OR A.UserID=" + uid + ")"; } else { where = " A.Cartid=@cartid"; }
        where = " A.UserID=" + uid;
        where += " AND B.LinPrice IS NOT NULL";
        //--------------------------------------
        string sql = "SELECT " + fields + " FROM ZL_Cart A LEFT JOIN ZL_Commodities B ON A.ProID=B.ID WHERE " + where;
        //自营商品,店铺商品
        DataTable dt = SqlHelper.ExecuteTable(sql, null);
        return dt;
    }
    #endregion

    //==========================================Model
    /// <summary>
    /// 获取用户的openid
    /// *开发环境下也可获取到openid
    /// </summary>
    public string GetOpenIdByCode(string code,int appId)
    {
        M_WX_APPID appMod = new B_WX_APPID().SelReturnModel(appId);
        if (string.IsNullOrEmpty(code)) { throw new Exception("未指定code"); }
        string url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + appMod.APPID + "&secret=" + appMod.Secret + "&js_code=" + code + "&grant_type=authorization_code";
        string result = APIHelper.GetWebResult(url);
        if (!result.Contains("openid")) { throw new Exception("未获取到opneid:" + result+","+code); }
        JObject json = JsonConvert.DeserializeObject<JObject>(result);
        string openid = json["openid"].ToString();
        return openid;
    }
}
