<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.Zone.ZoneConfig"MasterPageFile="~/Manage/I/Index.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <title>会员空间配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("/{manage}/User/UserManage.aspx","会员管理"),
	new Bread("ZoneConfig.aspx","会员空间管理"),
	new Bread() {url="", text="会员空间配置",addon= "" }}
	)
%>
	<div class="container-fluid pr-0">
    <div class="row sysRow list_choice table-responsive-md">
        <table class="table table-striped table-bordered table-hover sys_table">
            <tr>
                <th class="tdleft w12rem_lg">空间申请是否需要经过审核：</th>
                <td>
                    <input type="checkbox" runat="server" id="RadioButtonList1" class="switchChk" checked="checked" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="Button1" class="btn btn-outline-info" runat="server" Text="保存" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
        <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
</asp:Content>
