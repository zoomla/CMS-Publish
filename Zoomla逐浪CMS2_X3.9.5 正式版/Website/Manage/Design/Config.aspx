<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.Config" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>动力配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","动力模块"),
        new Bread() {url="", text="动力配置",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-bordered sys_table">
        <tr>
            <th class="w12rem_lg">动力域名</th>
            <td>
                <asp:TextBox runat="server" ID="Domain_T" CssClass="form-control max20rem" />
				<small class="text-muted">格式:site.z01.com</small>
			</td>
        </tr>
        <tr>
            <th>微站点数</th>
            <td>
                <ZL:TextBox runat="server" ID="MBSiteCount_T" CssClass="form-control max20rem" ValidType="Int" AllowEmpty="false" />
				<small class="text-muted">每个用户所能拥有的微站点数量</small>
				</td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button runat="server" ID="Save_Btn" CssClass="btn btn-outline-info" OnClick="Save_Btn_Click" Text="保存配置" /></td>
        </tr>
    </table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
