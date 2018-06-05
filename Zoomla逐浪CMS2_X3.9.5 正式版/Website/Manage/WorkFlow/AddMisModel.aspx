<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMisModel.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.AddMisModel"  MasterPageFile="~/Manage/I/Index.master" ValidateRequest="false" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>套红管理</title>
<%--<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
		new Bread("MisModelManage.aspx","模板管理"),
        new Bread() {url="", text="套红管理",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
    <div class="row sysRow list_choice">
        <table class="table table-striped table-bordered table-hover sys_table">
            <tr>
                <th scope="col" class="w12rem_lg">模板名称 <span class="text-danger">*</span></th>
                <td scope="col">
                    <asp:TextBox ID="ModelName" CssClass="form-control max20rem" runat="server"></asp:TextBox>
                    
                    <asp:RequiredFieldValidator ID="r1" ControlToValidate="ModelName" runat="server" ErrorMessage="名称不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tdbg">
                <th scope="col">模板类型</th>
                <td scope="col">
                    <asp:DropDownList runat="server" ID="DocType_DP" CssClass="form-control max20rem">
                        <asp:ListItem Value="0">公文</asp:ListItem>
                        <asp:ListItem Value="1">事务</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>绑定节点</th>
                <td>
                    <asp:TextBox runat="server" ID="bindNodeT" CssClass="form-control max20rem" />
					<small class="text-muted">(选填)</small>
                </td>
            </tr>
            <tr>
                <th>公文Word套红</th>
                <td>
                    <input type="button" class="btn btn-outline-info" value="打开套红模板" onclick="showTlpDiag();" />
                    <asp:HiddenField runat="server" ID="FileGuid_Hid" />
                </td>
            </tr>
            <tr runat="server" visible="false">
                <th>事务套红<br />(仅用于事务流程)</th>
                <td>
                    <asp:TextBox ID="ModelContent"  TextMode="MultiLine" runat="server" cssclass="max20rem"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="BtnSav" runat="server" CssClass="btn btn-info" OnClick="BtnSav_Click" Text="保存信息" />
                    <button type="button" class="btn btn-outline-info" onclick="location='MisModelManage.aspx'">返回列表</button>
                </td>
            </tr>
        </table>
    </div>
	</div>
<%--<%=Call.GetUEditor("ModelContent",3) %>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function showTlpDiag() { ShowComDiag("/Plugins/Office/Default.aspx?guid=" + $("#FileGuid_Hid").val(),"套红模板"); }
    function closeDiag(guid) { $("#FileGuid_Hid").val(guid); CloseComDiag(); }
</script>
</asp:Content>
