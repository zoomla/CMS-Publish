<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouClickAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.Third.TouClickAdd" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>接口配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr><td class="td_m">平台名称</td><td><input type="text" class="form-control text_300 disabled" value="点触验证码"/> <a href="https://www.touclick.com/" target="_blank" class="btn btn-info"><i class="fa fa-random"></i> 前往申请</a></td></tr>
    <tr><td class="td_m">公钥</td><td>
        <asp:TextBox runat="server" ID="PubKey_T" class="form-control text_300" />
                                </td></tr>
    <tr><td>私钥</td><td>
        <asp:TextBox runat="server" ID="PriKey_T" class="form-control text_300" />
                   </td></tr>
    <tr><td></td><td><asp:Button runat="server" ID="Save_Btn" class="btn btn-info" Text="保存配置" OnClick="Save_Btn_Click"/></td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>