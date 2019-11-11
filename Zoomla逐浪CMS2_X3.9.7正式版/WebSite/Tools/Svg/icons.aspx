<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="icons.aspx.cs" Inherits="ZoomLaCMS.Tools.svg.icons" MasterPageFile="~/Common/Master/Empty.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>SVG图标</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<main class="yunCon" style="margin-top:0px;">
<div style="display:inline-block;">.</div>

    <div class="spclist" id="spclist" style="margin-top:0px;padding-top:0px;">
       <%-- <div class="spcItem"><a href="javascript:;" class="home_list2" title="威海福汇百居"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1800 1800"><path d=""></path></svg></a><strong>威海福汇百居 </strong><abbr>zi_tmWeihaifb</abbr></div>--%>
    </div>
</main>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<link href="/App_Themes/V4.css" rel="stylesheet" />
<style type="text/css">
    .home_list2{width:130px;height:130px;text-align:center;}
</style>
<script src="/dist/js/zico.min.js"></script>
<script>
    //var svgTlp = '<div class="spcItem"><a href="javascript:;" class="home_list2" title="@alias"><i class="zi @cls"></i></a><strong>@alias </strong><abbr>@cls</abbr></div>';
    var svgTlp = '<div class="spcItem" data-alias="@alias"><a href="javascript:;" class="home_list2" title="@alias"><svg xmlns="http://www.w3.org/2000/svg" class="svgRoot_zi " viewBox="0 0 2000 2200"><path fill="currentColor" d="@path"></path></svg></a><abbr>zi_@alias</abbr></div>';
var svgHTML = "";
for (var item in icons) {
    svgHTML += svgTlp.replace(/@alias/g, item).replace("@path", icons[item][4]);
}
$("#spclist").html(svgHTML);

$("#spclist .spcItem").click(function () {
    //var html = $(this).find("a").html();//兼容IE
    //html = html.replace("class=", "cls=");
    //$("#editor_item").html(html);
    //$("#editor_modal").modal("show");
    var alias = $(this).data("alias");
    var path = icons[alias][4];
    parent.zico.loadSvg(path);
});
</script>
</asp:Content>