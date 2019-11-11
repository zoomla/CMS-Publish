var StyleHelper = {
    RGBTo16: function (rgb) {
        //$().css("color");或255,255,255
        if (rgb.indexOf("(") > -1) { rgb = rgb.split('(')[1]; }
        if (rgb.indexOf(")") > -1) { rgb = rgb.split(')')[0]; }
        var str = [3];
        for (var k = 0; k < 3; k++) {
            str[k] = parseInt(rgb.split(',')[k]).toString(16);//str 数组保存拆分后的数据 
            if ((str[k] + "").length < 2) { str[k] = "0" + str[k]; }
        }
        var colsr = '#' + str[0] + str[1] + str[2];
        return colsr;
    },
    HexToRGB: function (hex, iswrap) {//#000000
        var reg = /^#([0-9a-fA-f]{3}|[0-9a-fA-f]{6})$/;
        var sColor = (hex + "").toLowerCase();
        if (sColor && reg.test(sColor)) {
            if (sColor.length === 4) {
                var sColorNew = "#";
                for (var i = 1; i < 4; i += 1) {
                    sColorNew += sColor.slice(i, i + 1).concat(sColor.slice(i, i + 1));
                }
                sColor = sColorNew;
            }
            //处理六位的颜色值  
            var sColorChange = [];
            for (var i = 1; i < 7; i += 2) {
                sColorChange.push(parseInt("0x" + sColor.slice(i, i + 2)));
            }
            if (iswrap == true) { return "RGB(" + sColorChange.join(",") + ")"; }
            else { return sColorChange.join(","); }
        } else {
            return sColor;
        }
    },
    ConverToInt: function (val) { //默认返回1
        if (!val || val == "" || val == "auto") { val = "1"; }
        val = val.replace(/ /g, "").replace("px", "").replace("em", "");
        val = parseInt(val);
        if (isNaN(val)) { val = 1; }
        return val;
    },
    setRadVal: function (name, value) {
        //用于rad与chk的默认值设定
        if (value == "" || name == "") { return; }
        $("input[name=" + name + "]").each(function () {
            if (this.value == value) {
                this.click();
            }
            else { this.checked = false; }
        });
    },
    //从style属性中获取img路径,并去除http格式
    getImgUrl: function (url) {// css("background-image");
        if (!url || url == "none" || url.indexOf("url()") > -1) { return ""; }
        url = url.toLowerCase();
        //url("http://win05:86/Plugins/WebUploader/images/icons.png")
        var start = url.indexOf("url(") + 4;
        var end = url.indexOf(")");
        url = url.substring(start, end - start + 4).replace(/\"/g, "");
        if (url.indexOf("http://") > -1 || url.indexOf("https://") > -1) {
            url = url.replace("http://", "").replace("https://", "");
            var start = url.indexOf('/');
            url = url.substr(start, url.length - start);
        }
        //   /plugins/webuploader/images/icons.png
        return url;
    }
};