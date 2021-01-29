//标题重名检测
function DupTitleFunc(title) {
    if (zlconfig.duptitlenum < 1 || title.length < zlconfig.duptitlenum) { $("#duptitle_div").hide(); return; }
    var litlp = "<li><a href='EditContent?GeneralID=@id' target='_blank'>@title</a></li>";
    $.post("Content_API", { action: "duptitle", value: title }, function (data) {
        data = JSON.parse(data);
        if (data.length > 0) {
            $("#duptitle_ul").html("");
            $("#duptitle_ul").append("<li>检测到有相似标题</li>");
            $("#duptitle_div").show();
        } else { $("#duptitle_div").hide(); }
        for (var i = 0; i < data.length; i++) {
            var li = litlp.replace("@id", data[i].GeneralID).replace("@title", data[i].Title);
            $("#duptitle_ul").append(li);
        }
    });
}
function editnode(NodeID) {
    var answer = confirm("该栏目未绑定模板，是否立即绑定");
    if (answer == false) {
        return false;
    }
    else {
        open_page(NodeID, "NodeAdd?ID=");
    }
}
function GetPicurl(imgurl) {
    var optlen = document.getElementById("selectpic").options.length;
    var isin = 0;
    for (var i = 0; i < optlen; i++) {
        var doctxt = document.getElementById("selectpic").options.item(i);
        if (doctxt.value.toLowerCase() == imgurl.toLowerCase() || imgurl.toLowerCase().indexOf("http://") > -1) {
            isin = 1;
        }
    }
    if (isin == 0) {
        var option = document.createElement("option");
        option.text = imgurl;
        option.value = imgurl;
        document.getElementById("selectpic").add(option);
    }
}
function SelectKey(id) {
    window.open('/Common/KeyList?OpenerText=' + id, '', 'width=600,height=450,resizable=0,scrollbars=yes');
}
function ShowSys() {
    $("#Sys_Fied").toggle();
}
function SetContent() {
    setTimeout(function () { UE.getEditor("txt_content").setContent($(parent.document).find("#Content_Div").html()); }, 2000);
}
function ShowPic(content) {
    if (content != "") {
        document.getElementById("picview").innerHTML = "<img width=100px height=100px src=" + content + " />";
    } else {
        document.getElementById("picview").innerHTML = "";
    }
}
//ueditor与markdown取图
function GetTopImg(id) {
    //if ($("#" + id).length < 1) { console.log("GetTopImg", id + "不存在"); return; }
    var field = id.replace("txt_", "");
    var $tr = $("#fd_tr_" + field);
    var classStr = $tr.attr("class");
    if (!classStr) { classStr = ""; }
    if (classStr.indexOf("MarkDown") > -1) {
        //mdforfield中处理
    }
    else if (classStr.indexOf("MultipleHtmlType") > -1) {
        var editor = UE.getEditor(id);
        editor.addListener("afterPaste contentChange", function () {
            setTimeout(function () { loadImg(editor.getContent()); }, 500);
            setTimeout(BindAttachEvent, 500);
        });
        setTimeout(function () { loadImg(editor.getContent()); })
    }
    else {
        //do nothing
    }

}
//用于修改页,显示已选中的TopImg
function SeledPic() {
    if ($("#SeledPic_Hid").length > 0) {
        var val = $("#SeledPic_Hid").val();
        if (val != "") {
            $("#selectpic").val(val);
        }
    }
}
//主编辑器扩展图(Ueditor)
function loadImg(html) {
    var $imgs = $(html).find("img");
    var $imgul = $("#ThumImg_ul");
    if ($imgs.length > 0) {
        $imgul.html("");
        var defimg = "<li><img src='/UploadFiles/nopic.gif' />"
            + "<div class='file-panel' style='height: 0px;'><span class='choose' title='选中'></span></div><span class='success'></span>";
        $imgul.append(defimg);
        var tlp = "<li><img src='@src' class='preview_img' />"
            + "<div class='file-panel' style='height: 0px;'><span class='choose' data-src='@src' title='选中'></span><span class='editpic' title='编辑'></span></div><span></span>";
        for (var i = 0; i < $imgs.length; i++) {
            var src = $($imgs[i]).attr('src');
            if (!src || src.indexOf("/Ueditor/dialogs/emotion/") > -1) { continue; }
            $imgul.append(tlp.replace(/@src/ig, src));
        }
    }
    BindAttachEvent();
    //$imgul.find(".choose").click(function () {  //这是错误的方法 $imgul.find(".choose").click(function ()  这种方式的前提是页面中已经存在这个元素，会绑定上事件 20201113 
    $(document).on('click', '#ThumImg_ul .choose', function () {
        var $btn = $(this);
        var $li = $btn.closest("li");
        $("#ThumImg_Hid").val($btn.data("src"));
        $imgul.find("li").removeClass("choose").children("span").removeClass("success");
        $li.addClass("choose").children("span").addClass("success");
        //是否有压图传入字段,有的话则同步修改其值
        if ($(".autothumb_t").length > 0) {
            var img = $btn.data("src");
            var thumb = img.substr(0, img.lastIndexOf(".")) + ".thumb." + GetExName(img);
            $(".autothumb_t").val(thumb);
        }
    });
    var nowSrc = $("#ThumImg_Hid").val();
    if (nowSrc && nowSrc != "") {
        $imgul.find(".choose[data-src='" + nowSrc + "']").click();
    }
}
function LoadImgEdit(content) { }
function pageScroll() {
    window.scrollBy(0, -30);
    scrolldelay = setTimeout('pageScroll()', 5);
    if (document.documentElement.scrollTop == 0) clearTimeout(scrolldelay);
}
function DealImgUrl(url) {//处理图片路径
    url = url.toLocaleLowerCase();
    if (url.indexOf("http:") > -1 || url.indexOf("https:") > -1 || url.indexOf(zlconfig.updir) > -1) {

    }
    else {
        url = zlconfig.updir + url;
    }
    return url;
}
//从tags中取title的关键词
function GetKeys(tags, title, num) {
    if (!title || title == "" || tags.length < 1) { return ""; }
    var result = "";
    //优先检索后台关键词
    if (zlconfig && zlconfig.keys && zlconfig.keys.length > 0) {
        var keys = zlconfig.keys;
        for (var i = 0; i < keys.length && num > 0; i++) {
            if (title.indexOf(keys[i].n) > -1) {
                title = title.replace(keys[i].n, "");
                result += keys[i].n + ","; num--;
            }
        }
    }
    //检索默认关键词库
    for (var i = 0; i < tags.length && num > 0; i++) {
        if (title.indexOf(tags[i].n) > -1) {
            title = title.replace(tags[i].n, "");//避免查询近义词
            result += tags[i].n + ","; num--;
        }
    }
    if ($("#IgnoreKey_Hid").length > 0) {
        $("#IgnoreKey_Hid").val(result);//后台忽略添加的关键词
    }
    return result != "" ? result.substring(0, result.length - 1) : "";
}
//稍后整合
function SetCitys(name, value) {
    $("#txt_" + name).val(value);
}
function UpdateMultiDrop(values, id) {
    document.getElementsByName(id)[0].value = values;
}
////计算标题字数
function isgoEmpty(id, FS_Alert) {
    var Obj = document.getElementById(id);
    if (!Obj) { console.log("isgoEmpty err"); return; }
    var value = Obj.value.replace(/(^\s*)|(\s*$)/g, "");
    if (value == "") {
        document.getElementById(FS_Alert).innerHTML = "<span style=\"color:Red\">不能为空</span>";
        return false;
    } else {
        var Str_Len = "";
        var Len_Color = "";
        Str_Len = value.length;
        if (Str_Len <= 50) {
            Len_Color = "006600";
        }
        else if (Str_Len > 50 && Str_Len <= 100) {
            Len_Color = "3300FF";
        }
        else if (Str_Len > 100) {
            Len_Color = "FF0000";
        }
        document.getElementById(FS_Alert).innerHTML = "<span>字数：<font style=\"color:#" + Len_Color + ";font-weight:bold;\">" + Str_Len + "</font></span>";
        return true;
    }
}
//----Dialog
var diag = new ZL_Dialog(), viewDiag = new ZL_Dialog();
function ShowTitle() {
    ShowDiag("/lib/html/SelectStyle.htm", "设置标题字体");
}

function UpFileDiag(json) {
    var url = arguments[1] == null ? "/IO/WebUp" : arguments[1];
    var accept = "";
    switch (json.field) {
        case "images":
            accept = "img";
            break;
        default:
            accept = "file";
            break;
    }
    url = url + "?json={\"ashx\":\"action=ModelFile%26value=" + json.nodeid + "%26IsWater=" + json.iswater + "\",\"accept\":\"" + accept + "\",\"pval\":" + JSON.stringify(json) + ",\"fileNum\":" + json.fileNum + "}";
    ShowDiag(url, "上传文件");
}
function ShowCutImg(param) {
    ShowDiag("/Common/PicEdit?" + param, "图片编辑");
}
function SelectUppic(pval) {
    ShowDiag("/Common/SelFiles?pval=" + JSON.stringify(pval), "选择在线图片");
}
function open_page(NodeID, strURL) {
    diag.title = "配置节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
    diag.url = strURL + NodeID;
    diag.ShowModal();
}
function ShowDiag(url, title) {
    diag.url = url;
    diag.title = title;
    diag.maxbtn = false;
    diag.reload = true;
    diag.backdrop = true;
    diag.ShowModal();
}
//预览图片,适用于单图预览
function PreViewImg(url) {
    if (url == "") { alert("请先上传图片,才可预览"); return false; }
    //url = DealImgUrl(url); console.log(url);
    if (!$("#view_div")[0]) {
        $("body").append($("<div id='view_div' style='display:none;'><img style='width:100%' onerror='this.src=\"/UploadFiles/nopic.svg\";' id='view_img' /></div>"));
    }
    $("#view_img").attr("src", url);
    viewDiag.title = "预览图片";
    viewDiag.content = "view_div";
    viewDiag.ShowModal();
}
function ShowSelUser(source) {
    ShowDiag("/Office/Mail/SelGroup?Type=AllInfo#" + source, "选择用户");
}
function ShowSelVideo(id) {
    // /Common/SelFiles?action=dbvideo&pval={"name":"Merge_T"}
    var pval = JSON.stringify({ name: id });
    ShowDiag("/Common/SelFiles?action=dbvideo&pval=" + pval, "选择视频");
}
function ShowSelIcon(name) {
    var pval = JSON.stringify({ name: name });
    ShowDiag("/Common/icon2.html?pval=" + pval, "选择图标");
}
function ShowAddDown(name) {
    var pval = JSON.stringify({ name: name });
    ShowDiag("/Common/Dialog/AddDown?pval=" + pval + "&ran=" + Math.random(), "自定义下载");
}
//文章推送
function PushCon() {
    ShowDiag("/Common/NodeList?Source=content", "请选择需推送的节点<input type='button' value='确定' onclick='GetDiagCon().SureFunc();' class='btn btn-primary'>");
}
function CloseDiag() {
    diag.CloseModal();
    viewDiag.CloseModal();
}
//获取iframe中的正文,方便更新其中控制或方法
function GetDiagCon() {
    return diag.iframe.contentWindow;
}
//----获取图片链接,用于图片编辑
function GetCutpic(name, d) {
    var srcurl = document.getElementById("txt_" + name).value;
    if (srcurl != null && srcurl != "" && srcurl != "/UploadFiles/nopic.svg") {
        ShowCutImg("ipath=" + srcurl);
    }
    else {
        alert("请先上传图片或选择已上传图片");
    }
}
function PopImage(divID, path, width, heigh) {
    return PreViewImg("/UploadFiles/" + document.getElementById(path).value);
}
//webup后下载字段
function AddAttach_down(file, ret, pval) {
    var $text = $("#" + pval.inputid), fileArr = ret._raw.split('|');
    var downArr = [];
    if ($text.val() != "") {
        downArr = JSON.parse($text.val());
    }
    for (var i = 0; i < fileArr.length; i++) {
        var downMod = { url: "", fname: "", ranstr: "", count: 0, ptype: "sicon", price: 0, hour: 0 };
        downMod.url = fileArr[i];
        downMod.fname = GetFname(fileArr[i]);
        downMod.ranstr = GetRanPass(10);
        downArr.push(downMod);
    }
    $text.val(JSON.stringify(downArr));
    CloseDiag();
}
//----组图等通过webup上传的字段
function AddAttach(file, ret, pval) {
    if (ret._raw == "") return;
    if (pval.field == "down") { AddAttach_down(file, ret, pval); return; }
    if (pval.field == "SwfFileUpload") { AddAttach_Upload(file, ret, pval); return; }
    //仅用于组图
    var tlp = "<li class='margin_l5'><img src='@src' class='preview_img'/><div class='file-panel' style='height: 0px;'><span class='editpic' title='编辑'></span><span class='cancel' title='删除'></span></div></li>";
    var $text = $("#txt_" + pval.inputid), imgarr = ret._raw.split('|');
    var list = JSON.parse($text.val() == "" ? "[]" : $text.val());
    $imgul = $("#ul_" + pval.inputid);
    if (pval.isGroup) {//标识是否是图片排序返回的数据(需初始化数据)
        $imgul.html(""); $text.val(""); list.length = 0;
    }
    for (var i = 0; i < imgarr.length; i++) {
        if (imgarr[i] == "") continue;
        if ($imgul.length > 0) {
            $imgul.append(tlp.replace("@src", imgarr[i]));
        }
        imgarr[i] = imgarr[i].replace(pval.uploaddir, "");
        if (file != null) {
            //20200814返回文件名JSON
            var json = { url: imgarr[i], name: file.name, desc: (pval.descs ? pval.descs[i] : ""), link: "" };
            //20200814给标题赋值
            $("#Title").val(file.name);
        } else {
            var json = { url: imgarr[i], desc: (pval.descs ? pval.descs[i] : ""), link: "" };
        }
        list.push(json);
    }
    $text.val(JSON.stringify(list));
    BindAttachEvent();
}
//用于智能上传
function AddAttach_Upload(file, ret, pval) {
    if (ret._raw == "") return;
    var obj = $("#" + pval.objid)[0];
    var urlname = "文件地址" + (obj.length + 1);
    var imgarr = ret._raw.split('|');
    for (var i = 0; i < imgarr.length; i++) {
        obj.options[obj.length] = new Option(urlname + "|" + imgarr[i].replace(pval.uploaddir, ""), urlname + "|" + imgarr[i].replace(pval.uploaddir, ""));
    }
    ChangeHiddenFieldValue(pval.objid, pval.inputid);
    CloseDiag();
}
function SortImg(pval) {
    if ($("#txt_" + pval.inputid).val().trim() != "") {
        var txtval = $("#txt_" + pval.inputid).val();
        ShowDiag("/Common/SortImages?json={\"imgs\":" + txtval + ",\"pval\":" + JSON.stringify(pval) + "}", "请拖动图片进行排序");
    } else {
        alert("请选择或上传图片!");
    };
}
function BindAttachEvent() {
    //先清除有事件再绑定,以避免重绑
    $(".preview_img_ul li .cancel").unbind("click");
    $(".preview_img_ul li .editpic").unbind("click");
    $(".preview_img_ul li .choose").unbind("click");

    $(".preview_img").unbind("click");
    //---------------
    $(".preview_img_ul li").mouseenter(function () {
        $btns = $(this).find(".file-panel");
        $btns.stop().animate({ height: 30 });
    }).mouseleave(function () {
        $btns = $(this).find(".file-panel");
        $btns.stop().animate({ height: 0 });
    });
    $(".preview_img_ul li .cancel").click(function () {
        var $li = $(this).closest("li");
        var $text = $("#" + $li.closest("ul").data("id"));
        var name = $li.find("img").attr("src");
        $li.remove();
        var list = JSON.parse($text.val() == "" ? "[]" : $text.val());
        $text.val(RemoveAttach(name, list));
    });

    //获取窗口的高度
    var windowHeight;
    //获取窗口的宽度
    var windowWidth;
    //获取弹窗的宽度
    var popWidth;
    //获取弹窗高度
    var popHeight;
    var isshow = false;
    function init() {
        windowHeight = $(window).height();
        windowWidth = $(window).width();
        popHeight = $(".window").height();
        popWidth = $(".window").width();
    }
    //关闭窗口的方法
    function closeWindow() {
        $(".close_btn").click(function () {
            $('.window').hide("slow");
            $('.mask').css('display', 'none');
        });
    }
    //定义弹出居中窗口的方法
    function popCenterWindow() {
        init();
        //计算弹出窗口的左上角X的偏移量
        var popX = (windowWidth - popWidth) / 2;
        // 计算弹出窗口的左上角Y的偏移量为窗口的高度 - 弹窗高度 / 2 + 被卷去的页面的top
        var popY = (windowHeight - popHeight) / 3 + $(document).scrollTop();
        //设定窗口的位置
        $("#center").css("top", popY).css("left", popX).slideToggle("fast");
        closeWindow();
    }
    $(".preview_img_ul li [title=copy]").click(function () {

        var $li = $(this).closest("li");
        var src = $li.find("img").attr("src");
        var name = $li.find("img").attr("alt") ? $li.find("img").attr("alt") : '';
        var url = '![' + name + '](' + (src.slice(0, 4) == 'http' ? src : $("#siteurl").val() + src) + ')';
        var flag = copyText(url); //传递文本
        if (flag) {
            if (isshow == false) {
                $('.add_title').text("复制成功！");
                $('.mask').css('display', 'block');
                $('.mask').css('width', $(window).width())
                $('.mask').css('height', $(document).height())
                popCenterWindow();
                isshow = true;
                setTimeout(function () {
                    $('.window').hide();
                    isshow = false;
                }, 2000);
            }
        } else {
            $('.add_title').text("复制失败！");
            $('.mask').css('display', 'block');
            $('.mask').css('width', $(window).width())
            $('.mask').css('height', $(document).height())
            popCenterWindow();
            setTimeout(function () {
                $('.window').hide();
            }, 2000);
        }
    });

    $(".preview_img_ul li .editpic").click(function () {
        $li = $(this).closest("li");
        var url = $li.find("img").attr("src");
        ShowCutImg("ipath=" + url);
    });
    $(".preview_img").click(function () {//允许点击预览大图
        PreViewImg(this.src);
    });
}

function copyText(text) {
    var textarea = document.createElement("input");//创建input对象
    var currentFocus = document.activeElement;//当前获得焦点的元素
    document.body.appendChild(textarea);//添加元素
    textarea.value = text;
    textarea.focus();
    if (textarea.setSelectionRange)
        textarea.setSelectionRange(0, textarea.value.length);//获取光标起始位置到结束位置
    else
        textarea.select();
    try {
        var flag = document.execCommand("copy");//执行复制
    } catch (eo) {
        var flag = false;
    }
    document.body.removeChild(textarea);//删除元素
    currentFocus.focus();
    return flag;
}
function RemoveAttach(name, list) {//需要移除的图片名,全图片字符串
    name = name.split('?')[0];
    name = name.toLowerCase().replace("/uploadfiles/", "");
    if (!list || list.length < 1) { return; }
    for (var i = 0; i < list.length; i++) {
        if (list[i].url.toLowerCase() == name) {
            list.splice(i, 1);
        }
    }
    return JSON.stringify(list);
}
//----页面回调,图片库等后执行
function PageCallBack(action, vals, pval) {//中转Hub
    action = action.replace(/ /g, "");
    switch (action) {
        case "selfiles"://图片库
            if (pval.field == "images") {
                AddAttach(null, { _raw: vals }, pval);
            }
            else {//选择视频,图片(单个)
                ReturnFile(vals, pval);
            }
            break;
        case "cutpic"://图片编辑
            vals = vals.toLowerCase();
            $("img[src]").each(function () {
                var url = $(this).attr("src").split('?')[0].toLowerCase();
                if (url == vals) { this.src = url + "?" + Math.random(); }
            });
            break;
        case "selicon":
            $("#" + pval.name).val(vals);
            $("#sp_" + pval.name).attr("class", vals);
            break;
        case "adddown"://自定义下载
            $("#" + pval.name).val(JSON.stringify(vals));
            break;
        case "pushcon"://选择推送节点
            {
                $("#pushcon_ul").html(""); $("#pushcon_hid").val(""); $("#pushcon_div").show();
                var litlp = "<li><span>@nodename</span></li>";
                var ids = "";
                for (var i = 0; i < vals.length; i++) {
                    $("#pushcon_ul").append(litlp.replace("@nodename", vals[i].nodename));
                    ids += vals[i].nodeid + ",";
                }
                $("#pushcon_hid").val(ids);
            }
            break;
        case "SelContent"://关联内容
            $("#RelatedIDS_Hid").val(vals);
            break;
    }
    CloseDiag();
}
//----回调实际处理方法
//单图片,只处理第一张图
function ReturnFile(imgs, pval) {
    var name = pval.name;
    var url = imgs.split('|')[0];
    for (var i = 0; i < length; i++) {
        $("#txt_" + name).val(url);
        $("#Img_" + name).attr('src', url);
    }
    CloseDiag();
}
//选择用户回调
function UserFunc(json, select) {
    var uname = "", uid = "";
    for (var i = 0; i < json.length; i++) {
        uname += json[i].HoneyName + ",";
        uid += json[i].UserID + ",";
    }
    if (uid) uid = uid.substring(0, uid.length - 1);
    if (uname) uname = uname.substring(0, uname.length - 1);

    $("#" + select + "_T").val(uname);
    $("#" + select + "_Hid").val(uid);

    if (comdiag != null) { comdiag.CloseModal(); }
}
//----
$(function () {
    if ($(".preview_img").length > 0) { BindAttachEvent(); }  //绑定组图事件
    if (window.UE) { setTimeout(function () { GetTopImg("txt_content"); }, 1500); setTimeout(function () { SeledPic(); }, 2000) }
    if ($("#OAkeyword").length > 0) { $("#OAkeyword").tabControl({ maxTabCount: 5, tabW: 80 }, $("#Keywords").val()); }//关键词
    $("#txtTitle").change(function () {
        if ($("#OAkeyword").length > 0) {
            document.getElementById("Keywords").value = GetKeys(ZLTags, this.value, 5);
            $("#OAkeyword").html("");
            $("#OAkeyword").tabControl({ maxTabCount: 5, tabW: 80 }, document.getElementById("Keywords").value);
            DupTitleFunc(this.value);
        }
    }); //自动生成关键词
    $(".for").click(function () { var id = $(this).data("for"); $("#" + id).val($(this).text()); }); //单行文本
    Camera.Init();
    CMDBtns.Init();
});
var CMDBtns = {
    Init: function () {
        //绑定事件
        $(".cmdbtn").click(function () {
            var $btn = $(this);
            var $group = $btn.closest(".cmdgroup");
            var cmd = $btn.data("cmd");
            var ueditor = UE.getEditor($group.data("id"));
            switch (cmd) {
                case "disable":
                    $btn.hide();
                    $group.find("[data-cmd=enable]").show();
                    ueditor.setDisabled('fullscreen');
                    break;
                case "enable":
                    $btn.hide();
                    $group.find("[data-cmd=disable]").show();
                    ueditor.setEnabled();
                    break;
                case "hide":
                    $btn.hide();
                    $group.find("[data-cmd=show]").show();
                    ueditor.setHide()
                    break;
                case "show":
                    $btn.hide();
                    $group.find("[data-cmd=hide]").show();
                    ueditor.setShow();
                    break;
                case "clear":
                    if (confirm("确定要清空编辑器中内容吗?")) { ueditor.setContent(""); }
                    break;
                default:
                    break;
            }
        });
    }
};
var Camera = {};
//初始化拍照字段事件
Camera.Init = function () {
    var _self = this;
    var $cameratd = $(".fd_tr_video").closest('td');
    if ($cameratd.length <= 0) { return; }
    $cameratd.find('.fd_td_shoot_btn').click(function () {//拍照操作
        var video = $(this).closest('td').find('.fd_tr_video')[0];
        var imgobj = $(this).closest('td').find('img')[0];
        if (video.src == "") { _self.EnableFiedCamera(video); }
        else {
            _self.ShootFiedCamera(video, imgobj);
        }
    });
    $cameratd.find('.fd_td_upfile_btn').click(function () {
        var base64data = $(this).closest('td').find('img').attr('src');
        if (base64data.indexOf("data:image") < 0) { alert("请您先拍照!"); return; }
        _self.UploadCameraData(base64data.substr(22), $(this).closest('td').find("input[type='hidden']")[0]);//上传图片
    });
    $cameratd.find('.fd_td_resetcamera_btn').click(function () {//重置图片
        $(this).closest('td').find('img').attr('src', '/UploadFiles/nopic.svg');
        $(this).closest('td').find("input[type='hidden']").val('/UploadFiles/nopic.svg');
    });
    $("form").submit(function () {
        var base64data = $cameratd.find('img').attr('src');
        if (base64data.indexOf("data:image") > -1 && confirm('您还没有保存已拍照的图片,是否保存?')) {
            _self.UploadCameraData(base64data, $cameratd.find("input[type='hidden']"));
            return false;
        }
    });
    //$cameratd.find('img').attr('src', "/UploadFiles/" + $cameratd.find("input[type='hidden']").val().replace('/UploadFiles/', ''));
}
//拍照操作
Camera.ShootFiedCamera = function (video, imgobj) {
    var canvas = document.createElement('canvas'); //建立canvas js DOM元素
    canvas.width = video.videoWidth;
    canvas.height = video.videoHeight;
    var ctx = canvas.getContext('2d');
    ctx.drawImage(video, 0, 0);
    var imgData = canvas.toDataURL("image/jpg");
    $(imgobj).attr('src', imgData);
}
//上传已拍照图片
Camera.UploadCameraData = function (base64str, hiddenObj, callback) {
    $.post('/Plugins/Uploadify/Base64.ashx', { action: "content", base64: base64str }, function (data) {
        $(hiddenObj).closest('td').find('img').attr('src', data);
        $(hiddenObj).val(data.replace('/UploadFiles/', ''));
        alert('保存成功!');
        if (callback) { callback(data); }
    });
}
//启用拍照功能
Camera.EnableFiedCamera = function (video) {
    navigator.getUserMedia = navigator.getUserMedia || navigator.webkitGetUserMedia;
    if (navigator.getUserMedia) {
        if (navigator.webkitURL) {
            navigator.getUserMedia({ video: true }, function (stream) {
                video.src = window.webkitURL.createObjectURL(stream);
            }, function (error) { });
        }
        else {
            navigator.getUserMedia({ video: true }, function (stream) {
                video.src = window.webkitURL.createObjectURL(stream);

            }, function (error) { });
        }
    }
    if (!navigator.getUserMedia) {
        alert('您的浏览器不支持在线拍照功能!')
        return;
    }
}
var api_qq_mvs = {};
//-----微视频弹窗
api_qq_mvs.ShowDiag = function (name, remotePath) {
    if (!remotePath) { remotePath = ''; }
    ShowComDiag("/Common/UploadMvs?remotePath=" + remotePath + "&name=" + name, "微视频上传");
}
api_qq_mvs.Success = function (name, remotePath, url) {
    console.log(name + "|" + remotePath, url);
    $("#UpMvs_" + name).val(remotePath + "|" + url);
    $("#show_" + name).show();
    $("#UpMvs_" + name).hide();
    $("#mvsurl_" + name).html(url);
    $("#video_" + name).attr("src", url);
    $("#upbtn_" + name).hide();
    CloseComDiag();
}

//------------------------------------------------------------------
var conhelp = { pdf: {}, word: {} };
conhelp.pdf.create = function (btn) {
    disBtn(btn);
    $.post("Content_PdfAPI?op=create", { gid: zlconfig.gid }, function (data) {
        disBtn(btn, 50);
        APIResult.ifok(data, function (result) { $("#content_pdf_t").val(result); }, function (data) { console.log("pdf err", data); });
    })
}
conhelp.pdf.del = function () {
    if (!confirm("确定要删除吗")) { return false; }
    $.post("Content_PdfAPI?op=del", { gid: zlconfig.gid }, function (data) {
        APIResult.ifok(data, function (result) { $("#content_pdf_t").val(""); }, function (data) { console.log("pdf err2", data); });
    })
}
conhelp.pdf.down = function () {
    var url = $("#content_pdf_t").val();
    if (ZL_Regex.isEmpty(url)) { return; }
    else { window.open(url); }
}
conhelp.word.create = function (btn) {
    disBtn(btn);
    $.post("Content_WordAPI?op=create", { gid: zlconfig.gid }, function (data) {
        disBtn(btn, 50);
        APIResult.ifok(data, function (result) { $("#content_word_t").val(result); }, function (data) { console.log("word err", data); });
    })
}
conhelp.word.del = function () {
    if (!confirm("确定要删除吗")) { return false; }
    $.post("Content_WordAPI?op=del", { gid: zlconfig.gid }, function (data) {
        APIResult.ifok(data, function (result) { $("#content_word_t").val(""); }, function (data) { console.log("word err2", data); });
    })
}
conhelp.word.down = function () {
    var url = $("#content_word_t").val();
    if (ZL_Regex.isEmpty(url)) { return; }
    else { window.open(url); }
}
conhelp.verbak = {};
conhelp.verbak.showDiag = function () {
    ShowDiag("Addon/VerBak?ID=" + zlconfig.gid, "存档备份 <span class='rd_green'>(版本历史存于ZL_Content_VerBak表中)</span>");
}