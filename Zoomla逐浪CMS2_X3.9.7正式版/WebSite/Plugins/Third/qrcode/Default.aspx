<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Plugins.Third.qrcode.Default" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
   <div class="container">
        <img id="logo" src="/UploadFiles/nopic.gif" hidden>
        <div id="qrcode1"><canvas width="400" height="400"></canvas></div>
        <div id="qrcode2"><canvas width="400" height="400"></canvas></div>
   </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="qrcode.js"></script>
<script src="jqueryqr.js"></script>
<script>
        $(function () {
            //文字logo
            $("#qrcode1").erweima({ label: '<%=Call.SiteName%>' });
            //图片logo
            $('#qrcode2').erweima({
                mode: 4, mSize: 20, image: $("#logo")[0],
                text: "http://www.baidu.com"
            });
        });
</script>
</asp:Content>