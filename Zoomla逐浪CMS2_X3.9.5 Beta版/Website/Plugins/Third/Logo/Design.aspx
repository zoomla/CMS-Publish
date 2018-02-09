<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Design.aspx.cs" Inherits="ZoomLaCMS.Plugins.Third.Logo.Design" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>名片设计</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li><a href="DesTlpList.aspx">名片模板</a></li>
                <li class="active">模板设计</li>
            </ol>
        </div>
    </div>
    <div>
        <canvas id="canvas" width="670" height="400" style="border: 1px solid #ddd;margin-left:230px;"></canvas>
        <div class="margin_t10">
            <table class="table table-bordered table-striped">
                <tr class="img_tr item_tr">
                    <td class="td_m">Logo图片</td>
                    <td>
                        <input type="file" id="pic_up" class="hidden" onchange="pic.upload();" />
                        <input type="text" id="PicUrl_T" class="form-control m715-50" placeholder="http://demo.z01.com/pic.jpg" />
                        <input type="button" class="btn btn-info" value="上传图片" onclick="pic.sel('PicUrl_T');" />
                    </td>
                </tr>
                <tr class="text_tr item_tr"><td>文字属性</td><td>
                    <div class="input-group" style="width:520px;">
                        <span class="input-group-addon">文字</span>
                        <input type="text" class="form-control text_300" maxlength="10" id="text_text"/>
         <%--               <span class="input-group-addon">尺寸</span>
                        <input type="text" class="form-control text_md" value="25" id="text_size"/>--%>
                        <span class="input-group-addon">色彩</span>
                        <input type="text" class="form-control text_md colorPicker" id="text_color"/>
                    </div>
                </td></tr>
                <tr class="text_tr item_tr">
                    <td>字体样式</td>
                    <td>
                        

                        <div class="btn-group">
                            <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                <i class="fa fa-font"></i> 选择字体
        <span class="caret"></span>
                            </button>
                            <ul id="font_ul" class="dropdown-menu" role="menu">
                            </ul>
                        </div>



                    </td>
                </tr>
                <tr>
                    <td>Flash Options</td>
                    <td>
                        <asp:DropDownList runat="server" ID="Flash_DP" class="form-control text_300">
                          <asp:ListItem value="">Choose FLASHING Upgrade here...</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Whole Sign">Add FLASHING to Whole Sign (+$99)</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Line 1">Add FLASHING to Line 1(+$99)</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Line 2">Add FLASHING to Line 2(+$99)</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Line 3">Add FLASHING to Line 3(+$99)</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Line 1 &amp; Line 2">Add FLASHING to Line 1 &amp; Line 2(+$99)</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Line 2 &amp; Line 3">Add FLASHING to Line 2 &amp; Line 3(+$99)</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Border only">Add FLASHING to Border only(+$99)</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Logo only">Add FLASHING to Logo only(+$99)</asp:ListItem>
                          <asp:ListItem value="$99||Add FLASHING to Line only">Add FLASHING to Line only(+$99)</asp:ListItem>
                        </asp:DropDownList></td>
                </tr>
                <tr><td>Outdoor Sign</td><td>
                    <asp:DropDownList runat="server" ID="OutdoorSign_DP" class="form-control text_300">
                        <asp:ListItem Value="">Please Select...</asp:ListItem>
                        <asp:ListItem Value="No">No</asp:ListItem>
                        <asp:ListItem Value="$195||Yes">Yes(+$195)</asp:ListItem>
                    </asp:DropDownList>
                </td></tr>
                <tr>
                    <td>Backing Material</td>
                    <td>
                        <asp:DropDownList runat="server" ID="BackGround_DP" class="form-control text_300" onchange="setbk(this);">
                            <asp:ListItem value="Black" Selected="True">Black</asp:ListItem>
                            <asp:ListItem value="Clear">Clear</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr><td>Comments</td><td>
                    <asp:TextBox runat="server" ID="Comment_T" TextMode="MultiLine" MaxLength="500" class="form-control" style="height:150px;"/>                                     </td></tr>
                <tr>
                    <td class="td_m">操作</td>
                    <td>
                        <asp:Button runat="server" ID="Save_Btn" Text="保存设计" OnClick="Save_Btn_Click" class="btn btn-info" OnClientClick="return preSave();" />
                         <input type="button" value="下载图片" class="btn btn-info" onclick="saveToImg();" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="Base64_Hid" />
    <asp:HiddenField runat="server" ID="Save_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.item_tr{display:none;}
#font_ul{}
#font_ul li{margin-bottom:5px;cursor:pointer;border:1px solid #ddd;padding:3px;height:70px;overflow:hidden;float:left;margin-right:5px;margin-bottom:5px;}
#font_ul li:hover,#font_ul li.active{border:1px solid #0094ff;}
#font_ul li img{width:240px;height:40px;}
.popover{width:300px;}
</style>
<link rel="stylesheet" type="text/css" href="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.css"  />
<script src="/Design/JS/Plugs/color/tinycolor-min.js"></script>
<script src="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.js"></script>
<script src="/Plugins/Third/Logo/fabric/fabric.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/ZL_Regex.js?v=2"></script>
<script>
    var fontList = "逐浪创艺粗黑体|逐浪报人书法行体|逐浪创意粗行体|逐浪创意含羞体|逐浪创意流珠体|逐浪创意沁竹体|逐浪小霞硬楷体|逐浪小雪钢笔体|逐浪瑶小硬"
    .split('|');
    var imgUrl = "<%=iconBll.PlugDir+"CreateImg.aspx?action=text&"%>";
</script>
<script>
    var fabHelper = { list: [] };
    fabHelper.init = function (json) {
        canvas.loadFromJSON(json, function () {
            var list = canvas.getObjects();
            for (var i = 0; i < list.length; i++) {
                var src = list[i]._element.src;
                if (src.toLowerCase().indexOf("createimg.aspx") > -1) { list[i].cType = "text"; }
                else { list[i].cType = "img"; }
                fabHelper.bindEvent(list[i]);
                //-------------------------------
                list[i].lockMovementX = true;
                list[i].lockMovementY = true;
                list[i].lockScalingX = true;
                list[i].lockScalingY = true;
                list[i].lockRotation = true;
            }
        });
    }
    fabHelper.tool = {};
    //从URL中获取model信息
    fabHelper.tool.getInfoFromUrl = function (url, name) {
        var str = url.split(name + "=")[1];
        str = str.split("&")[0];
        return JSON.parse(decodeURIComponent(str));
    }
    fabHelper.newMod = function () {
        return {
            bkcolor: "#000000", color: "#ffffff", text: "", size: 12, family: "", addon: ""
        };
    }
    fabHelper.bindEvent = function (fabObj) {
        fabObj.on("selected", function (e) {
            var fabObj = canvas.getActiveObject();
            $(".item_tr").hide();
            $("." + fabObj.cType + "_tr").show();
            //----------更新控件数据
            var imgUrl = $(fabObj._element.outerHTML).attr("src");
            imgUrl = StrHelper.getUrlVPath(imgUrl);
            switch (fabObj.cType) {
                case "img":
                    $("#PicUrl_T").val(imgUrl);
                    break;
                case "text":
                    {
                        var model = fabHelper.tool.getInfoFromUrl(imgUrl, "model");
                        $("#text_text").val(model.text);
                        $("#text_size").val(model.size);
                        $("#text_color").val(model.color);
                        //$("#text_color").css("background-color", model.color);
                        $("#text_color").ColorPickerSliders({ color: model.color });
                    }
                    break;
            }
        });
    }
    //更新当前选定的对象
    fabHelper.update = function () {
        var fabObj = canvas.getActiveObject();
        switch (fabObj.cType) {
            case "img":
                {
                    var oldWid = fabObj.width * fabObj.scaleX;
                    fabObj.setSrc($("#PicUrl_T").val(), function (image) {
                        image.scale(oldWid / image.width);
                        canvas.renderAll();
                    });
                }
                break;
            case "text":
                {
                    var model = fabHelper.newMod();
                    model.text = $("#text_text").val();
                    model.color = $("#text_color").val();
                    model.size = $("#text_size").val();
                    if ($("#font_ul li.active").length > 0)
                    {
                        model.family = $("#font_ul li.active").data("font");
                    }
                    fabObj.setSrc(fabHelper.getTextUrl(model), function () { canvas.renderAll(); });
                }
                break;
        }
    }
    fabHelper.del = function () {
        var fabObj = canvas.getActiveObject();
        if (!fabObj) { return; }
        canvas.remove(fabObj);
    }
    fabHelper.getTextUrl = function (model) {
        var url = imgUrl + "model=" + encodeURIComponent(JSON.stringify(model));
        return url;
    }

    fabric.Object.prototype.transparentCorners = false;
    fabric.Object.prototype.hasControls = false;
    fabric.Object.prototype.borderColor = "#0094ff";
    fabric.Object.prototype.borderScaleFactor = 3;
    fabric.Object.prototype.padding = 1;
        var canvas = new fabric.Canvas('canvas');
        function setBackGroud() {
            <%--     
       //使用网络背景  
         canvas.setBackgroundColor({
                   source: "<%=iconBll.PlugDir%>assets/grid.jpg",
                repeat: 'repeat',
            }, canvas.renderAll.bind(canvas));--%>
            canvas.setBackgroundColor("#000", canvas.renderAll.bind(canvas));
        }
        function saveToImg() {
            //canvas.setBackgroundColor('');
            var MIME_TYPE = "image/png";
            var imgURL = canvas.toDataURL(MIME_TYPE);//base64
            var dlLink = document.createElement('a');
            dlLink.download = "Logo";
            dlLink.href = imgURL;
            dlLink.dataset.downloadurl = [MIME_TYPE, dlLink.download, dlLink.href].join(':');
            document.body.appendChild(dlLink);
            dlLink.click();
            document.body.removeChild(dlLink);
            //setBackGroud();
        }
        function preSave() {
            $("#Base64_Hid").val(canvas.toDataURL("image/png"));//base64
            $("#Save_Hid").val(JSON.stringify(canvas));
        }
        //----------------------
        setBackGroud();
        if ($("#Save_Hid").val() != "") { canvas.loadFromJSON($("#Save_Hid").val()); }
    $(function () {
     for (var i = 0; i < fontList.length; i++) {
            var model = fabHelper.newMod();
            model.text = "选择字体";
            model.bkcolor = ""; model.color = "#000000";
            model.size = 16; model.family = fontList[i];
            var url = fabHelper.getTextUrl(model);
            $("#font_ul").append('<li data-font="' + fontList[i] + '"><img src="' + url + '" /></li>');
        }
        $("#font_ul li").click(function () {
            var obj = canvas.getActiveObject();
            if (!obj) { return; }
            $("#font_ul li").removeClass("active");
            $(this).addClass("active");
            fabHelper.update();
        });
        //-----------------------
        //$(".colorPicker").ColorPickerSliders({
        //    size: 'sm', placement: 'top', swatches: false, sliders: false, hsvpanel: true, previewformat: "hex",
        //    trigger: "focus",
        //    title: "字体颜色",
        //    onchange: function (container, color) {
        //        var color = color.tiny.toHexString()
        //        $(".colorPicker").val(color);
        //        fabHelper.update();
        //    }
        //});
        $(".colorPicker").ColorPickerSliders({
            placement: 'top',
            color: 'red',
            swatches: ['red', 'yellow', 'Turquoise', 'purple', 'white', 'pink', 'green', 'blue', 'orange', 'Veep Green', 'Rich Blue', 'Neon Blue'],
            customswatches: false,
            order: {},
            onchange: function (container, color) {
                var color = color.tiny.toHexString()
                $(".colorPicker").val(color);
                fabHelper.update();
            }
        });
        $(".item_tr input:text").change(fabHelper.update);
        //---test
        //fabHelper.add("img");
        //fabHelper.add("text");
    })
    function setbk(dp) {
        var value = dp.value;
        if (value == "Clear") {
            canvas.setBackgroundColor({
                source: "<%=iconBll.PlugDir%>assets/grid.jpg",
                   repeat: 'repeat',
               }, canvas.renderAll.bind(canvas));
           }
           else {
               canvas.setBackgroundColor("#000", canvas.renderAll.bind(canvas));
           }
       }
var pic = { id: "pic_up", txtid: null };
pic.sel = function (id) { $("#" + pic.id).val(""); $("#" + pic.id).click(); pic.txtid = id; }
pic.upload = function () {
   var fname = $("#" + pic.id).val();
   if (!SFileUP.isWebImg(fname)) { alert("请选择图片文件"); return false; }
    SFileUP.AjaxUpFile(pic.id, function (data) {
        $("#" + pic.txtid).val(data);
        fabHelper.update();
    });
}
pic.preSave = function () {var src = $("#pic_img").attr("src");$("#pic_hid").val(src);}
</script>
</asp:Content>