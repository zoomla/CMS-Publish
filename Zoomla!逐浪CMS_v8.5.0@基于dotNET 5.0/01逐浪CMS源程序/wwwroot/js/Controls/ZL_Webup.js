﻿/*
*需ZL_Common,ZL_Dialog
*未实现:预览功能
*使用Json方式,纯支持方式实现
*/
//附件操作JS,需ZL_Common.js,ZL_Dialog支持
//WUFile {name: "test.html", size: 76272, type: "text/html", lastModifiedDate: Thu Apr 16 2015 17:41:02 GMT+0800 (China Standard Time), id: "WU_FILE_0"…}
var MFileUP = function (option) {
    var ref = this;
    var def_config = { id: "uploader", hid: "Attach_Hid", json: { ashx: "action=General", pval: "", accept: "files", compress: false,fileNum:100 }, nametype: "all" }//divid,hiddenID,给上传控件的Json
    ref.config = $.extend(def_config, option);
    if (window.ZL_Dialog) { ref.attachDiag = new ZL_Dialog(); }
}
MFileUP.prototype.imgli = "<li data-name='@name'><p><img src='@src' /></p>"
                         + "<div class='file-panel' style='height: 0px;'><span class='cancel'>删除</span></div></li>";//图片li模板
MFileUP.prototype.divli = "<li data-name='@name'><div class='imgview'><div class='ext @ex'></div><div class='fname'>@fname</div></div><div class='file-panel' style='height: 0px;'><span class='cancel'>删除</span><a href='/PreView?vpath=@fsrc' target='_blank' title='预览'><span class='prev'></span></a></div></li>";
MFileUP.prototype.onlyimgli="<li data-name='@name'><p><img src='@src' /></p>"
                         + "<div class='file-panel' style='height: 0px;'><a href='/Plat/Doc/DownFile?FName=@fsrc' target='_blank' title='下载'><span class='down'></span></a><a href='/PreView?vpath=@fsrc' target='_blank' title='预览'><span class='prev'></span></a></div></li>";
MFileUP.prototype.onlydivli = "<li data-name='@name'><div class='imgview'><div class='ext @ex'></div><div class='fname'>@fname</div></div><div class='file-panel' style='height: 0px;'><a href='/Plat/Doc/Download?FName=@fsrc' target='_blank' title='下载'><span class='down'></span></a>"
                        + "<a href='/PreView?vpath=@fsrc' target='_blank' title='预览'><span class='prev'></span></a></div></li>";
MFileUP.prototype.ShowFileUP = function () {
    //var ref = this.constructor == Object ?this : ZL_Webup;
    var ref = this;
    //兼容 
    if (!this.attachDiag) { ZL_Webup.ShowFileUP(); }
    else
    {
        ref.attachDiag.title = "文件上传";
        ref.attachDiag.reload = true;
        ref.attachDiag.backdrop = true;
        ref.attachDiag.maxbtn = false;
        ref.attachDiag.width = "width1100";//Blog
        ref.attachDiag.url = "/IO/WebUP?callback=" + ref.config.id + "&json=" + JSON.stringify(ref.config.json);//{\"ashx\":\"action=Blog\",\"pval\":\"\"}
        ref.attachDiag.ShowModal();
    }
};
MFileUP.prototype.AddAttach = function (file, ret, pval) {
    var ref = this;
    $uploader = $("#" + ref.config.id);
    $hid = $("#" + ref.config.hid);
    //文件名不正确,被阻挡
    if (ret._raw.indexOf("|") > 0) { return; }
    var src = ret._raw;
    var imgli = ref.imgli;
    var divli = ref.divli;
    $uploader.show();
    var li = "", name = src;
    if (ref.config.nametype == "fname") {
        name = GetFname(src);
    }
    if (IsImage(src)) {
        var li = imgli.replace(/@src/, src).replace(/@name/, name).replace(/@fsrc/g, encodeURI(name));
    }
    else {
        var li = divli.replace("@ex", GetExName(src)).replace("@fname", GetFname(src, 6)).replace(/@name/, name).replace(/@fsrc/g, encodeURI(name));
    }
    $uploader.find(".filelist").append(li);
    if (ref.config.nametype == "all") {
        $hid.val($hid.val() + src + "|");
    }
    else if (ref.config.nametype == "fname") {
        $hid.val($hid.val() + GetFname(src, 0) + "|");//仅存文件名,用于防止用户随意指定图片
    }
    ref.BindAttachEvent();
    //其只要返回了信息,便代表已全部传输完成,可以直接关闭.
    ref.attachDiag.CloseModal();
};
MFileUP.prototype.RemoveAttach = function (name) {
    var ref = this;
    $uploader = $("#" + ref.config.id);
    $hid = $("#" + ref.config.hid);
    var attctArr = $hid.val().split('|');
    var result = "";
    for (var i = 0; i < attctArr.length; i++) {
        if (attctArr[i] != name) {
            result += attctArr[i] + "|";
        }
    }
    result = result.replace("||", "|").trim("|");
    $hid.val(result);
    if ($uploader.find(".filelist li").length < 1) { $uploader.hide(); }
}
MFileUP.prototype.BindAttachEvent = function () {
    var ref = this;
    $uploader = $("#" + ref.config.id);
    $uploader.find(".filelist li").mouseenter(function () {
        $btns = $(this).find(".file-panel");
        $btns.stop().animate({ height: 30 });
    }).mouseleave(function () {
        $btns = $(this).find(".file-panel");
        $btns.stop().animate({ height: 0 });
    });
    $uploader.find(".filelist li .cancel").click(function () {
        $li = $(this).closest("li");
        ref.RemoveAttach($li.data("name"));
        $li.remove();
    });
};
MFileUP.prototype.AddLi = function (imgs) {
    if (typeof (imgs) == "string") { imgs = imgs.split('|'); }
    for (var i = 0; i < imgs.length; i++) {
        if (!imgs[i] || imgs[i] == "") { continue; }
        else { ZL_Webup.AddAttach("", { _raw: imgs[i] }); }
    }
}
MFileUP.prototype.AddReadOnlyLi = function (imgs,id) {
    if (!imgs || imgs == "") { return; }
    var ref = this;
    if (!id) { id = ref.config.id; }
    $uploader = $("#" + id);
    $hid = $("#" + ref.config.hid);
    for (var i = 0; i < imgs.split('|').length; i++) {
        var src = imgs.split('|')[i];
        if (!src || src == "") { continue; }
        var imgli = ref.onlyimgli;
        var divli = ref.onlydivli;
        $uploader.show();
        var li = "", name = GetFname(src);
        if (IsImage(src)) {
            var li = imgli.replace(/@src/g, src).replace(/@name/, name).replace(/@fsrc/g, encodeURI(src));
        }
        else {
            var li = divli.replace("@ex", GetExName(src)).replace("@fname", GetFname(src, 6)).replace(/@name/, name).replace(/@fsrc/g, encodeURI(src));
        }
        $uploader.find(".filelist").append(li);
    }
    ref.BindAttachEvent("preview");
}
var ZL_Webup = new MFileUP();
ZL_Webup.attachDiag = new ZL_Dialog();
ZL_Webup.config.attachDiag = new ZL_Dialog();
var SFileUP = {
    AjaxUpFile: function (fid,callback) {
        var formdata = new FormData();
        var fileup = null;
        if (typeof (fid) == "object") { fileup = fid; }
        else { fileup = document.getElementById(fid); }
        //-------------------------------------------
        if (!fileup || fileup.files.length < 1) { console.log("[" + fid + "]上传控件不存在,或值为空"); return; }
        formdata.append("file", fileup.files[0]);
        $.ajax({
            type: 'POST',
            url: '/IO/UploadFileHandler',
            data: formdata,
            processData: false,
            contentType: false,
            success: callback
        });
    },
    AjaxUpBase64:function(base64str,callback){
        $.post('/IO/Base64', { base64: base64str }, callback);
    },
    isWebImg: function (fname) {
        if (!fname || fname == "") { return false; }
        fname = fname.toLowerCase();
        if (fname.indexOf("data:image/") > -1)//base64
        {
            return true;
        }
        else if (fname.indexOf(".") > 0) {
            var start = fname.lastIndexOf(".");
            var ext = fname.substring((start + 1), fname.length);//jpg|png|gif
            return (ext == "jpg" || ext == "png" || ext == "gif"||ext=="jpeg")
        }
        else { return false; }
    }
}
//picup.zip = { enable: false, width: 640, quality: 0.8 };//压缩配置,如配置了该项,则启用压缩功能

//------------------------MessageSend,MessageRead
//var pic = { id: "pic_up", txtid: null };
//pic.sel = function (id) { $("#" + pic.id).val(""); $("#" + pic.id).click(); pic.txtid = id; }
//pic.upload = function () {
//    var fname = $("#" + pic.id).val();
//    if (!SFileUP.isWebImg(fname)) { alert("请选择图片文件"); return false; }
//    SFileUP.AjaxUpFile(pic.id, function (data) {
//        var url = "<%:ZoomLa.Components.SiteConfig.SiteInfo.SiteUrl%>";
//        $("#" + pic.txtid).val(url + data);
//    });
//}
//pic.preSave = function () {var src = $("#pic_img").attr("src");$("#pic_hid").val(src);}
//------------------------Note\AddProject
//<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
//<script src="/JS/Controls/ZL_Dialog.js"></script>
//<script src="/JS/Controls/ZL_Webup.js"></script>
//$(function () {
//    ZL_Webup.config.json.ashx = "";
//    ZL_Webup.config.json.accept = "img";
//    $("#upfile_btn").click(ZL_Webup.ShowFileUP);
//    if (!ZL_Regex.isEmpty($("#Attach_Hid").val())) {
//    var files = $("#Attach_Hid").val().split('|');$("#Attach_Hid").val("");
//    for (var i = 0; i < files.length; i++) {if (!files[i]) { continue;}AddAttach(files[i], { _raw: files[i] }, {});}}
//})
//function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
//<input type="button" id="upfile_btn" class="btn btn-info btn-sm" value="选择文件" />
//<div id="uploader" class="uploader"><ul class="filelist"></ul></div>
//<input type="hidden" id="Attach_Hid" name="Attach_Hid" />
//
//<ZL:PCUP runat="server" ID="SU_MJST" Field="SU_MJST" MaxCount="1"/>
//==========================================
var fileup = function (opts) {
    var ref = this;
    this.opts = $.extend({}, ref.defaultOption, opts);
    //-----------------
    function createFileUP(opts) {
        var accept = "";
        if (!opts.accept || opts.accept == "") { }
        else if (opts.accept == "image") { accept = 'accept="image/jpg,image/png,image/jpeg"'; }
        else { accept = 'accept="' + opts.accept + '"'; }
        return $('<input type="file" ' + accept + '/>');
    }
    //-----------------
    this.$up = createFileUP(opts);
    this.$up.change(function () {
        if (ref.$up.val() == "") { console.log("未选择文件"); return; }
        if (ref.opts.up_before) { ref.opts.up_before(); }

        if (ref.opts.zip.enable === true) {
            if (!window.lrz) { console.log("启用了压缩上传,但未引入lrz"); return; }
            //转为base64压缩后上传
            lrz(ref.$up[0].files[0], ref.zip, function (r) {
                SFileUP.AjaxUpBase64(r.base64, function (data) {
                    if (ref.opts.up_after) { ref.opts.up_after(data); }
                });
            });
        }
        else {
            SFileUP.AjaxUpFile(ref.$up[0], function (data) { if (ref.opts.up_after) { ref.opts.up_after(data); } });
        }
    });
}
fileup.prototype.sel = function () {
    this.$up.click();
}
fileup.prototype.defaultOption = {
    accept: "",
    zip: { enable: false, width: 640, quality: 0.8 },
    up_before: function () { },
    up_after: function () { }
}
//var pic = new fileup({ accept: "image" });
//var pic2 = new fileup({ zip: {enable:true}});

var picup = new fileup({ accept: "image", up_after: function () { } });