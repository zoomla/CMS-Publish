<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Third.aspx.cs" Inherits="ZoomLaCMS.LOGO.Third" MasterPageFile="~/Common/Master/Empty.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>LOGO设计</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <script src="/Plugins/Third/Logo/fabric/fabric.js"></script>
    <div class="container" style="position:relative;margin-top:50px;">
        <ul id="font_ul"></ul>
        <canvas id="canvas" width="670" height="400" style="border: 1px solid #ddd;margin-left:230px;"></canvas>
        <div class="margin_t10 text-center">
            <input type="button" value="下载图片" class="btn btn-info" onclick="saveToImg();" />
            <asp:Button runat="server" ID="Save_Btn" Text="保存设计" OnClick="Save_Btn_Click" class="btn btn-info" OnClientClick="return preSave();"/>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="Save_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
    #font_ul{width:300px;height:700px;overflow-y:auto;z-index:5; position:absolute;margin-left:-300px;}
    #font_ul li{margin-bottom:5px;cursor:pointer;border:1px solid #ddd;padding:3px;height:70px;overflow:hidden;}
    #font_ul li:hover{border:1px solid #0094ff;}
    #font_ul li img{width:100%;}
</style>
<script>
    var fontList = "逐浪创艺粗黑体|逐浪报人书法行体|逐浪创意粗行体|逐浪创意含羞体|逐浪创意流珠体|逐浪创意沁竹体|逐浪小霞硬楷体|逐浪小雪钢笔体|逐浪瑶小硬"
    .split('|');
    var compName = "<%=HttpUtility.UrlEncode(desMod.CompName)%>";
    var subTitle = "<%=HttpUtility.UrlEncode(desMod.SubTitle)%>";
    var imgUrl = "<%=iconBll.PlugDir+"CreateImg.aspx?action=text&"%>";
$(function () {
    for (var i = 0; i < fontList.length; i++) {
        var url = imgUrl + "text="+compName+"&font="+encodeURI(fontList[i]);
        $("#font_ul").append('<li data-font="'+fontList[i]+'"><img src="'+url+'" /></li>');
    }
    $("#font_ul li").click(function () {
        var obj = canvas.getActiveObject();
        if (!obj) { return; }
        var url = imgUrl + "font=" + encodeURI($(this).data("font"));
        if (obj._element.src.indexOf("type=m") > -1) { url += "&type=m&text=" + compName; }
        else { url += "&type=s&text=" + subTitle; }
        obj.setSrc(url, function () { canvas.renderAll(); });
        
    });
})
</script>
<script>
        var canvas = new fabric.Canvas('canvas');
        //canvas.loadFromJSON();
        function setBackGroud()
        {
            canvas.setBackgroundColor({
                source: "<%=iconBll.PlugDir%>assets/grid.jpg",
                repeat: 'repeat',
            }, canvas.renderAll.bind(canvas));
        }
        function saveToImg() {
            canvas.setBackgroundColor('');
            var MIME_TYPE = "image/png";
            var imgURL = canvas.toDataURL(MIME_TYPE);//base64
            var dlLink = document.createElement('a');
            dlLink.download = "Logo";
            dlLink.href = imgURL;
            dlLink.dataset.downloadurl = [MIME_TYPE, dlLink.download, dlLink.href].join(':');
            document.body.appendChild(dlLink);
            dlLink.click();
            document.body.removeChild(dlLink);
            setBackGroud();
        }
        function preSave() {
            $("#Save_Hid").val(JSON.stringify(canvas));
        }
        //----------------------
        setBackGroud();
        if ($("#Save_Hid").val() != "") { canvas.loadFromJSON($("#Save_Hid").val()); }
        else
        {
            fabric.loadSVGFromURL("<%=iconBll.GetSvgPath(desMod.LogoID)%>", function (objects, options) {
                var svg = fabric.util.groupSVGElements(objects, options);
                svg.set({
                    left: (canvas.width - svg.width) / 2,
                    top: 40,
                })
                //.scale(0.3);
                canvas.add(svg).calcOffset();
            });
        fabric.Image.fromURL(imgUrl+"type=m&font=&text=<%=HttpUtility.UrlEncode(desMod.CompName)%>", function (image) {
            image.set({
                left: (canvas.width - image.width) / 2,
                top: 240,
            })
            canvas.add(image);
            //-----------
            fabric.Image.fromURL(imgUrl + "type=s&font=&text=<%=HttpUtility.UrlEncode(desMod.SubTitle)%>", function (img) {
                img.set({
                    left: (canvas.width - img.width / 2) / 2,
                    top: 265 + image.height,
                }).scale(0.5);
                canvas.add(img);
            });
        });
        }
    
</script>
</asp:Content>