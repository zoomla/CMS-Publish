
var editor = null;
$(function () {
    editor = CodeMirror.fromTextArea(document.getElementById("css_text"), {
        mode: "text/css",
        lineNumbers: true,
        textWrapping: false,
        styleActiveLine: true,
        readOnly:true
    });
    editor.setSize('auto', '200');
})
//-------------------------------------
//data与value最后会附在一个实例下,所以其中的参数不能同名
var app = new Vue({
    el: "#app",
    data: {
        background: {
            setFast: function (item) {
                //event.target 目标元素
                var ref = this;
                var bkimage = "/Plugins/CSSEditor/assets/image/background.jpg";
                var bkimage_grid = "/Plugins/CSSEditor/assets/image/background_grid.jpg";
                for (key in ref.value) {
                    ref.value[key] = "";
                }
                switch (item) {
                    case "图片自适应":
                        ref.value.background_repeat = "no-repeat";
                        ref.value.background_image = bkimage;
                        ref.value.background_size = "100%";
                        break;
                    case "图片自动居中":
                        ref.value.background_repeat = "no-repeat";
                        ref.value.background_image = bkimage;
                        ref.value.background_position = "center center";
                        break;
                    case "图片重复铺满":
                        ref.value.background_repeat = "repeat";
                        ref.value.background_image = bkimage_grid;
                        break;
                    case "淡灰背景色":
                        ref.value.color = "#ddd";
                        break;
                }
            },
            fast: ["图片自适应", "图片自动居中", "图片重复铺满", "淡灰背景色"],
            value: { background_color: "", background_repeat: "", background_image: "", background_position: "", background_attachment: "", background_size: "" }
        },
        font: {
            setFamily: function (item) {
                var ref = this;
                ref.value.font_family = item.v;
            },
            famils: [{ n: "Arial", v: "Arial" }, { n: "微软雅黑", v: "Microsoft YaHei" }, { n: "微软正黑体", v: "Microsoft JhengHei" }
                , { n: "楷体", v: "KaiTi" }, { n: "仿宋", v: "FangSong" }, { n: "新宋体", v: "NSimSun" }
                , { n: "宋体", v: "SimSun" }, { n: "黑体", v: "SimHei" }, { n: "标楷体", v: "DFKai-SB" }
                , { n: "细明体", v: "MingLiU" }, { n: "新细明体", v: "PMingLiU" }, { n: "Comic Sans MS", v: "Comic Sans MS" }
                , { n: "Impact", v: "Impact" }, { n: "Lucida Sans Unicode", v: "Lucida Sans Unicode" }, { n: "Trebuchet MS", v: "Trebuchet MS" }
                , { n: "Verdana", v: "Verdana" }, { n: "Georgia", v: "Georgia" }
            ],
            value: { "font_size": "", "font_size_unit": "rem", "color": "#000000", "font_family": "", "font_weight": "", "line_height": "", "line_height_unit": "rem" }
        },
        wh: {
            value: {
                width: "", width_unit: "rem",
                height: "", height_unit: "rem",
                padding: "", padding_unit: "rem",
                margin: "", margin_unit: "rem",
                display:""
            }
        },
        border: {
            value: { border_color: "", border_style: "none", border_width: "", border_width_unit: "rem" }
        },
        position: {
            value: {
                position: "", z_index: "", top: "", top_unit: "rem",
                right: "", right_unit: "rem", left: "",
                left_unit: "rem", bottom: "", bottom_unit: "rem"
            }
        },
        //自定义手写的css,优先级最高
        custom: {
            value: [],
            add: function () {
                this.value.push({ css: "" });
            },
            del: function (item) {
                var ref = this;
                for (var i = 0; i < ref.value.length; i++) {
                    if (ref.value[i] == item) { ref.value.splice(i, 1); }
                }
            }
        },
        styles: ["background", "font", "wh", "border", "position", "custom"],
        common: { units: ["rem", "em", "px", "%"] },
        config: { "filter": "#example" }
    },
    methods: {
        showcss: function () {
            if (!app) { return ""; }
            var model = this.getCssModel();
            $("#example").attr("style", model.style);
            var line_style = "\n" + model.style.replace(/;/ig, ";\n");
            var result = app.config.filter + "{" + line_style + "}";
            if (editor) { editor.setValue(result); }
            return "";
        },
        getCssModel: function () {
            var model = { style: "" };
            var style = "";
            if (!app) { return model; }
            var formatKey = function (key, array) {
                //部分属性忽略
                if (!key || (key.indexOf("_unit") > -1)) { return null; }
                var value = array[key];
                //空值忽略
                if (!value || value == "none" || value == "#000000") { return null; }
                if (array[key + "_unit"]) { value = value + array[key + "_unit"]; }
                key = key.replace("_", "-");
                return {
                    "key": key,
                    "value": value,
                    getStyle: function (prefix) {
                        var ref = this;
                        if (!prefix) { prefix = ""; }
                        return prefix + ref.key + ":" + ref.value + ";";
                    }
                };
            }
            //------------background
            {
                var value = app.background.value;
                for (var key in value) {
                    var item = formatKey(key, value);
                    if (!item) { continue; }

                    if (item.key == "background-image") {
                        style += "background-image:url(" + value[key] + ");";
                    }
                    else {
                        style += item.getStyle();
                    }
                }
            }
            //-----------font
            {
                var value = app.font.value;
                for (var key in value) {
                    var item = formatKey(key, value);
                    if (!item) { continue; }
                    style += item.getStyle();
                }
            }
            //-----------width&height
            {
                var value = app.wh.value;
                for (var key in value) {
                    var item = formatKey(key, value);
                    if (!item) { continue; }
                    style += item.getStyle();

                }
            }
            //-----------border
            {
                var array = app.border.value;
                for (var key in array) {
                    var item = formatKey(key, array);
                    if (!item) { continue; }
                    style += item.getStyle();
                }
            }
            //-----------position
            {
                var array = app.position.value;
                for (var key in array) {
                    var item = formatKey(key, array);
                    if (!item) { continue; }
                    style += item.getStyle();
                }
            }
            //-----------custom
            {
                var array = app.custom.value;
                for (var i = 0; i < array.length; i++) {
                    var css = array[i].css;
                    if (!css || css.indexOf(":") < 0) { continue; }
                    if (css.lastIndexOf(";") != (css.length - 1)) { css += ";"; }
                    style += css;
                }
            }
            //-----------
            for (var i = 0; i < app.styles.length; i++) {
                var name = app.styles[i];
                model[name] = app[name].value;
            }
            model.style = style;
            return model;
        }
    },
});
$(function () {
    $(".color_text").ColorPickerSliders({
        size: 'default', placement: 'bottom', color: $(this).val(), swatches: true, sliders: false, hsvpanel: true, previewformat: "hex",
        onchange: function (container, color) {
            var $input = $(this.connectedinput);
            var hex = color.tiny.toHexString();
            switch ($input.data("for")) {
                case "background":
                    app.background.value.background_color = hex;
                    break;
                case "font":
                    app.font.value.color = hex;
                    break;
                case "border":
                    app.border.value.border_color = hex;
                    break;
            }
        }
    });
})
//-------百变微站
var amazing={};
amazing.init = function (model) {
    for (var i = 0; i < app.styles.length; i++) {
        var name = app.styles[i];
        if (!model.value[name]) { continue; }
        app[name].value = model.value[name];
    }
    if (model.filter) { app.config.filter = model.filter; }
}
amazing.save=function(){
    return app.getCssModel();
}