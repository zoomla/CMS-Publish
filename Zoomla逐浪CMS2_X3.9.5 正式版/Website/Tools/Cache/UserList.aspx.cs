using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.Model;

namespace ZoomLaCMS.Tools.Cache
{
    public partial class UserList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            M_AdminInfo adminMod = B_Admin.GetLogin();
            if (adminMod == null || adminMod.AdminId != 1) { throw new Exception("拒绝访问"); }
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.Add(new DataColumn("Key", typeof(string)));
                dt.Columns.Add(new DataColumn("AddTime"));
                dt.Columns.Add(new DataColumn("LastUpdateTime"));
                dt.Columns.Add(new DataColumn("UserID",typeof(int)));
                dt.Columns.Add(new DataColumn("UserName"));
                dt.Columns.Add(new DataColumn("HoneyName"));
                dt.Columns.Add(new DataColumn("Purse"));
                dt.Columns.Add(new DataColumn("VIP"));
                foreach (string key in ZLCache.UserSession.Keys)
                {
                    M_Cache cache = ZLCache.UserSession[key];
                    M_UserInfo mu = (M_UserInfo)cache.model;
                    DataRow dr = dt.NewRow();
                    dr["Key"] = key;
                    dr["UserID"] = mu.UserID;
                    dr["UserName"] = mu.UserName;
                    dr["HoneyName"] = mu.HoneyName;
                    dr["Purse"] = mu.Purse;
                    dr["VIP"] = mu.VIP;
                    dr["AddTime"] = cache.AddTime;
                    dr["LastUpdateTime"] = cache.LastUpdateTime;
                    dt.Rows.Add(dr);
                }
                RPT.DataSource = dt;
                RPT.DataBind();
            }
        }
    }
}