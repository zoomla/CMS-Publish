using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ZoomLa.BLL.Helper;
using ZoomLa.Common;

namespace ZoomLaCMS.Tools
{
    public partial class BarContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Sure_Btn_Click(object sender, EventArgs e)
        {
            string content = CompressContent_T.Text;
            if (string.IsNullOrEmpty(content)) { function.WriteErrMsg("内容为空"); }
            try
            {
                UnCompressContent.InnerHtml = StrHelper.DecompressString(content);
            }
            catch (Exception ex) { UnCompressContent.InnerHtml = "<div style='color:red;'>"+ex.Message+"</div>"; }
        }
    }
}