<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PubNodeAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Exam.News.PubNodeAdd" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>分类管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered">
    <tr>
        <td>所属分类：</td>
        <td>
            <asp:DropDownList ID="ParentIDS_D" CssClass="form-control text_300" runat="server">
                <asp:ListItem Text="请选择父分类" Value="0" />
            </asp:DropDownList></td>
    </tr>
    <tr>
        <td>分类名：</td>
        <td>
            <asp:TextBox runat="server" ID="NodeName_T" CssClass="form-control text_300" />
            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="NodeName_T" ForeColor="Red" ErrorMessage="不能为空" ValidationGroup="Add_Node" /></td>
    </tr>
    <tr>
        <td>操作：</td>
        <td>
            <asp:Button runat="server" ID="AddNode_B" OnClick="AddNode_Btn_Click" Text="保存信息" ValidationGroup="Add_Node" CssClass="btn btn-primary" /></td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
#navHolder{display:none;}
</style>
<script>
    function callback()
    {
        parent.location = parent.location;
    }
</script>
</asp:Content>