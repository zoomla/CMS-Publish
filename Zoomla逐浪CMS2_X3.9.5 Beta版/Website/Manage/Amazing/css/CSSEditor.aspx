<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CSSEditor.aspx.cs" Inherits="ZoomLaCMS.Manage.Amazing.css.CSSEditor" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>元素管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs">
        <li class="active"><a href="#background" data-toggle="tab">背景</a></li>
        <li><a href="#font" data-toggle="tab">字体</a></li>
        <li><a href="#whole" data-toggle="tab">宽高</a></li>
        <%--        <li><a href="#paragraph" data-toggle="tab">段落</a></li>--%>
        <li><a href="#border" data-toggle="tab">边框</a></li>
        <li><a href="#position" data-toggle="tab">定位</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane" id="whole">
            <div class="input-group">
                <span class="input-group-addon">元素宽度</span>
                <input type="text" class="form-control text_x" data-style="width"/>
             <%--   <select class="form-control text_75 unitdp"></select>--%>
            </div>
            <div class="input-group">
               <span class="input-group-addon">元素高度</span>
               <input type="text" class="form-control text_x" data-style="height"/>
               <%--    <select class="form-control text_75 unitdp"></select>--%>
           </div>
            <div class="input-group">
               <span class="input-group-addon">显示属性</span>
                <select class="form-control text_x" data-style="display">
                    <option value="">默认</option>
                    <option value="none">none</option>
                    <option value="block">block</option>
                    <option value="inline">inline</option>
                    <option value="inline-block">inline-block</option>
                    <option value="flex">flex</option>
                </select>
           </div>
            <div class="input-group">
               <span class="input-group-addon">鼠标指针</span>
               <input type="text" class="form-control text_x" data-style="cursor"/>
           </div>
            <div class="input-group">
                <span class="input-group-addon">内侧边距</span>
                <input type="text" class="form-control text_x" data-style="padding"/>
           <%--       <select class="form-control text_75 unitdp"></select>--%>
           </div>
            <div class="input-group">
                <span class="input-group-addon">外侧边距</span>
                <input type="text" class="form-control text_x" data-style="margin"/>
                <%--<select class="form-control text_75 unitdp"></select>--%>
            </div>
        </div>
        <div class="tab-pane" id="font">
            <div class="input-group">
                <span class="input-group-addon">文字字体</span>
                <input type="text" class="form-control text_x" data-style="font-family" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">文字大小</span>
                <input type="text" class="form-control text_x" data-style="font-size" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">文字粗细</span>
                <input type="text" class="form-control text_x" data-style="font-weight" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">字体颜色</span>
                <input type="text" class="form-control text_x color_text" data-style="color"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">字体行高</span>
                <input type="text" class="form-control text_x" data-style="line-height" />
            </div>
        </div>
        <div class="tab-pane" id="paragraph"></div>
        <div class="tab-pane" id="border">
            <div class="input-group">
                <span class="input-group-addon">边框宽度</span>
                <input type="text" class="form-control text_x" data-style="border-width" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">边框颜色</span>
                <input type="text" class="form-control text_x color_text" data-style="border-color"/>
            </div>
            <div class="input-group">
                <span class="input-group-addon">边框样式</span>
                <select class="form-control text_x" data-style="border-style">
                    <option value="none">none</option>
                    <option value="solid">solid</option>
                    <option value="double">double</option>
                    <option value="groove">groove</option>
                    <option value="ridge">ridge</option>
                    <option value="inset">inset</option>
                    <option value="outset">outset</option>
                    <option value="dashed">dashed</option>
                    <option value="dotted">dotted</option>
                </select>
            </div>
        </div>
        <div class="tab-pane active" id="background">
            <div class="input-group">
                <span class="input-group-addon">背景颜色</span>
                <input type="text" class="form-control text_x color_text" data-style="background-color" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">背景拉伸</span>
                <select class="form-control text_x" data-style="background-repeat">
                    <option value="">默认</option>
                    <option value="repeat">repeat</option>
                    <option value="repeat-x">repeat-x</option>
                    <option value="repeat-y">repeat-y</option>
                    <option value="no-repeat">no-repeat</option>
                </select>
            </div>
            <div class="input-group">
                <span class="input-group-addon">附加属性</span>
                <select class="form-control text_x" data-style="background-attachment">
                    <option value="">默认</option>
                    <option value="fixed">fixed</option>
                    <option value="scroll" selected="selected">scroll</option>
                </select>
            </div>
            <div class="input-group" style="width: 520px;margin-right:20px;">
                <span class="input-group-addon">背景图片</span>
                <input type="text" class="form-control" style="width:400px;" data-style="background-image" id="bkimg" />
                <span class="input-group-btn">
                    <button type="button" title="加载格式" class="btn btn-info" onclick='$("#bkimg").val("url(\"/图片地址.jpg\")");'><i class="fa fa-code"></i></button>
                    <%--<button type="button" title="上传图片" class="btn btn-info" style="padding: 9px 12px;"><i class="fa fa-image"></i></button>--%>
                </span>
            </div>
            <div class="input-group" style="width:375px;">
                <span class="input-group-addon">背景定位</span>
                <input type="text" class="form-control text_x" data-style="background-position" />
                <select class="form-control text_75" data-for="background-position">
                    <option value="left">left</option>
                    <option value="right">right</option>
                    <option value="top">top</option>
                    <option value="bottom">bottom</option>
                    <option value="center">center</option>
                    <option value="30% 50%">30% 50%</option>
                </select>
            </div>
        </div>
        <div class="tab-pane" id="position">
            <div class="input-group">
                <span class="input-group-addon">元素定位</span>
                <select class="form-control text_x" data-style="position">
                    <option value="">默认</option>
                    <option value="relative">relative</option>
                    <option value="absolute">absolute</option>
                    <option value="fixed">fixed</option>
                </select>
            </div>
            <div class="input-group">
                <span class="input-group-addon">距离顶部</span>
                <input type="text" class="form-control text_x" data-style="top" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">距离右边</span>
                <input type="text" class="form-control text_x" data-style="right" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">距离底部</span>
                <input type="text" class="form-control text_x" data-style="bottom" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">距离左边</span>
                <input type="text" class="form-control text_x" data-style="left" />
            </div>
            <div class="input-group">
                <span class="input-group-addon">优先等级</span>
                <input type="text" class="form-control text_x" data-style="z-index"/>
            </div>
        </div>
    </div>
    <div style="clear:both;"></div>
    <div id="preview_wrap" style="border-top:1px solid #ddd;">
        <div style="background-image:url(/images/grid.gif);position:relative;min-height:330px;overflow:hidden;background-color:#ece9d8;padding:10px;">
            <div id="example">预览区<br />即时更新</div>
        </div>
    </div>
    <div id="css_wrap" style="margin-top:5px;">
        <textarea id="css_text" name="css_text" style="height: 120px;width:100%;border:none; border-top:1px solid #ddd;resize:none;padding-left:10px;" placeholder="未指定css内容"></textarea>
    </div>
<%--<div class="text-center">
        <input type="button" value="保存修改" class="btn btn-info" onclick="save();" />
        <input type="button" value="关闭窗口" class="btn btn-danger" onclick="close();"/>
    </div>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
#navHolder{display:none;}
.tab-pane{padding:10px;}
.input-group{float:left;width:300px;margin-bottom:5px;}
.text_75{max-width:75px;width:75px;}
.text_x{width:195px;max-width:195px;}
/*#preview_wrap{border:1px solid #ddd;}*/
</style>
<link rel="stylesheet" type="text/css" href="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.css"  />
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/Design/JS/Plugs/color/tinycolor-min.js"></script>
<script src="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.js"></script>
<script src="/Design/JS/Plugs/Helper/StyleHelper.js"></script>
<script>
    var cssMod = null;
    var cssList = {};
    //将csslist转化为css字符串
    function listToCss() {
        var style = "";
        for (var key in cssList) {
            if (!cssList[key]) { continue; }//空值不输出
            style += (key + ":" + cssList[key] + ";");
        }
        return style;
    }
    ////判断css是否空值(background处)
    //function isEmpty(value) {
    //    if (ZL_Regex.isEmpty(value)
    //        || value == "auto" || value == "none") { return true; }
    //    else { return false; }
    //}
    function initEdit(item) {
        cssMod = item; cssList = {};
        if (!cssMod.filter) { cssMod.filter = ""; }
        var $example = $("#example");
        $example.attr("style", item.content);
        $("#css_text").val(item.filter + "{" + item.content+ "}");
        //-------------最终根据csslist中的值重新生成css
        var cssArr = item.content.split(';');
        for (var i = 0; i < cssArr.length; i++) {
            var name = cssArr[i].split(':')[0];
            var value = cssArr[i].split(':')[1];
            if (ZL_Regex.isEmpty(name)) { continue; }
            else
            {
                name = name.toLowerCase().replace(/ /ig, "")
                    .replace(/\n/g, "").replace(/\r/g, "");
            }
            switch (name)//对一些样式属性特殊处理
            {
                case "border":
                    cssList["border-width"] = $example.css("border-width");
                    cssList["border-color"] = $example.css("border-color");
                    cssList["border-style"] = $example.css("border-style");
                    break;
                case "background":
                    var pre = "background-";
                    var imgurl = StyleHelper.getImgUrl($example.css(pre + "image"));
                    if (imgurl) {
                        cssList[pre + "image"] = "url(\"" + imgurl + "\")";
                    }
                    cssList[pre + "color"] = $example.css(pre + "color");
                    cssList[pre + "repeat"] = $example.css(pre + "repeat");
                    if ($example.css(pre + "position") != "0% 0%") {
                        cssList[pre + "position"] = $example.css(pre + "position");
                    }
                    if ($example.css(pre + "attachment") != "scroll") {
                        cssList[pre + "attachment"] = $example.css(pre + "attachment");
                    }
                    //test
                    console.log($example.css(pre + "image"), value);
                    break;
                default:
                    cssList[name] = value;
                    break;
            }
        }
        $("[data-style]").each(function () {
            var name = $(this).data("style");
            if (cssList[name]) { $(this).val(cssList[name]); }
        });
    }
    function save() {
        var style = listToCss();
        return style;
    }
    function cssChange(name,value)
    {
        if (cssList[name]) { cssList[name] = value; }
        else { cssList[name] = value; }
        var style = listToCss();
        $("#example").attr("style", style);
        $("#css_text").val(cssMod.filter + "{" + style + "}");
    }
    $(function () {
        //var unitArr = ["px", "pt", "em", "cm", "%"];
        //$(".unitdp").each(function () {
            
        //});
        $(".form-control").bind("paste cut change", function () {
            var name = $(this).data("style");
            var value = $(this).val();
            cssChange(name, value);
        });
        //如背景定位等 
        $(".form-control [data-for]").change(function () {
            var $this = $(this);
            var $tar = $("." + $this.data("for"));
            $tar.val($this.val());
        });
        $(".color_text").ColorPickerSliders({
            size: 'default', placement: 'bottom', color: $(this).val(), swatches: true, sliders: false, hsvpanel: true, previewformat: "hex",
            onchange: function (container, color) {
                var $input = $(this.connectedinput.context);
                var hex = color.tiny.toHexString()
                cssChange($input.data("style"), hex);
            }
        });
    })
</script>
</asp:Content>