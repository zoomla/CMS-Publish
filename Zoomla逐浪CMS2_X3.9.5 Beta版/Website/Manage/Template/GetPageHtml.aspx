<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetPageHtml.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.GetPageHtml" ValidateRequest="false" MasterPageFile="~/Manage/I/Default.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>源码查看器</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <span class="pull-left" style="line-height: 32px;">目标网址：</span>
    <asp:TextBox ID="UrlText" CssClass="form-control text_300" runat="server">https://v.z01.com</asp:TextBox>
    <asp:Button runat="server" ID="GetHtml_Btn" class="btn btn-info" OnClick="GetHtml_Btn_Click" Text="获取源码"/>
    <br>
    <asp:TextBox ID="ContentHtml" runat="server" TextMode="MultiLine" CssClass="form-control" Style="max-width: 100%; height: 360px;margin-top:10px;"> </asp:TextBox>
</asp:Content>
