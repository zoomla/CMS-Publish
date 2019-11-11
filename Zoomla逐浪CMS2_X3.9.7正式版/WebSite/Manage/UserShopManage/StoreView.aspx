<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreView.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopManage.StoreView" MasterPageFile="~/Manage/I/index.Master" %>
<%@ Register Src="~/Manage/I/ASCX/TemplateView.ascx" TagPrefix="ZL" TagName="TlpViewList" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>店铺信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover sysRow">
            <tr>
                <td class="w12rem_lg">店铺名称：</td>
                <td>
                    <asp:Label ID="UserShopName_T" runat="server" />
                    <a href="/Store/StoreIndex?id=<%:storeMod.GeneralID %>" class="btn btn-info margin_l5" target="_blank"><i class="zi zi_eye"></i></a>
                </td>
            </tr>
            <tr>
                <td>店铺样式：</td>
                <td>
                    <ZL:TlpViewList ID="TlpView_Tlp" runat="server" TemplateID="ID" TemplateUrl="Template_Index" TemplateTitle="StyleName" TemplatePic="Thumbnail" />
                </td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
        </table>
    </div>
    <div class="Conent_fix">
        <a href="StoreUpdate.aspx?ID=<%:Mid %>" class="btn btn-info">修改信息</a>
        <a href="StoreManage.aspx" class="btn btn-outline-info">返回列表</a>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>