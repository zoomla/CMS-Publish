<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceCode.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Service.ServiceCode" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>生成客服代码</title>
    <script src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("","后台管理"),
        new Bread("ServiceSeat.aspx","客服管理"),
        new Bread("CodeList.aspx","引用管理"),
        new Bread() {url="", text="在线生成",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th scope="col" class="w12rem_lg">企业名称</th>
            <td scope="col">
                <asp:TextBox runat="server" ID="FName_T" CssClass="form-control max20rem"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="FName_T" ForeColor="Red" Display="Dynamic" ErrorMessage="名称不能为空"/>
            </td>
        </tr>
        <tr>
            <th>欢迎语</th>
            <td>
                <asp:TextBox runat="server" ID="Content_T" TextMode="MultiLine" style="height:150px;width:100%;"></asp:TextBox>
                <%=Call.GetUEditor("Content_T",2) %>
<%--                <asp:RequiredFieldValidator runat="server" ID="R2" ControlToValidate="Content_T" ForeColor="Red" Display="Dynamic" ErrorMessage="内容不能为空"/>--%>
            </td>
        </tr>
        <tr><th>主题</th><td><label><input type="radio" name="theme_rad" value="def" checked="checked" />默认主题</label></td></tr>
        <tr>
            <th>操作</th>
            <td>
                <asp:Button runat="server" ID="Save_Btn" OnClick="Save_Btn_Click" Text="保存" CssClass="btn btn-info" />
                <a href="CodeList.aspx" class="btn btn-outline-info">返回</a>
   <%--             <input type="button" class="btn btn-primary" id="getCode" value="生成代码" onclick="return getCode_onclick()" />--%>
            </td>
        </tr>
        <tr>
            <th>引用代码</th>
            <td><asp:TextBox ID="txtCode" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox></td>
        </tr>
    </table>
	</div></div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
