<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StructByTree.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.StructByTree" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>组织结构</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="row">
        <div class="col-sm-3">
            <div id="tree"></div>
            <asp:HiddenField runat="server" ID="data_hid" Value="[]" />
        </div>
        <div class="col-sm-9">
            <iframe src="StructList.aspx?mode=<%:Mode %>" class="iframe" scroll="no" id="user_ifr"></iframe>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.iframe{width:100%;min-height:700px;border:none;}
</style>
<link href="/Plugins/Third/treeview/bootstrap-treeview.min.css" rel="stylesheet" />
<script src="/Plugins/Third/treeview/bootstrap-treeview.js"></script>
<script>
$(function () {
    $(".iframe").height(($(window).height() - 50));
    $(document).resize(function () { $(".iframe").height(($(window).height() - 50)); });
    var tree = JSON.parse($("#data_hid").val());
    tree = [{ text: "全部",icon:"fa fa-global", href: "0", nodes: tree }];
    $('#tree').treeview({
        data: tree,
        onNodeSelected: function (event, node) {
            $("#user_ifr").attr("src", "StructList.aspx?mode=<%:Mode%>&pid=" + node.href)
        },
        onNodeUnselected: function (event, node) {
        }
    });
})
   
</script>
</asp:Content>