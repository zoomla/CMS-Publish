<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Plugins.Third.Logo.Default1" MasterPageFile="~/Common/Master/Empty.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>模板选择</title>
<style type="text/css">
#tlpul li{border:1px solid #ddd;padding:5px;}
#tlpul li img{width:100%;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container" style="margin-top:30px;">
        <ul id="tlpul">
        <ZL:Repeater ID="RPT" runat="server" PageSize="12" PagePre="</ul><div class='clearfix'></div><div><td colspan='6'><div class='text-center'>"
        PageEnd="</div></div>">
        <ItemTemplate>
            <li class="col-md-4">
                <img src="<%#Eval("PreviewImg") %>"/>
                <div class="text-center margin_t5"><a href="Design.aspx?TlpID=<%#Eval("ID") %>" class="btn btn-info">使用该模板</a></div>
            </li>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:Repeater>
    </ul>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
   
</asp:Content>