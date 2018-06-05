using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.AppCode.Helper;
using ZoomLa.BLL;
using ZoomLa.Common;
using ZoomLa.SQLDAL;

namespace ZoomLaCMS.Tools.dbdic
{
    public partial class Tools : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            B_Admin.CheckIsLogged(Request.RawUrl);
            if (!IsPostBack)
            {
                
            }
        }

        protected void HasDelTables_Btn_Click(object sender, EventArgs e)
        {
            DataTable dt = GetOldTables();
            result_div.InnerHtml = "";
            foreach (DataRow dr in dt.Rows)
            {
                result_div.InnerHtml += dr["name"] + ",";
            }
            if (string.IsNullOrEmpty(result_div.InnerHtml)) { result_div.InnerHtml = "无已删除的表"; }
        }

        protected void DelOldTable_Btn_Click(object sender, EventArgs e)
        {
            DataTable dt = GetOldTables();
            foreach (DataRow dr in dt.Rows)
            {
                DBDicHelp.Table_Del(dr["name"].ToString());
            }
            function.WriteSuccessMsg("操作成功");
        }
        //-------------------
        private DataTable GetOldTables()
        {
            DataTable dicdt = DBDicHelp.db.Table_List();
            DataTable nowdt = DBCenter.DB.Table_List();
            dicdt.Columns.Add(new DataColumn("old",typeof(int)));
            //对比dictdt比nowdt多了哪些表
            foreach (DataRow dr in dicdt.Rows)
            {
                string tbname = dr["name"].ToString();
                if (nowdt.Select("name='" + tbname + "'").Length < 1) { dr["old"] = 1; }
                else { dr["old"] = 0; }
            }
            dicdt.DefaultView.RowFilter = "old='1'";
            return dicdt.DefaultView.ToTable();
        }
    }
}