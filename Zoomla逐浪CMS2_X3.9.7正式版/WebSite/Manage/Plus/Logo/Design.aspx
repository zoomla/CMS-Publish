<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Design.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.Logo.Design" MasterPageFile="~/Manage/I/Index.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>名片设计</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("DesTlpList.aspx","名片模板 "),
        new Bread() {url="", text="模板设计",addon="" }}
		)
    %>
	<div class="list_choice">

        <canvas id="canvas" width="670"   height="400" style="border: 1px solid #ddd;"></canvas>
        <div class="margin_t10">
		<div class="container-fluid pr-0">
		<div class="row sysRow">
            <table class="table table-bordered table-striped sys_table">
                <tr><th scope="col" class="w12rem_lg">别名</th><td scope="col"><asp:TextBox runat="server" ID="Alias_T" class="form-control max20rem"/></td></tr>
                <tr><th scope="col">控件</th><td scope="col">
                    <button type="button" onclick="fabHelper.add('img');" class="btn btn-info"><i class="zi zi_plus"></i> 图片</button>
                    <button type="button" onclick="fabHelper.add('text');" class="btn btn-info"><i class="zi zi_plus"></i> 文字</button>
                    <button type="button" onclick="fabHelper.del();" class="btn btn-danger"><i class="zi zi_trashalt"></i> 删除</button>
                </td></tr>
                <tr class="img_tr item_tr">
                    <th scope="col">Logo图片</th>
                    <td scope="col">
                        <input type="file" id="pic_up" class="hidden" onchange="pic.upload();" />
                        <input type="text" id="PicUrl_T" class="form-control m50rem_50" placeholder="http://demo.z01.com/pic.jpg" />
                        <input type="button" class="btn btn-info" value="上传图片" onclick="pic.sel('PicUrl_T');" />
                    </td>
                </tr>
                <tr class="text_tr item_tr"><th>文字属性</th><td>
                    <div class="input-group" style="width:520px;">
                        <span class="input-group-addon">文字</span>
                        <input type="text" class="form-control max20rem" maxlength="15" id="text_text"/>
         <%--               <span class="input-group-addon">尺寸</span>
                        <input type="text" class="form-control text_md" value="25" id="text_size"/>--%>
                        <span class="input-group-addon">色彩</span>
                        <input type="text" class="form-control text_md colorPicker" id="text_color"/>
                    </div>
                </td></tr>
                <tr class="text_tr item_tr">
                    <th scope="col">字体样式</th>
                    <td scope="col">
                        <ul id="font_ul"></ul>
                    </td>
                </tr>
                <tr>
                    <th scope="col">操作</th>
                    <td scope="col">
                        <asp:Button runat="server" ID="Save_Btn" Text="保存设计" OnClick="Save_Btn_Click" class="btn btn-info" OnClientClick="return preSave();" />
                         <input type="button" value="下载图片" class="btn btn-info" onclick="saveToImg();" />
                    </td>
                </tr>
            </table>
			</div></div>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="Base64_Hid" />
    <asp:HiddenField runat="server" ID="Save_Hid" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.item_tr{display:none;}
#font_ul{}
#font_ul li{margin-bottom:5px;cursor:pointer;border:1px solid #ddd;padding:3px;height:70px;overflow:hidden;float:left;margin-right:5px;margin-bottom:5px;}
#font_ul li:hover,#font_ul li.active{border:1px solid #0094ff;}
#font_ul li img{width:100%;}
.popover{width:260px;}
</style>
<link rel="stylesheet" type="text/css" href="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.css"  />
<script src="/Design/JS/Plugs/color/tinycolor-min.js"></script>
<script src="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.js"></script>
<script src="/Plugins/Third/Logo/fabric/fabric.js?v=<%=DateTime.Now.ToString() %>"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/ZL_Regex.js?v=2"></script>
<script>
    //字体名称与text不能带空格,使用_来代替
    var fontList = "Klasdot|CrazyType"
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
    fabHelper.add = function (type) {
        switch (type) {
            case "img":
                fabric.Image.fromURL("/UploadFiles/nopic.svg", function (image) {
                    callBack(image);
                });
                break;
            case "text":
                var model = fabHelper.newMod();
                model.text = "YOUR TEXT HERE";
                fabric.Image.fromURL(fabHelper.getTextUrl(model), function (image) {
                    callBack(image);
                });
                break;
        }
        //---------------------
        function callBack(fabObj) {
            fabObj.cType = type;
            fabObj.set({ left: (canvas.width - fabObj.width) / 2, top: 50, });
            fabHelper.bindEvent(fabObj);
            canvas.add(fabObj);
        }
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
                        //fabObj.set({ width: 50, height: 50 });//cut
                        image.scale(oldWid/image.width);
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
        if (model.color.indexOf("(") > -1) {
            model.color = StyleHelper.RGBTo16(model.color);
        }
        var url = imgUrl + "model=" + encodeURIComponent(JSON.stringify(model));
        return url;
    }
    fabric.Object.prototype.transparentCorners = false;
    fabric.Object.prototype.cornerColor = "white";
    fabric.Object.prototype.cornerStyle = "circle";
    fabric.Object.prototype.cornerSize = 12;

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
            console.log(canvas.toDataURL); return false;
            $("#Base64_Hid").val(canvas.toDataURL("image/png"));//base64
            $("#Save_Hid").val(JSON.stringify(canvas));
        }
        //----------------------
        setBackGroud();
        if ($("#Save_Hid").val() != "") { canvas.loadFromJSON($("#Save_Hid").val()); }
   <%--         fabric.loadSVGFromURL("<%=iconBll.GetSvgPath(desMod.LogoID)%>", function (objects, options) {
                var svg = fabric.util.groupSVGElements(objects, options);
                svg.set({
                    left: (canvas.width - svg.width) / 2,
                    top: 40,
                })
                //.scale(0.3);
                canvas.add(svg).calcOffset();
            });--%>
    $(function () {
     for (var i = 0; i < fontList.length; i++) {
            var model = fabHelper.newMod();
            model.text = "Type Text Here";
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
        $(".colorPicker").ColorPickerSliders({
            size: 'sm', placement: 'top', swatches: false, sliders: false, hsvpanel: true, previewformat: "hex",
            trigger: "focus",
            title: "字体颜色",
            onchange: function (container, color) {
                var color = color.tiny.toHexString()
                $(".colorPicker").val(color);
                fabHelper.update();
            }
        });
        $(".item_tr input:text").change(fabHelper.update);
        //---test
        fabHelper.add("img");
        fabHelper.add("text");
    })
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