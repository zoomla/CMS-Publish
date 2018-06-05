<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelFont.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.FontIcon.SelFont" MasterPageFile="~/Common/Master/Empty.master" EnableViewState="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>特色字体</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr>
        <td class="td_m">字体选择</td>
        <td>
            <asp:DropDownList runat="server" ID="font_dp" class="form-control text_300" DataTextField="name" DataValueField="css"></asp:DropDownList></td>
    </tr>
    <tr><td colspan="2">
        <div class="text-center ZoomlaXingtiJ" id="font_view">
            繁体创意书法
        </div>
        </td></tr>
    <tr><td colspan="2" class="text-center">
        <button type="button" class="btn btn-info" onclick="save();">确定选择</button>
        <button type="button" class="btn btn-default" onclick="closeDiag();">关闭窗口</button>
                 </td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<link href="/dist/css/zfont.css" rel="stylesheet" type="text/css">
<style type="text/css">
#font_view{height:150px;font-size:50px;line-height:150px;text-align:center;}
</style>

<script>
    function save() {
        var option = $("#font_dp option:checked");
        var html = "{ZL:Font("+option.text()+")/}";
        parent.selFontBack(html);
        closeDiag();
}
function closeDiag() {
    parent.closeDiag();
  
}
$(function () {
    $("#font_dp").change(function () {
        var option = $("#font_dp option:checked");
        $("#font_view").html("").text(option.text());
        $("#font_view").attr("class", option.val());
    });
})
</script>
</asp:Content>