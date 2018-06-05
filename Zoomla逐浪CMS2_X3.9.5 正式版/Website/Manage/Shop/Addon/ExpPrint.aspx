<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpPrint.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.ExpPrint" ClientIDMode="Static"%><!DOCTYPE html>
<html>
<head runat="server">
<meta charset="utf-8">
<title>快递单打印</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<link href="/dist/css/bootstrap4.min.css" rel="stylesheet"/>
<link href="/dist/css/zico.min.css" rel="stylesheet"/>
<link href="/dist/css/animate.min.css" rel="stylesheet" />
<link href="/dist/css/ZLico.css" rel="stylesheet" />
<link href="/App_Themes/V4style.css?version=<%:ZoomLa.BLL.BLLCommon.Version_JS %>" rel="stylesheet"/>
<script src="/JS/jquery.min.js" ></script>
<script src="/dist/js/popper.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div runat="server" id="maindiv"></div>
<div class="opwrap noprint">
    <span>快递模板：</span>
    <asp:DropDownList runat="server" ID="ExpTlp_DP" OnSelectedIndexChanged="ExpTlp_DP_SelectedIndexChanged" AutoPostBack="true" class="">
        <asp:ListItem Value="zhongtong" Selected="True">中通</asp:ListItem>
        <asp:ListItem Value="anneng">安能</asp:ListItem>
        <asp:ListItem Value="sf">顺风速运</asp:ListItem>
        <asp:ListItem Value="yd">韵达快递</asp:ListItem>
        <asp:ListItem Value="ems">EMS</asp:ListItem>
    </asp:DropDownList>
    <span>发件人：</span>
    <asp:DropDownList runat="server" ID="SendMan_DP" DataTextField="Name" DataValueField="ID" OnTextChanged="SendMan_DP_TextChanged" AutoPostBack="true"></asp:DropDownList>
    <a href="AddExpSender.aspx" style="margin-left:5px;">添加发件人</a>
	<div class="mt-2">
    <input type="button" value="打印单据" onclick="express.print();" class="btn btn-outline-info" />
    <input type="button" value="返回列表" onclick="location = '../OrderList.aspx';" class="btn btn-outline-info" />
	</div>
    <asp:HiddenField runat="server" ID="Order_Hid" /> 
    <asp:HiddenField runat="server" ID="SendMan_Hid" />
    <div class="mt-2">
        <div>* 打印时配置为边距：0,布局方向：纵向,纸张格式：230mm*127mm</div><!--chrome下取消页眉页脚-->
    </div>
</div>
<style>
.nomargin{position:relative;margin-left:2.8cm;}
.opwrap{position:absolute;top:500px;width:100%;}
</style>
<script src="/JS/jquery.min.js"></script>
<script>
    var express = { model: null };
    express.init = function () {
        var ref = this;
        //收件人==订单信息
        ref.model = JSON.parse($("#Order_Hid").val());
        ref.model.Jiedao = "上海市XX路XX弄XX小区XX号";
        ref.model.Mobile = "18897505543";
        ref.model.Ordermessage = "这是订单备注信息";
        ref.model.Reuser = "收件人";
        ref.model.Receiver = "收件单位";
        for (var key in ref.model) {
            $("#" + key).text(ref.model[key]);
        }
        $("#Address").text(ref.model.Shengfen + " " + ref.model.Chengshi + " " + ref.model.Diqu + " " + ref.model.Jiedao);
        //发件人信息
        if ($("#SendMan_Hid").val() != "") {
            ref.sender = JSON.parse($("#SendMan_Hid").val());
            for (var key in ref.sender) {
                $("#send_" + key).text(ref.sender[key]);
            }
        }
    }
    //单打快递单,连打请配置好WCF
    express.print = function () { window.print(); }
    //获取当前屏幕的dpi
    express.getdpi = function () {
        var arrDPI = new Array;
        if (window.screen.deviceXDPI) {
            arrDPI[0] = window.screen.deviceXDPI;
            arrDPI[1] = window.screen.deviceYDPI;
        }
        else {
            var tmpNode = document.createElement("DIV");
            tmpNode.style.cssText = "width:1in;height:1in;position:absolute;left:0px;top:0px;z-index:99;visibility:hidden";
            document.body.appendChild(tmpNode);
            arrDPI[0] = parseInt(tmpNode.offsetWidth);
            arrDPI[1] = parseInt(tmpNode.offsetHeight);
            tmpNode.parentNode.removeChild(tmpNode);
        }
        return arrDPI;//[96, 96]
    }
    express.init();
</script>
</form>
</body>
</html>