<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="ZoomLaCMS.Tools.UpdateCMS.Default"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" rel="stylesheet" href="/dist/css/weui.min.css" />
<link type="text/css" rel="stylesheet" href="/dist/css/bootstrap.min.css" />
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
<![endif]-->
<link rel="stylesheet" href="/dist/css/font-awesome.min.css?v=1"/>
<script src="/JS/jquery.min.js"></script>
<script src="/dist/js/bootstrap.min.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
</head>
<body>
<form id="form1" runat="server">
 <div class="container" style="margin-top:20px;">
<table class="table table-bordered">
    <tr><td colspan="2" style="background-color:#93c8ee;color:#fff;text-align:center;"><i class="fa fa-upload"></i> 站点升级工具</td></tr>
    <tr><td style="width:120px;">站点信息</td><td style="color:green;"><%=ZoomLa.Components.SiteConfig.SiteInfo.SiteName %>(<%=ConfigurationManager.AppSettings["Version"] %>)
                     </td></tr>
    <tr>
        <td>文件目录</td>
        <td>
            <asp:TextBox runat="server" ID="NewCMSDir_T" class="form-control" Text=""/>
            <asp:RequiredFieldValidator runat="server" ID="C1" ForeColor="Red"  ErrorMessage="文件目录不能为空" ControlToValidate="NewCMSDir_T" Display="Dynamic"/>
            <span style="color: green;">请填入新版CMS目录,示例:E:\NewCMS\Website\</span>
        </td>
    </tr>
    <tr>
        <td>忽略文件|目录<br />
            <div><asp:Button runat="server" ID="SaveCfg_Btn" class="btn btn-info" OnClick="SaveCfg_Btn_Click" Text="保存配置" /></div>
        </td>
        <td>
            <asp:TextBox runat="server" TextMode="MultiLine" class="form-control" Rows="5" ID="Ignore_T"/>
            <div class="alert alert-info" style="margin-top:5px;">文件以换行分隔</div>
        </td>
    </tr>
<%--    <tr><td>操作</td><td>
    <asp:Button runat="server" Text="更新/Bin/目录" class="btn btn-info"  ID="CopyBin_Btn" OnClick="CopyBin_Btn_Click" OnClientClick="return confirm('确定要清空Bin目录并重新拷贝吗');" />
                </td></tr>--%>
    <tr>
        <td colspan="2">
            <div runat="server" id="remind_div" class="alert alert-danger" visible="false">没有需要更新的文件</div>
            <div style="overflow-y:auto;max-height:700px;">
                <table class="table table-bordered table-striped">
                <tr><td>文件操作</td><td>名称</td><td>文件路径</td></tr>
                <asp:Repeater runat="server" ID="RPT">
                    <ItemTemplate>
                        <tr>
                            <td>
                               <%#ShowCompare() %>
                            </td>
                            <td style="width:180px;"><%#Eval("Name") %></td>
                            <%--      <td><%#Eval("MD5") %></td>--%>
                            <td style="width:600px;"><%#Eval("VPath") %></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
            </div>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button runat="server" ID="BeginCheck_Btn" Text="仅检测不更新" class="btn btn-info" OnClick="BeginCheck_Btn_Click"/>
            <asp:Button runat="server" ID="CMSUpdate_Btn" Text="全站更新" class="btn btn-primary"
                OnClick="CMSUpdate_Btn_Click" OnClientClick="return subif('确定要全站更新吗');"/>
        </td>
    </tr>
</table>
</div>     
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function subif(msg) {
        if (!confirm(msg)) { return false; }
        comdiag.ShowMask("正在处理请求");
        return true;
    }
</script>
<script runat="server">
    public string ShowCompare()
    {
        switch (Convert.ToInt32(Eval("Compare")))
        {
            case 1:
                return "<span style='color:red;'>增加</span>";
            case 2:
                return "<span style='color:green;'>更新</span>";
            default:
                return "";
        }
    }
</script>
</form>
</body>
</html>