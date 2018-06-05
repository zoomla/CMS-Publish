//---------初始
$(function () {
    if (window.ZL_Dialog) { comdiag = new ZL_Dialog(); }
    $("form:first").submit(function () {
        $(".submit-loading").each(function () {
            var $btn = $(this);
            setTimeout(function () { $btn.attr("disabled", "disabled") }, 50);
        });
    });
})
function disBtn(o, t) {
    if (typeof (o) == "string") { o = document.getElementById(o); }
    if (!o || o == undefined || o == NaN) { console.log("disBtn cancel;", o); return false; }
    if (arguments.length == 1) { setTimeout(function () { o.disabled = true; }, 50); }
    else if (arguments.length == 2) { setTimeout(function () { o.disabled = true;  }, 50); setTimeout(function () { o.disabled = false;  }, t); }
}
function GetEnterCode(a, id) {
    if (event.keyCode == 13) {
        switch (a) { case "click": $("#" + id).trigger("click"); break; case "focus": $("#" + id).focus(); break; }
        return false;
    }
    else { return true; }
}
function GetCurSize() {
    var w = (document.body.clientWidth || document.documentElement.clientWidth); var result = ""; if (w >= 1170)
        result = "lg"; else if (w >= 970)
            result = "md"; else if (w >= 750)
                result = "sm"; else
                result = "xs"; return result;
}
function HideColumn(value, cls, id) {
    //if (!cls || cls == "") cls = "hidden-xs hidden-sm"; if (!id) id = "EGV"; var arr = value.split(','); for (var i = 0; i < arr.length; i++) {
    //    $("#" + id + " tr").each(function ()
    //    { $(this).find("td:eq(" + arr[i] + ")").addClass(cls); $(this).find("th:eq(" + arr[i] + ")").addClass(cls); });
    //}
}
var Num = 0; var nn = 0;
function help_show(helpid) {
    Num++;
    var newDiv = document.createElement('div');
    var str = "<div id='help_content'  style='z-index:999;'></div><div id='help_hide'  style='z-index:999;'><a onclick='help_hide(Num)' style='width:20px;color:#666' title='关闭'><span class='zi zi_times'></span></a></div> "; newDiv.innerHTML = str; newDiv.setAttribute("Id", "help_div" + Num); nn = Num - 1
    $("#help").append(newDiv); help_hide(nn); jQuery("#help_content").load("/manage/help/" + helpid + ".html", function () { jQuery("#help").show(); });
}
function help_hide(Num) { $("#help_div" + Num).remove(); }
function DealwithUploadPic(path, id) {
    if (parent.document.getElementById(id)) { parent.document.getElementById(id).value = path; }
    else { document.getElementById(id).value = path; }
}
function DealwithUploadImg(path, id) { document.getElementById(id).src = path; }
//用于用户角色等,以后此作为标准
function Def_RoleFunc(list, select) {
    var names = "", ids = "";
    for (var i = 0; i < list.length; i++) {
        ids += list[i].id + ",";
        names += list[i].name + ",";
    }
    if (ids && ids != "") ids = ids.substring(0, ids.length - 1);
    if (names && names != "") names = names.substring(0, names.length - 1);
    $("#" + select + "_T").val(names);
    $("#" + select + "_T").text(names);
    $("#" + select + "_Hid").val(ids);
    if (comdiag != null) { CloseComDiag(); }
}
//---------------下拉选择模板Html
function Tlp_toggleChild(obj, id) {
    var $parent = $(obj).closest('ul');
    if ($(obj).find('span').hasClass('zi zi_folderOpen'))
        $(obj).find('span').removeClass('zi_folderOpen').addClass('zi_folders');
    else
        $(obj).find('span').removeClass('zi_folders').addClass('zi_folderOpen');

    $parent.find("[data-pid='" + id + "']").toggle();
}
function Tlp_initTemp() {
    $(".Template_files").append($("#templist_ul").html());
    $(".Template_btn button").click(function () {//绑定点击事件
        $(this).next().toggle();
    });
    $(".Template_btn button").focusout(function () {//按钮失去焦点则所有下拉隐藏
        $(".Template_files").hide();
    });
    $(".Template_files").mouseover(function () {//当鼠标停留在下拉列表时解除按钮失去焦点事件
        $(this).prev().unbind('focusout');
    });
    $(".Template_files").mouseleave(function () {//当鼠标离开时重绑定按钮失去焦点事件
        $(this).prev().bind('focusout', function () {
            $(".Template_files").hide();
        });
    });
    $(".Template_files").each(function (i, v) {
        var $parent = $(v).closest('.btn-group');
        var $hid = Tlp_GetHidden($parent);
        if ($hid.val() != "")
        {
            $parent.find('button').html($hid.val() + " <span class='pull-right'><span class='caret'></span></span>");
        }
    });
}
function Tlp_SetValByName(name, val) {
    var obj = $("#" + name + "_body").find("ul")[0];
    Tlp_SetVal(obj, val);
}
function Tlp_SetVal(obj, val) {
    var $parent = $(obj).closest('.btn-group');
    $parent.find('button').html(val + " <span class='pull-right'><span class='caret'></span></span>");
    $hid = Tlp_GetHidden($parent);
    $hid.val(val);
    $parent.find('ul').hide();
}
function Tlp_GetHidden($parent) {
    var $hid;
    if ($parent.data("bind")) {
        $hid = $("#" + $parent.data("bind") + "_hid");
    }
    else {
        $hid = $parent.find('input[type="hidden"]');
    }
    return $hid;
}
function Tlp_EditHtml(url, name) {
    var $hid = $("#" + name + "_hid");
    if ($hid.val().indexOf("可视设计_") == 0) {
        var pname = encodeURI($hid.val().split("可视设计_")[1]);
        window.open("/design/spage/PageDesign.aspx?pname=" + pname);
    }
    else { url += escape($hid.val()); location = url; }
}
function Tlp_ShowSel(name) {
    if (comdiag == null) { comdiag = new ZL_Dialog(); }
    var url = siteconf.path + "Template/TemplateList.aspx?OpenerText=" + name + "&FilesDir=";
    comdiag.maxbtn = false;
    ShowComDiag(url, "选择模板");
}
//用于TreeTlpDP.ascx
var TreeTlp = {
    Init: function (id, hid) {
        $("#" + id + " button").click(function () {
            $(this).next().toggle();
        });
        $("#" + id + " .treenode_parent").click(function () {//收缩节点
            var obj = this;
            var cid = $(obj).data("id");
            var $parent = $(obj).closest('ul');
            if ($(obj).find('span').hasClass('zi zi_folderOpen'))
                $(obj).find('span').removeClass('zi_folderOpen').addClass('zi_folders');
            else
                $(obj).find('span').removeClass('zi_folders').addClass('zi_folderOpen');

            $parent.find("a[data-pid='" + cid + "']").toggle();
        });
        $("#" + id + " .treenode").click(function () {//选择事件
            var cid = $(this).data("id");
            $("#" + id + " button .treetext").html($(this).text());
            $("#" + hid).val(cid);
            $(this).closest('ul').hide();
        });
        //初始化数据
        if ($("#" + hid).val() != "" && $("#" + hid).val() != "0") {
            $("#" + id + " button .treetext").html($("#" + id + " ul [data-id='" + $("#" + hid).val() + "']").text());
        }
    }
};
//------------------模板Html End;
//公用弹窗
var comdiag = null;
function ShowComDiag(url, title) {
    comdiag.maxbtn = false;
    comdiag.title = title;
    comdiag.url = url;
    comdiag.backdrop = true;
    comdiag.ShowModal();
}
function CloseComDiag() {
    if (window.comdiag != null) { comdiag.CloseModal(); }

}
//----------------公用方法
function newGuid() {
    var guid = "";
    for (var i = 1; i <= 32; i++) {
        var n = Math.floor(Math.random() * 16.0).toString(16);
        guid += n;
        if ((i == 8) || (i == 12) || (i == 16) || (i == 20))
            guid += "-";
    }
    return guid;
}
function shownoface(obj) {
    obj.error = null;
    obj.src = '/Images/userface/noface.png';
}
function shownopic(obj)
{
    obj.error = null;
    obj.src = '/UploadFiles/nopic.svg';
}
//返回可以作为ID的随机字符串
function GetRanID(len) {
    if (!len) { len = 8; }
    var guid = "";
    for (var i = 1; i <= len; i++) {
        var n = Math.floor(Math.random() * 16.0).toString(16);
        guid += n;
    }
    return guid;
}
function GetRanPass(length, special) {
    var iteration = 0; var password = ""; var randomNumber; if (special == undefined) { var special = false; }
    while (iteration < length) {
        randomNumber = (Math.floor((Math.random() * 100)) % 94) + 33; if (!special) {
            if ((randomNumber >= 33) && (randomNumber <= 47)) { continue; }
            if ((randomNumber >= 58) && (randomNumber <= 64)) { continue; }
            if ((randomNumber >= 91) && (randomNumber <= 96)) { continue; }
            if ((randomNumber >= 123) && (randomNumber <= 126)) { continue; }
        }
        iteration++; password += String.fromCharCode(randomNumber);
    }
    return password;
}
function GetRandomNum(Min, Max) { var Range = Max - Min; var Rand = Math.random(); return (Min + Math.round(Rand * Range)); }
function GetExName(fname) { var s = fname.lastIndexOf(".") + 1; return fname.substring(s, fname.length).replace(/" "/g, "").toLowerCase(); }
function GetFname(fname, num) {
    fname = fname.replace(/\\/g, "/");
    if (fname.indexOf("/") > -1 || fname.indexOf("\\") > -1) {
        var s = fname.lastIndexOf("/") + 1;
        fname = fname.substring(s, fname.length);
    }
    if (num && num > 1 && fname.length > num) { fname = fname.substring(0, (num - 1)) + ".."; }
    return fname;
}
function getParam(paramName) {
    paramValue = ""; isFound = false; if (this.location.search.indexOf("?") == 0 && this.location.search.indexOf("=") > 1) {
        arrSource = decodeURI(this.location.search).substring(1, this.location.search.length).split("&");
        i = 0;
        //定位参数
        while (i < arrSource.length && !isFound) {
            var start = arrSource[i].indexOf("=");
            if (start > 0 && arrSource[i].split("=")[0].toLowerCase() == paramName.toLowerCase())
            {
                //paramValue = arrSource[i].split("=")[1];
                paramValue = arrSource[i].substring(start+1, arrSource[i].length);
                isFound = true;
            }
            i++;
        }
    }
    return paramValue;
}
//获取#后的信息
function getParam2() {
    var index = location.href.indexOf("#");
    var r = "";
    if (index > -1) {
        r = location.href.substring((index + 1), location.href.length);
    }
    return r;
}
function IsImage(fname) {
    var ex = GetExName(fname);
    return (ex == "png" || ex == "jpg" || ex == "gif" || ex == "bmp")
}
function ConverToInt(val, def) {
    if (!def) def = 0;
    if (!val || val == "") { val = def; return val; }
    val = val + "";
    val = val.replace(/ /g, "").replace("px", "").replace("em", "");
    val = parseInt(val);
    if (isNaN(val)) { val = def; }
    return val;
}
var M_APIResult = { Success: 1, Failed: -1 };
//----------------Cookies
var cookieUtils = {
    get: function (name) {
        var cookieName = encodeURIComponent(name) + "=";
        //只取得最匹配的name，value
        var cookieStart = document.cookie.indexOf(cookieName);
        var cookieValue = null;

        if (cookieStart > -1) {
            // 从cookieStart算起
            var cookieEnd = document.cookie.indexOf(';', cookieStart);
            //从=后面开始
            if (cookieEnd > -1) {
                cookieValue = decodeURIComponent(document.cookie.substring(cookieStart + cookieName.length, cookieEnd));
            } else {
                cookieValue = decodeURIComponent(document.cookie.substring(cookieStart + cookieName.length, document.cookie.length));
            }
        }

        return cookieValue;
    },
    set: function (name, val, options) {
        if (!name) {
            throw new Error("cookie must have name");
        }
        var enc = encodeURIComponent;
        var parts = [];
        val = (val !== null && val !== undefined) ? val.toString() : "";
        options = options || {};
        if (!options.path) { options.path = "/"; }
        if (!options.expires)
        {
            var today = new Date()
            var expires = new Date()
            expires.setTime(today.getTime() + 1000 * 60 * 60 * 24 * 365)
            options.expires = expires;
            options.maxAge = 5 * 365 * 24 * 60 * 60;
        }
        console.log(options);
        //----------------------------------------
        parts.push(enc(name) + "=" + enc(val));
        // domain中必须包含两个点号
        if (options.domain) {
            parts.push("domain=" + options.domain);
        }
        if (options.path) {
            parts.push("path=" + options.path);
        }
        // 如果不设置expires和max-age浏览器会在页面关闭时清空cookie
        if (options.expires) {
            parts.push("expires=" + options.expires.toGMTString());
        }
        if (options.maxAge && typeof options.maxAge === "number") {
            parts.push("max-age=" + options.maxAge);
        }
        if (options.httpOnly) {
            parts.push("HTTPOnly");
        }
        if (options.secure) {
            parts.push("secure");
        }

        document.cookie = parts.join(";");
    },
    del: function (name, options) {
        options.expires = new Date(0);// 设置为过去日期
        this.set(name, null, options);
    }
}
function setCookie(name, val) {
    cookieUtils.set(name, val);
}
function getCookie(name) {
    return cookieUtils.get(name);
}
//----------------选择用户
//user.sel('User', 'user', '')
var user = {};
user.hook = [];//手动添加
user.deal_def = function (list, select) {
    var uname = "", uid = "";
    for (var i = 0; i < list.length; i++) {
        uname += list[i].UserName + ",";
        uid += list[i].UserID + ",";
    }
    if (uid) {
        uid = uid.substring(0, uid.length - 1);
        uname = uname.substring(0, uname.length - 1);
    }
    $("#" + select + "_T").val(uname);
    $("#" + select + "_T").text(uname);
    $("#" + select + "_Hid").val(uid);
    if (comdiag != null) { CloseComDiag(); }
}
//目标元素,source:来源,config:筛选配置
user.sel = function (select, source, config) {
    var url = "";
    if (!select) { select = "user"; }
    if (!source) { source = "user"; }
    if (!config) { config = ""; }
    console.log(select,source,config);
    switch (source)//plat,oa,
    {
        case "plat":
            url = "/plat/common/SelGroup.aspx?config=" + config + "#" + select;
            break;
        default:
            url = "/common/dialog/SelGroup.aspx?source=" + source + "&config=" + config + "#" + select;
            break;
    }
    comdiag.maxbtn = false;
    ShowComDiag(url, "选择会员");
}
user.deal = function (list, select) {
    if (user.hook[select]) { user.hook[select](list, select); }
    else
    {
        //如果无匹配,则调用默认方法
        user.deal_def(list, select);
    }
}
//---help
//返回用户的ids字符串
user.getids = function (list) {
    var uid = "";
    for (var i = 0; i < list.length; i++) {
        uid += list[i].UserID + ",";
    }
    if (uid) uid = uid.substring(0, uid.length - 1);
    return uid;
}
user.getnames = function (list) {
    var uid = "";
    for (var i = 0; i < list.length; i++) {
        uid += list[i].UserName + ",";
    }
    if (uid) uid = uid.substring(0, uid.length - 1);
    return uid;
}
user.showuinfo = function (uid) {
    var path = "/admin/";
    if (window.siteconf && siteconf.path) { path = siteconf.path; }
    ShowComDiag(path + "User/Userinfo.aspx?ID=" + uid + "&show=diag", "会员信息");
}
function Def_UserFunc(list, select) {  user.deal_def(list, select); }
//根据IDS显示用户信息(商品等地方使用)
//ZL_Array |MailList.aspx
var UserList = function (opts) {
    var ref = this;
    ref.opts = opts = $.extend({}, ref.defaultOption, opts);
    ref.$wrap = $("#" + opts.name + "_wrap");//需要手动放置一个 ulist_wrap
    //附加上一个hidden,用于存储数据
    if ($("#" + opts.name + "_hid").length < 1) {
        var hidName = opts.name+"_hid";
        ref.$wrap.append('<input type="hidden" id="' + hidName + '" name="' + hidName + '" value="' + opts.ids + '"/>');
    }
    if ($("#" + opts.name + "_div").length < 1) {
        ref.$wrap.append('<div id="' + opts.name + '_div" class="userList"></div>');
    }
    ref.$hid = $("#" + opts.name + "_hid");//用于存储数据的<hidden>
    ref.$div = $("#" + opts.name + "_div");//用于放置显示用的列表的<div>
    //------------------------------
    //选择用户后的回调方法
    user.hook[opts.name] = function (list, select) {
        var ids = list.GetIDS("UserID");
        ids = idshelp.merge(ref.$hid.val(), ids);
        ref.$hid.val(ids);
        ref.render();
        if (window.CloseComDiag) { CloseComDiag(); }
        //关闭窗口或其他操作
        if (opts.sel_after) { opts.sel_after(); }
    }
    ref.render();
}
UserList.prototype.defaultOption = { ids: "", name: "ulist", sel_after: function () { } };
UserList.prototype.del = function (btn, uid) {
    var ref = this;
    $(btn).closest("tr").remove();
    var ids = idshelp.del(ref.$hid.val(), uid);
    ref.$hid.val(ids);
    ref.render();
}
UserList.prototype.render = function () {
    var ref = this;
    ref.$div.load("/common/comp/UserList.aspx?del=" + ref.opts.name + ".del",
        { "ids": ref.$hid.val() });
}
//var upro = {
//    del: function (btn, uid) {
//        $(btn).closest("tr").remove();
//        var ids = idshelp.del($("#uprouids_hid").val(), uid);
//        $("#uprouids_hid").val(ids);
//        upro.render();
//    },
//    init: function () {
//        user.hook["uprobind"] = function (list, select) {
//            var ids = list.GetIDS("UserID");
//            ids = idshelp.merge($("#uprouids_hid").val(), ids);
//            $("#uprouids_hid").val(ids);
//            upro.render();
//            CloseDiag();
//        }
//        upro.render();
//    },
//    render: function () {
//        $("#upro_wrap").load("/common/comp/UserList.aspx?del=upro.del", { "ids": $("#uprouids_hid").val() });
//    }
//};
//----------------隐式搜索
var selbox = {};
selbox.toggle = function (cfg) {
    if (!cfg) { cfg = {}; }
    if ($("#sel_box").css("display") == "none") {
        $(this).addClass("active");
        $("#sel_box").slideDown(300);
        if (cfg.show) { cfg.show(); }
    }
    else {
        $(this).removeClass("active");
        $("#sel_box").slideUp(200);
        if (cfg.hide) { cfg.hide(); }
    }
}
//按下回车时搜索
selbox.search = function () {
    if (event.keyCode == 13) { $("#Search_Btn").click(); }
}
//----------------
var zlhelp = {};
zlhelp.upload = {};
zlhelp.deepCopy = function (source) {
    var result = {};
    for (var key in source) {
        result[key] = typeof source[key] === 'object' ? zlhelp.deepCopy(source[key]) : source[key];
    }
    return result;
}
//下载页面上图片至本地
zlhelp.downimg = function (imgURL, fname) {
    var MIME_TYPE = "image/png";
    var dlLink = document.createElement('a');
    dlLink.download = fname;
    dlLink.href = imgURL;
    dlLink.dataset.downloadurl = [MIME_TYPE, dlLink.download, dlLink.href].join(':');
    document.body.appendChild(dlLink);
    dlLink.click();
    document.body.removeChild(dlLink);
}
//文件分片,用于大文件上传,返回分片后的信息(整合时根据长度整合)
zlhelp.upload.chunkFile = function (file, opts) {
    if (!opts) { opts = {}; }
    if (!opts.size) { opts.size = 5; }//默认5M一分片
    //分片,文件大小,文件名称
    var result = { chunks: [], size: file.size, name: file.name };
    //---------------------------------------
    var chunkSize = opts.size * 1024 * 1024;
    var count = Math.ceil(file.size / chunkSize);//分片数
    for (var i = 0; i < count; i++) {
        var model = { chunk: null, start: 0, end: 0 }
        var start = i * chunkSize, end = Math.min(file.size, start + chunkSize);
        model.chunk = file.slice(start, end);
        model.start = start;
        model.end = end;
        result.chunks.push(model);
    }
    return result;
}
//---------------多文件字段相关
//添加图片地址外部链接
function AddPhotoUrl(id, hid) {
    var obj = document.getElementById(id);
    var thisurl = "文件地址" + (obj.length + 1) + "|http://";
    var url = prompt("请输入图片地址名称和链接，中间用“|”隔开：", thisurl);
    if (url != null && url != '') {
        obj.options[obj.length] = new Option(url, url);
    }
    ChangeHiddenFieldValue(id, hid);
}
//添加下载地址外部链接
function AddSoftUrl(id, hid) {
    var obj = document.getElementById(id);
    var thisurl = "下载地址" + (obj.length + 1) + "|http://";
    var url = prompt("请输入下载地址名称和链接，中间用“|”隔开：", thisurl);
    if (url != null && url != '') {
        obj.options[obj.length] = new Option(url, url);
    }
    ChangeHiddenFieldValue(id, hid);
}
//从已上传文件中选择图片
function SelectFiles(selID, hdnID) {
    var urlstr = zlconfig.adminPath + "Common/ShowUploadFiles.aspx";
    var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
    var arr = "";
    if (isMSIE) {
        arr = window.showModalDialog(urlstr, "self,width=570,height=460,resizable=yes,scrollbars=yes");
        if (arr != null) {
            var obj = document.getElementById(selID);
            var url = '图片地址' + (obj.length + 1) + '|' + arr;
            obj.options[obj.length] = new Option(url, url);
            ChangeHiddenFieldValue(selID, hdnID);
        }
    }
    else {
        urlstr = urlstr + "?ClientId=" + selID + "&HiddenFieldId=" + hdnID + "&type=pic";
        window.open(urlstr, 'newWin', 'modal=yes,width=570,height=460,resizable=yes,scrollbars=yes');
    }
}
//修改地址
function ModifyPhotoUrl(id, hid) {
    var obj = document.getElementById(id);
    if (obj == null) return false;
    if (obj.length == 0) return false;
    var thisurl = obj.value;
    if (thisurl == '') {
        alert('请先选择一个地址，再点修改按钮！');
        return false;
    }
    var url = prompt('请输入地址名称和链接，中间用“|”隔开：', thisurl);
    if (url != thisurl && url != null && url != '') {
        obj.options[obj.selectedIndex] = new Option(url, url);
    }
    ChangeHiddenFieldValue(id, hid);
}
//删除地址
function DelPhotoUrl(id, hid) {
    var obj = document.getElementById(id);
    if (obj.length == 0) return false;
    var thisurl = obj.value;
    if (thisurl == '') {
        alert('请先选择一个地址，再点删除按钮！');
        return false;
    }
    obj.options[obj.selectedIndex] = null;
    ChangeHiddenFieldValue(id, hid);
}
//修改隐藏文本内容
function ChangeHiddenFieldValue(selID, HdnID) {
    var obj = document.getElementById(HdnID);
    var photoUrls = document.getElementById(selID);
    var value = "";
    for (i = 0; i < photoUrls.length; i++) {
        if (value != "") {
            value = value + "$";
        }
        value = value + photoUrls.options[i].value;
    }
    obj.value = value;
}
/*!
 * clipboard.js v2.0.0
 * https://zenorocha.github.io/clipboard.js
 * 
 * Licensed MIT © Zeno Rocha
 */
!function (t, e) { "object" == typeof exports && "object" == typeof module ? module.exports = e() : "function" == typeof define && define.amd ? define([], e) : "object" == typeof exports ? exports.ClipboardJS = e() : t.ClipboardJS = e() }(this, function () { return function (t) { function e(o) { if (n[o]) return n[o].exports; var r = n[o] = { i: o, l: !1, exports: {} }; return t[o].call(r.exports, r, r.exports, e), r.l = !0, r.exports } var n = {}; return e.m = t, e.c = n, e.i = function (t) { return t }, e.d = function (t, n, o) { e.o(t, n) || Object.defineProperty(t, n, { configurable: !1, enumerable: !0, get: o }) }, e.n = function (t) { var n = t && t.__esModule ? function () { return t.default } : function () { return t }; return e.d(n, "a", n), n }, e.o = function (t, e) { return Object.prototype.hasOwnProperty.call(t, e) }, e.p = "", e(e.s = 3) }([function (t, e, n) { var o, r, i; !function (a, c) { r = [t, n(7)], o = c, void 0 !== (i = "function" == typeof o ? o.apply(e, r) : o) && (t.exports = i) }(0, function (t, e) { "use strict"; function n(t, e) { if (!(t instanceof e)) throw new TypeError("Cannot call a class as a function") } var o = function (t) { return t && t.__esModule ? t : { default: t } }(e), r = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (t) { return typeof t } : function (t) { return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t }, i = function () { function t(t, e) { for (var n = 0; n < e.length; n++) { var o = e[n]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(t, o.key, o) } } return function (e, n, o) { return n && t(e.prototype, n), o && t(e, o), e } }(), a = function () { function t(e) { n(this, t), this.resolveOptions(e), this.initSelection() } return i(t, [{ key: "resolveOptions", value: function () { var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}; this.action = t.action, this.container = t.container, this.emitter = t.emitter, this.target = t.target, this.text = t.text, this.trigger = t.trigger, this.selectedText = "" } }, { key: "initSelection", value: function () { this.text ? this.selectFake() : this.target && this.selectTarget() } }, { key: "selectFake", value: function () { var t = this, e = "rtl" == document.documentElement.getAttribute("dir"); this.removeFake(), this.fakeHandlerCallback = function () { return t.removeFake() }, this.fakeHandler = this.container.addEventListener("click", this.fakeHandlerCallback) || !0, this.fakeElem = document.createElement("textarea"), this.fakeElem.style.fontSize = "12pt", this.fakeElem.style.border = "0", this.fakeElem.style.padding = "0", this.fakeElem.style.margin = "0", this.fakeElem.style.position = "absolute", this.fakeElem.style[e ? "right" : "left"] = "-9999px"; var n = window.pageYOffset || document.documentElement.scrollTop; this.fakeElem.style.top = n + "px", this.fakeElem.setAttribute("readonly", ""), this.fakeElem.value = this.text, this.container.appendChild(this.fakeElem), this.selectedText = (0, o.default)(this.fakeElem), this.copyText() } }, { key: "removeFake", value: function () { this.fakeHandler && (this.container.removeEventListener("click", this.fakeHandlerCallback), this.fakeHandler = null, this.fakeHandlerCallback = null), this.fakeElem && (this.container.removeChild(this.fakeElem), this.fakeElem = null) } }, { key: "selectTarget", value: function () { this.selectedText = (0, o.default)(this.target), this.copyText() } }, { key: "copyText", value: function () { var t = void 0; try { t = document.execCommand(this.action) } catch (e) { t = !1 } this.handleResult(t) } }, { key: "handleResult", value: function (t) { this.emitter.emit(t ? "success" : "error", { action: this.action, text: this.selectedText, trigger: this.trigger, clearSelection: this.clearSelection.bind(this) }) } }, { key: "clearSelection", value: function () { this.trigger && this.trigger.focus(), window.getSelection().removeAllRanges() } }, { key: "destroy", value: function () { this.removeFake() } }, { key: "action", set: function () { var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : "copy"; if (this._action = t, "copy" !== this._action && "cut" !== this._action) throw new Error('Invalid "action" value, use either "copy" or "cut"') }, get: function () { return this._action } }, { key: "target", set: function (t) { if (void 0 !== t) { if (!t || "object" !== (void 0 === t ? "undefined" : r(t)) || 1 !== t.nodeType) throw new Error('Invalid "target" value, use a valid Element'); if ("copy" === this.action && t.hasAttribute("disabled")) throw new Error('Invalid "target" attribute. Please use "readonly" instead of "disabled" attribute'); if ("cut" === this.action && (t.hasAttribute("readonly") || t.hasAttribute("disabled"))) throw new Error('Invalid "target" attribute. You can\'t cut text from elements with "readonly" or "disabled" attributes'); this._target = t } }, get: function () { return this._target } }]), t }(); t.exports = a }) }, function (t, e, n) { function o(t, e, n) { if (!t && !e && !n) throw new Error("Missing required arguments"); if (!c.string(e)) throw new TypeError("Second argument must be a String"); if (!c.fn(n)) throw new TypeError("Third argument must be a Function"); if (c.node(t)) return r(t, e, n); if (c.nodeList(t)) return i(t, e, n); if (c.string(t)) return a(t, e, n); throw new TypeError("First argument must be a String, HTMLElement, HTMLCollection, or NodeList") } function r(t, e, n) { return t.addEventListener(e, n), { destroy: function () { t.removeEventListener(e, n) } } } function i(t, e, n) { return Array.prototype.forEach.call(t, function (t) { t.addEventListener(e, n) }), { destroy: function () { Array.prototype.forEach.call(t, function (t) { t.removeEventListener(e, n) }) } } } function a(t, e, n) { return u(document.body, t, e, n) } var c = n(6), u = n(5); t.exports = o }, function (t, e) { function n() { } n.prototype = { on: function (t, e, n) { var o = this.e || (this.e = {}); return (o[t] || (o[t] = [])).push({ fn: e, ctx: n }), this }, once: function (t, e, n) { function o() { r.off(t, o), e.apply(n, arguments) } var r = this; return o._ = e, this.on(t, o, n) }, emit: function (t) { var e = [].slice.call(arguments, 1), n = ((this.e || (this.e = {}))[t] || []).slice(), o = 0, r = n.length; for (o; o < r; o++) n[o].fn.apply(n[o].ctx, e); return this }, off: function (t, e) { var n = this.e || (this.e = {}), o = n[t], r = []; if (o && e) for (var i = 0, a = o.length; i < a; i++) o[i].fn !== e && o[i].fn._ !== e && r.push(o[i]); return r.length ? n[t] = r : delete n[t], this } }, t.exports = n }, function (t, e, n) { var o, r, i; !function (a, c) { r = [t, n(0), n(2), n(1)], o = c, void 0 !== (i = "function" == typeof o ? o.apply(e, r) : o) && (t.exports = i) }(0, function (t, e, n, o) { "use strict"; function r(t) { return t && t.__esModule ? t : { default: t } } function i(t, e) { if (!(t instanceof e)) throw new TypeError("Cannot call a class as a function") } function a(t, e) { if (!t) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return !e || "object" != typeof e && "function" != typeof e ? t : e } function c(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function, not " + typeof e); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, enumerable: !1, writable: !0, configurable: !0 } }), e && (Object.setPrototypeOf ? Object.setPrototypeOf(t, e) : t.__proto__ = e) } function u(t, e) { var n = "data-clipboard-" + t; if (e.hasAttribute(n)) return e.getAttribute(n) } var l = r(e), s = r(n), f = r(o), d = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (t) { return typeof t } : function (t) { return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t }, h = function () { function t(t, e) { for (var n = 0; n < e.length; n++) { var o = e[n]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(t, o.key, o) } } return function (e, n, o) { return n && t(e.prototype, n), o && t(e, o), e } }(), p = function (t) { function e(t, n) { i(this, e); var o = a(this, (e.__proto__ || Object.getPrototypeOf(e)).call(this)); return o.resolveOptions(n), o.listenClick(t), o } return c(e, t), h(e, [{ key: "resolveOptions", value: function () { var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : {}; this.action = "function" == typeof t.action ? t.action : this.defaultAction, this.target = "function" == typeof t.target ? t.target : this.defaultTarget, this.text = "function" == typeof t.text ? t.text : this.defaultText, this.container = "object" === d(t.container) ? t.container : document.body } }, { key: "listenClick", value: function (t) { var e = this; this.listener = (0, f.default)(t, "click", function (t) { return e.onClick(t) }) } }, { key: "onClick", value: function (t) { var e = t.delegateTarget || t.currentTarget; this.clipboardAction && (this.clipboardAction = null), this.clipboardAction = new l.default({ action: this.action(e), target: this.target(e), text: this.text(e), container: this.container, trigger: e, emitter: this }) } }, { key: "defaultAction", value: function (t) { return u("action", t) } }, { key: "defaultTarget", value: function (t) { var e = u("target", t); if (e) return document.querySelector(e) } }, { key: "defaultText", value: function (t) { return u("text", t) } }, { key: "destroy", value: function () { this.listener.destroy(), this.clipboardAction && (this.clipboardAction.destroy(), this.clipboardAction = null) } }], [{ key: "isSupported", value: function () { var t = arguments.length > 0 && void 0 !== arguments[0] ? arguments[0] : ["copy", "cut"], e = "string" == typeof t ? [t] : t, n = !!document.queryCommandSupported; return e.forEach(function (t) { n = n && !!document.queryCommandSupported(t) }), n } }]), e }(s.default); t.exports = p }) }, function (t, e) { function n(t, e) { for (; t && t.nodeType !== o;) { if ("function" == typeof t.matches && t.matches(e)) return t; t = t.parentNode } } var o = 9; if ("undefined" != typeof Element && !Element.prototype.matches) { var r = Element.prototype; r.matches = r.matchesSelector || r.mozMatchesSelector || r.msMatchesSelector || r.oMatchesSelector || r.webkitMatchesSelector } t.exports = n }, function (t, e, n) { function o(t, e, n, o, r) { var a = i.apply(this, arguments); return t.addEventListener(n, a, r), { destroy: function () { t.removeEventListener(n, a, r) } } } function r(t, e, n, r, i) { return "function" == typeof t.addEventListener ? o.apply(null, arguments) : "function" == typeof n ? o.bind(null, document).apply(null, arguments) : ("string" == typeof t && (t = document.querySelectorAll(t)), Array.prototype.map.call(t, function (t) { return o(t, e, n, r, i) })) } function i(t, e, n, o) { return function (n) { n.delegateTarget = a(n.target, e), n.delegateTarget && o.call(t, n) } } var a = n(4); t.exports = r }, function (t, e) { e.node = function (t) { return void 0 !== t && t instanceof HTMLElement && 1 === t.nodeType }, e.nodeList = function (t) { var n = Object.prototype.toString.call(t); return void 0 !== t && ("[object NodeList]" === n || "[object HTMLCollection]" === n) && "length" in t && (0 === t.length || e.node(t[0])) }, e.string = function (t) { return "string" == typeof t || t instanceof String }, e.fn = function (t) { return "[object Function]" === Object.prototype.toString.call(t) } }, function (t, e) { function n(t) { var e; if ("SELECT" === t.nodeName) t.focus(), e = t.value; else if ("INPUT" === t.nodeName || "TEXTAREA" === t.nodeName) { var n = t.hasAttribute("readonly"); n || t.setAttribute("readonly", ""), t.select(), t.setSelectionRange(0, t.value.length), n || t.removeAttribute("readonly"), e = t.value } else { t.hasAttribute("contenteditable") && t.focus(); var o = window.getSelection(), r = document.createRange(); r.selectNodeContents(t), o.removeAllRanges(), o.addRange(r), e = o.toString() } return e } t.exports = n }]) });
//var clipboard = new ClipboardJS('#copy_btn', {
//    text: function () { return $("#Test1").val(); }
//});
//===========================================