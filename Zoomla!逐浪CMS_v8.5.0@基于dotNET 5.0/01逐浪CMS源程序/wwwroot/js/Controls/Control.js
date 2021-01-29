﻿/*用于放置公用的控件方法,JSON,需要control.css,zl_array.js支持*/
(function ($) {
    $.fn.extend({
        ZLSteps: function (list, current) {
            //支持以,号切割的字符串,或list[{text:"",title:""}]
            if (!list) { console.log("ZLSteps", "list的值为空"); }
            if (typeof list == "string") {
                var strArr = list.split(',');
                list = [];
                for (var i = 0; i < strArr.length; i++) {
                    list.push({ text: strArr[i], title: strArr[i] });
                }
            }
            current = current ? current : 1;
            /*---------------------------------------------------------------*/
            var $wrap = $('<div class="zl_steps"></div>');
            var tlp = '<div class="wrap" data-step="@index" title="@text"><div class="@state"><label><span class="round">@index</span> <span>@text</span></label><i class="step_right_bg"></i><i class="step_right"></i></div></div>';
            for (var i = 0; i < list.length; i++) {
                var model = list[i];
                model.index = (i + 1);
                if (model.index < current) { model.state = "finished"; }
                else if (model.index == current) { model.state = "current"; }
                else { model.state = "todo"; }
                if (model.index == list.length) { model.state += " last"; }
            }
            var $items = JsonHelper.FillItem(tlp, list, function ($item, mod) {
                if (mod.index < current) { $item.find(".round").html("").append('<i class="zi zi_check"></i>'); }
            });
            $wrap.append($items);
            this.html("").append($wrap);
        },
        /***********************************************************************************************/
        //图标选择插件
        IconSelect: function (opts) {
            var $src = $(this);
            var tlp = '<div class="icon_wrap"><input type="text" class="form-control text_300 icon_txt">'
            + '<button type="button" class="btn btn-info icon_btn" style="margin-left:5px;margin-right:5px;">选择图标</button><span class="icon_sp" style="font-size:1.5em;"></span></div>';
            var $tlp = $(tlp), $txt = $tlp.find(".icon_txt"), $btn = $tlp.find(".icon_btn"), $sp = $tlp.find(".icon_sp");
            //-------------------------bind events
            function updateValue(value) {
                $src.val(value);
                $sp.attr("class", value);
            }
            $btn.click(function () {
                ShowComDiag("/common/icon2.html?id=" + $src.attr("id"), "选择图标");
            });
            $txt.bind("paste cut blur", function () {
                setTimeout(function () { updateValue($txt.val()); }, 50);
            })
            $txt.keyup(function () { updateValue($txt.val()); })
            if (!window.iconBack) { window.iconBack = {}; }
            window.iconBack = function (value) {
                $txt.val(value);
                updateValue(value);
                CloseComDiag();
            }
            //-------------------------place
            $src.hide();
            $src.after($tlp);
            if ($src.val() != "") { $txt.val($src.val()); updateValue($src.val()); }
        }
    });
})(jQuery)

var Control = {
    EnableEnter: function () {//回车插件,过滤不可见控件
        $("input[data-enter]").keydown(function () {
            if (event.keyCode == 13) {
                var flag = false;
                var code = $(this).data("enter");
                var $arr = $("[data-enter]:visible").sort(function (a, b) { return $(a).data("enter") - $(b).data("enter") });
                var $next = null;
                for (var i = 0; i < $arr.length; i++) {
                    if ($($arr[i]).data("enter") > code) {
                        $next = $($arr[i]); break;
                    }
                }
                if ($next == null || $next.length < 0) return false;
                switch ($next.attr("type")) {
                    case "button":
                        $next.trigger("click").focus();
                        break;
                    case "submit"://有Bug,会提交两镒
                        flag = true;
                        break;
                    default:
                        $next.focus();
                        break;
                }
                return flag;
            }
        });//EnableEnter End;
    },
    Enter: function (id) {
        flag = false;
        if (event.keyCode == 13) {
            $next = $("#" + id);
            if ($next == null || $next.length < 0) { return false; }
            switch ($next.attr("type")) {
                case "button":
                    $next.trigger("click");
                    if (event) { event.preventDefault(); event.stopPropagation(); }
                    break;
                case "submit":
                    flag = true;
                    break;
                default:
                    $next.focus();
                    break;
            }
            return flag;
        }
    }
}
Control.Scroll = {
    ToTop: function () {
        function setScollTop() {
            if ($(window).scrollTop() > 1) {
                $(window).scrollTop($(window).scrollTop() - 30);
                setTimeout(setScollTop, 1);
            }
        }
        setTimeout(setScollTop, 1);
    },
    ToBottom: function () {
        function setScollDown() {
            var top = $(window).scrollTop();
            $(window).scrollTop($(window).scrollTop() + 30);
            if (top != $(window).scrollTop())
                setTimeout(setScollDown, 1);
        }
        setTimeout(setScollDown, 1);
    }
}
Control.Mobile = {
    SendVaildMsg: function (btnid, codeid, hcodeid, mobile) {//发送短信验证码
        var $btnobj = $("#" + btnid);//按钮对象
        var $codeobj = $("#" + codeid);//验证码输入框对象
        var $hcodeobj = $("#" + hcodeid);//验证码隐藏值对象
        if ($codeobj.val().length < 4) { alert("验证码位数不正确"); return; }
        if (ZL_Regex && !ZL_Regex.isMobilePhone(mobile)) { alert("手机号码格式不正确"); return; }
        $btnobj.attr("disabled", "disabled");
        $.post("/API/Mobile", { action: "SendVailMsg", code: $codeobj.val(), hcode: $hcodeobj.val(), mobile: mobile }, function (data) {
            var model = APIResult.getModel(data);
            if (APIResult.isok(model)) {
                alert("验证码已发送至您的手机,请您验收!");
                var sendminute = 60;//计时
                var sendtimeflag = setInterval(function () {
                    sendminute--;
                    $btnobj.text("(" + sendminute + "秒后)重发验证码");
                    if (sendminute <= 0) {//时间到
                        $btnobj.text("重发验证码");
                        $btnobj.removeAttr("disabled");
                        sendminute = 60;
                        clearInterval(sendtimeflag);
                    }
                }, 1000);
            }
            else
            {
                alert("发送失败!详情:" + model.retmsg);
                $btnobj.removeAttr("disabled");
            }
        })
    }
};
Control.btn = {
    wait: function (obj, time) {
        var ref = Control.btn;
        ref.wait_db.obj = obj;
        ref.wait_db.text = obj.value;
        setTimeout(function () { obj.disabled = true; }, 50);
        ref.wait_db.inter = setInterval(function () { time = time - 1; obj.value = "请等待(" + time + ")秒"; }, 1000);
        setTimeout(function () { ref.wait_clear();}, time * 1000);
    },
    wait_db: { obj: null, inter: null, text: "" },
    wait_clear: function () {
        var ref = Control.btn;
        clearInterval(ref.wait_db.inter);
        ref.wait_db.obj.value = ref.wait_db.text;
        setTimeout(function () { $(ref.wait_db.obj).removeAttr("disabled"); }, 100);
    }
};
//-----------------------AddArrive
var ZLTab = function (cfg) {
    var ref = this;
    if (!cfg) { cfg = {}; }
    if (cfg.tabs) { ref.tabs = cfg.tabs; }

}
ZLTab.prototype.tabs = ".zl-tab";
ZLTab.prototype.change = function (tab) {
    var ref = this;
    $(ref.tabs).hide();
    $(tab).show();
}
ZLTab.prototype.changeByRad = function (input) {
    //<input type="radio" data-tab="#tab1">
    var ref = this;
    ref.change($(input).data("tab"));
}
ZLTab.prototype.initByRad = function (cfg) {
    //{prefix:"type"}
    var ref = this;
    var prefix = cfg.prefix;
    var $rads = $("input[name='" + prefix + "_rad']");
    ref.tabs = "." + prefix + "-tab";
    var activeRad = null;
    //附加元素,绑定事件
    for (var i = 0; i < $rads.length; i++) {
        var tab = "#" + prefix + $rads[i].value;
        $($rads[i]).data("tab", tab);
        $($rads[i]).click(function () {
            ref.changeByRad(this);
        });
        //第一个选中元素触发事件
        if (activeRad == null && $rads[i].checked == true) { activeRad = $rads[i]; }
    }
    if (activeRad == null && $rads.length > 0) { activeRad = $rads[i]; }
    $(activeRad).click();
}
//----------------------PaymentList
var ZLSort = function () { }
ZLSort.prototype.cfg = { css: ".zlsort", cb: function () { } };
//从dom元素中获取信息
ZLSort.prototype.getModel = function (dom) {
    var $dom = $(dom);
    return { "field": $dom.data("field"), "sort": $dom.data("sort"), "text": $dom.text() };
}
//获取并填充模板
ZLSort.prototype.getTlp = function (name, model) {
    var ref = this;
    var tlp_asc = '<a href="javascript:;" class="{css}" data-field="{field}" data-sort="asc">{text} <span class="zi zi_sortnumericdown"></span></a>';
    var tlp_desc = '<a href="javascript:;" class="{css}" data-field="{field}" data-sort="desc">{text} <span class="zi zi_sortamountup"></span></a>';
    //同时仅允许一个字段排序
    var tlp_no = '<a href="javascript:;" class="{css}" data-field="{field}" data-sort="">{text}</a>';
    var tlp = "";
    if (name == "desc") { tlp = tlp_desc; }
    else if (name == "none") { tlp = tlp_no; }
    else { tlp = tlp_asc; }
    var css = ref.cfg.css.replace(".", "");
    tlp = tlp.replace("{css}", css).replace("{field}", model.field).replace("{text}", model.text);
    return tlp;
}
//单击刷新图标,并触发回调
ZLSort.prototype.on_click = function (ref, $dom) {
    //点击切换标识,并提交重排请求
    $(ref.cfg.css).find(".zi").remove();
    var model = ref.getModel($dom);
    var sort = $dom.data("sort");
    sort = (sort == "asc" ? "desc" : "asc");
    var $item = $(ref.getTlp(sort, model));
    $item.click(function () { ref.on_click(ref, $item); });
    $dom.replaceWith($item);
    if (ref.cfg.cb) {
        var orderStr = model.field + "_" + sort;
        ref.cfg.cb(orderStr);
    }
}
ZLSort.prototype.init = function (cfg) {
    var ref = this;
    if (cfg) {
        if (cfg.css) { ref.cfg.css = cfg.css; }
        if (cfg.cb) { ref.cfg.cb = cfg.cb; }
    }
    var $doms = $(ref.cfg.css);
    if ($doms.length < 1) { console.warn("zlsort", "未匹配标识"); return; }
    //--------------------------
    $doms.each(function () {
        //<span class="zlsort" data-field="paymentid">ID</span>
        var model = ref.getModel(this);
        var $item = $(ref.getTlp("none", model));
        $item.click(function () { ref.on_click(ref, $item); });
        $(this).replaceWith($item);
    });
}