<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StructTree.aspx.cs" Inherits="ZoomLaCMS.JS.Plugs.OrgChart.StructTree" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>组织结构图</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="chart-container"></div>
<asp:HiddenField runat="server" ID="ds_hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<link href="/JS/Plugs/OrgChart/jquery.orgchart.css" rel="stylesheet" />
<script src="/JS/Plugs/OrgChart/jquery.orgchart.js"></script>
<style type="text/css">
.orgchart{display:block;}
.orgchart .layer1 .title {background-color: #006699;}
.orgchart .layer1 .content {border-color: #006699;}
.orgchart .layer2 .title {background-color: #009933;}
.orgchart .layer2 .content {border-color: #009933;}
.orgchart .layer3 .title {background-color: #993366;}
.orgchart .layer3 .content {border-color: #993366;}
.orgchart .layer4 .title {background-color: #996633;}
.orgchart .layer4 .content {border-color: #996633;}
.orgchart .layer5 .title {background-color: #cc0066;}
.orgchart .layer5 .content {border-color: #cc0066;}
</style>
<script>
    $(function () {
        $('#chart-container').orgchart({ 'data': JSON.parse($("#ds_hid").val()), 'nodeContent': 'title' });
    })
</script>
</asp:Content>