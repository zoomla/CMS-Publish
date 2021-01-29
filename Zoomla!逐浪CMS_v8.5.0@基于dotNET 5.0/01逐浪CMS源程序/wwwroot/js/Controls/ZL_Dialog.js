﻿//支持系统图标选择
var ZL_DialogCount = 0;
//self.importScripts('~/res/js/bootstrap.bundle.min.js');
//import { createRequire } from 'module'
//bootstrap = require('~/res/js/bootstrap.bundle.min.js');
//function getModal(id) {
//    $.getScript('/res/js/bootstrap.bundle.min.js', function () {
//        new bootstrap.Modal(document.getElementById(id), {
//            keyboard: false
//        }});
//}
//console.log(bootstrap);
var ZL_Dialog = function () {
    var opts = arguments.length > 0 ? arguments[0] : {};
    this.id = opts.id ? opts.id : "mymodal" + (ZL_DialogCount++);
    this.title = opts.title;
    this.backdrop = opts.backdrop ? opts.backdrop : false;//背景点击是否关闭
    this.preajaxurl = "";//上次加载的ajaxurl,避免重复加载相同页
    this.ajaxurl = "";
    this.ajaxcallback = null;
    this.url = "";//iframe url
    this.maxbtn = opts.maxbtn ? opts.maxbtn : true;//是否显示全屏按钮
    this.closebtn = opts.closebtn ? opts.closebtn : true;//是否显示关闭按钮
    this.isBigClose = opts.isBigClose ? opts.isBigClose : true;//关闭按钮是否显示大图标
    this.content = opts.content;//自定义div
    this.body = "";//自定义html
    this.width = opts.width;//设定为" "则默认600,否则调用max_width1100
    this.height = opts.height;//已作废
    this.foot = opts.foot;//是否使用底部
    this.obj = undefined;
    this.reload = true;//强制刷新
    this.wait = "加载中";
    this.iframe = null;//js对象
};
ZL_Dialog.prototype = {
    ShowModal: function (_url,_title) {
        var ref = this;
        if (_url == undefined) { _url = ref.url; } else { ref.url = _url; }
        if (_title == undefined) { _title = ref.title; } else { ref.title = _title; }
        var ifrurl = $(ref.iframe).attr("src");
        var flag = ref.reload || (ref.url && ifrurl && ref.url != ifrurl) || (ref.ajaxurl&&ref.ajaxurl!=ref.preajaxurl);//未初始化,已指定强制刷新,url改变
        if (!flag) {
            $("#" + ref.id).find(".modal-title").html(ref.title);
            $("#" + ref.id).modal({}); return;
        }
        var bodyTlp = "<div class='modal bd-example-modal-lg' id=" + ref.id + " @backdrop><div class='modal-dialog modal-dialog-centered modal-lg @width'><div class='modal-content'><div class='modal-header'><h5 class='modal-title'>@Title</h5> @header </div><div style='height:auto;overflow-y:auto;' class='modal-body'>@body</div>@Foot</div></div></div>";
        var header = "<button type='button' class='btn-close' aria-label='Close' data-bs-dismiss='modal'></button>@Opion";
        var bodyhtml = "", Opion = "", foot = "", closeStyle = ref.isBigClose ? "<span aria-hidden='true'>×</span>" : "×", closeStyle = ref.closebtn ? closeStyle : "";
        if (ref.ajaxurl && ref.ajaxurl != "") {//ajax加载
            bodyhtml = "";
            setTimeout(function () { $("#" + ref.id).find(".modal-body").load(ref.ajaxurl, ref.ajaxcallback); }, 200);
            ref.preajaxurl = ref.ajaxurl;
        }
        else if (ref.url && ref.url != "") {//iframe加载
            bodyhtml = "<iframe class='modal_ifr' style='width:100%;border:none;' src='" + ref.url + "'></iframe>";
            Opion = ref.maxbtn ? "<button type='button' id='BigOpion' title='全屏' class='btn zi zi_expand'></button>" : "";
        } else if (ref.body != "" && !ref.reload) {
            bodyhtml = ref.body;
        }
        else {//直接加载html
            bodyhtml = $("#" + ref.content).html();
            if (!bodyhtml || bodyhtml == "") {
                bodyhtml = ref.body;
            }
        }
        if (ref.foot != "" && ref.foot != undefined) {
            foot = "<div class='modal-footer'>" + ref.foot + "</div>";
        }
        var widths = ref.width ? ref.width : "max_width1100";
        bodyTlp = bodyTlp.replace(/@width/, widths).replace(/@header/, header).replace(/@body/, bodyhtml).replace(/@Title/, ref.title).replace(/@Opion/, Opion).replace(/@Foot/, foot)
        .replace(/@backdrop/, ref.backdrop ? "data-backdrop='static'" : "").replace(/@close/,closeStyle);
        if (!ref.obj) {
            ref.obj = $(bodyTlp);
            $(document.body).append($(ref.obj));
        } else {
            $(ref.obj).html($(bodyTlp).html());
        }
        console.log(document.getElementById(ref.id));
        var modal = new bootstrap.Modal(document.getElementById(ref.id));
        modal.show();
        console.log(modal)
        //$(ref.obj).modal({});
        $(ref.obj).find("#BigOpion").click(function () {
            window.location = ref.url;
        });
        ref.iframe = $("#" + ref.id).find("iframe")[0];
        ref.reload = true;
        ref.AutoHeight();
    },
    CloseModal: function () {
        console.log("Close")
        var modal = new bootstrap.Modal(document.getElementById(this.id));
        console.log(modal)
        modal.toggle();
        modal.hide();
        $(".modal-backdrop").remove();
        console.log(modal)
        //$("#" + this.id).modal("hide");
    },
    AutoHeight: function () {//iframe自适应
        var ref = this;
        //$("#" + ref.id + " .modal_ifr").load(function () {

        //});
        var $ifrs=$("#" + ref.id + " .modal_ifr");
        if ($ifrs.length > 0) {
            $ifrs[0].onload = function () {
                var $obj = $(this);
                var iframeHeight = ref.height ? ref.height : $obj.contents().height();
                iframeHeight += 50;
                $obj.height(iframeHeight + 'px');
            }
        }
    },
    ShowMask: function (str) {//遮罩层 
        this.title = "";
        //this.width = "nowidth";
        this.maxbtn = false;
        this.backdrop = true;
        str = str == "" ? "加载中" : str;
        var waitstr = "<div class='text-center' style='margin:auto; width:100%;'>" + str + "<br /><i class='zi zi_spinner zi_pulse' style='margin-top:10px; font-size:40px;'></i></div>"
        this.body = waitstr;
        this.ShowModal();
        $(".modal-header").css({
            minHeight:'0',
            borderBottom:'none',
        })        
        $(".modal-content").css({marginTop:'30%'})
    }
}