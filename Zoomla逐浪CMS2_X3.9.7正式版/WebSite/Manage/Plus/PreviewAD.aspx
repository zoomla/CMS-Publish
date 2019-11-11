<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PreviewAD.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.PreviewAD" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>广告预览</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
    new Bread("/{manage}/Main.aspx","工作台"),
    new Bread("ADManage.aspx","广告管理"),
	new Bread() {url="", text="预览版位JS效果",addon="" }}
    )
%>
    <table class="table table-bordered list_choice">
        <tr>
            <td class="text-center"><strong>预览版位JS效果</strong></td>
        </tr>
        <tr>
            <td class="text-center">
                <a href="<%=Request.RawUrl %>" class="btn btn-info">刷新页面</a>
                <a href="ADZoneManage.aspx" class="btn btn-info">返回上页</a>
            </td>
        </tr>
        <tr class="text-center">
            <td>
                <div style="min-height: 20rem" id="ShowJS" runat="server"></div>
            </td>
        </tr>
    </table>
</asp:Content>