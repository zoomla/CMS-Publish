<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Restore.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.Addon.Restore" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.加载动力版 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx",Resources.L.工作台),
        new Bread("/{manage}/Config/DatalistProfile.aspx",Resources.L.扩展功能),						
        new Bread("/{manage}/Template/LabelManage.aspx",Resources.L.标签管理),						
        new Bread() {url="/{manage}/Design/Addon/Restore.aspx", text=Resources.L.加载动力版,addon="" }}
		)
    %>
	<div class="list_choice">
<div class="card m50rem_50 mb-2" style="margin:0 auto;">
    <div class="card-header"><i class="zi zi_futbol zi_spin"></i><%=Resources.L.加载动力版 %></div>
    <div class="card-body">
         <asp:TextBox runat="server" ID="TlpFile_T" CssClass="form-control" placeholder=" <%$Resources:L,动力备份文件路径 %>" />
            <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="TlpFile_T" ForeColor="Red" ErrorMessage="<%$Resources:L,文件路径不能为空 %>"/>
    </div>
    <div class="card-footer">
        <asp:Button runat="server" ID="Restore_Btn" Text="<%$Resources:L,开始恢复 %>" OnClick="Restore_Btn_Click" CssClass="btn btn-info" />
    </div>
</div>
<div class="alert alert-danger">
    <ul>
        <li><%=Resources.L.加载动力版_notice1 %></li>
    </ul>
</div>
<div class="alert alert-info">
    <ul>
        <li><%=Resources.L.加载动力版_notice2 %> <span class="rd_red"><%=Resources.L.加载动力版_notice3 %></span></li>
    </ul>
</div>
 <%--   <div runat="server">
        <asp:Button runat="server" ID="DelAll_Btn" Text="删除为测试环境" OnClick="DelAll_Btn_Click" />
    </div>--%>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
