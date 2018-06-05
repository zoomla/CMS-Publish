using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL;
using ZoomLa.Common;

namespace ZoomLaCMS.Tools
{
    public partial class PPCTools : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                B_Admin.CheckIsLogged(Request.RawUrl);
            }
        }
        protected void Save_Btn_Click(object sender, EventArgs e)
        {
            var json = "var AreaMod=" + Area_Hid.Value;
            FileSystemObject.WriteFile(Server.MapPath("/JS/ICMS/area.js"),json);
            function.WriteSuccessMsg("保存成功","PPCTools.aspx");
           
        }
    }
}