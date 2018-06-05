using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.AppCode.Helper;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.Common;
using ZoomLa.SQLDAL;
using ZoomLa.SQLDAL.SQL;

namespace ZoomLaCMS.Tools.dbdic
{
    //根据表名,筛选中其下的字段
    public partial class SetFieldRemind : System.Web.UI.Page
    {
        public string TbName { get { return Request.QueryString["TbName"] ?? ""; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            B_Admin.CheckIsLogged(Request.RawUrl);
            #region ajax
            M_APIResult retMod = new M_APIResult(M_APIResult.Failed);
            if (function.isAjax())
            {
                string action = (Request["action"] ?? "").ToLower();
                string remind = DataConvert.CStr(Request["remind"]);
                switch (action)
                {
                    case "field_remind":
                        DBDicHelp.Field_SetRemind(Request["tbname"], Request["field"], remind.Trim());
                        retMod.retcode = M_APIResult.Success;
                        break;
                }
                Response.Clear(); Response.Write(retMod.ToString()); Response.Flush(); Response.End();
            }
            #endregion
            if (!IsPostBack)
            {
                if (DBDicHelp.db == null)
                {
                    DBDicHelp.db = SqlBase.CreateHelper("mssql");
                    DBDicHelp.db.ConnectionString = "Data Source=(local);Initial Catalog=dbdic;User ID=test;Password=test;";
                }
                MyBind();
            }
        }
        private void MyBind()
        {
            DataTable fieldDT = DBDicHelp.Field_Sel(TbName, Filter_Chk.Checked ? "all" : "empty");
            //不显示视图中的字段
            DataTable viewDT = DBHelper.View_List(DBDicHelp.db.ConnectionString);
            if (viewDT.Rows.Count > 0)
            {
                string filterStr = "";
                foreach (DataRow dr in viewDT.Rows)
                {
                    filterStr += "'" + dr["name"] + "',";
                }
                fieldDT.DefaultView.RowFilter = "TbName NOT IN (" + filterStr.TrimEnd(',') + ")";
                fieldDT = fieldDT.DefaultView.ToTable();
            }
            Field_RPT.DataSource = fieldDT;
            Field_RPT.DataBind();
        }

        protected void Filter_Chk_CheckedChanged(object sender, EventArgs e)
        {
            MyBind();
        }
    }
}