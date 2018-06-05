using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.AppCode.Helper;
using ZoomLa.BLL;
using ZoomLa.BLL.API;
using ZoomLa.BLL.CreateJS;
using ZoomLa.Common;
using ZoomLa.SQLDAL;
using ZoomLa.SQLDAL.SQL;

namespace ZoomLaCMS.Tools.dbdic
{
    public partial class Default : System.Web.UI.Page
    {
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
                    case "table_remind":
                        {
                            DBDicHelp.Table_SetRemind(Request["tbname"], remind.Trim());
                            retMod.retcode = M_APIResult.Success;
                        }
                        break;
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
            AllTable_RPT.DataSource = DBDicHelp.Table_Sel(Filter_Chk.Checked ? "empty" : "all");
            AllTable_RPT.DataBind();
        }
        protected void Filter_Chk_CheckedChanged(object sender, EventArgs e)
        {
            MyBind();
        }

        protected void WriteToDList_Btn_Click(object sender, EventArgs e)
        {
            string[] customTables = "ZL_U_|ZL_C_|ZL_P_".Split('|');
            B_CodeModel codeBll = new B_CodeModel("ZL_DataList");
            DataTable dt = DBDicHelp.Table_Sel("full");
            DBCenter.DB.ExecuteNonQuery(new SqlModel() { sql = "TRUNCATE TABLE ZL_DataList" });
            foreach (DataRow dr in dt.Rows)
            {
                DataRow model = codeBll.NewModel();
                string tbname = dr["name"].ToString();
                if (tbname.Equals("ZL_DataList", StringComparison.OrdinalIgnoreCase)) { continue; }
                model["TableName"] = tbname;
                model["Explain"] = dr["value"];
                model["Type"] = 0;
                codeBll.Insert(model);
            }
            function.WriteSuccessMsg("写入完成");
        }
    }
}