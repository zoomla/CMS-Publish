function hotkey() {
    var a = window.event.keyCode;
    if (window.event.altKey && a == 88) {
        opentitle("LabelPage", "选择标签[按ESC键关闭窗口]");
    }
}
function GetCode(obj) {
    console.log(obj);
    var labeltype, code;
    if (arguments.length == 2) {
        labeltype = arguments[0]; code = arguments[1];
    }
    else { var $obj = $(obj); labeltype = $obj.attr("outtype"); code = $obj.attr("code"); }
    switch (labeltype) {
        case "1":
            code = "{ZL.Label id=\"" + code + "\"/}";
            break;
        case "2":
        case "4":
            var link = window.location.protocol + "//" + window.location.host + "/Admin/Template/" +  "LabelInsert?n=" + code;
            $("#label_modal_title").text("标签名称：" + code);
            $("#label_modal_iframe").attr('src', link);
            $("#label_modal_submit").click(function () {
                $('#label_modal_iframe')[0].contentWindow.submitdate();
                labelModal.hide();
            });
            labelModal.show();
            code = "";
            break;
        case "3":
            code = "{ZL.Source id=\"" + code + "\"/}";
            break;
        case "5":
            code = "{ZL.Page id=\"" + code + "\"/}";
            break;
        case "6":
            code = "{ZL.Page id=\"" + code + "\" num=\"500\"/}";
            break;
        default:
            break;
    }
    return code;
}
//--------------
$(function () {
    InitLabelDrag();
});
function InitLabelDrag() {
    $(".spanfixdiv,.spanfixdivchechk").attr("draggable", true);
    //$(".spanfixdiv,.spanfixdivchechk").bind("dragstart", function (event) { drag(event); })
    //兼容Firefox
    $(".spanfixdiv,.spanfixdivchechk").each(function () {
        var obj = this;
        this.ondragstart = function (e) {
            var code = GetCode(obj);
            e.dataTransfer.setData("text", code);
        }
    });
    //document.ondragover = function (event) { event.preventDefault(); };
}
//----素材选择与上传
function SelPic(pval) {
    comdiag.maxbtn = false;
    ShowComDiag("/Common/SelFiles?pval=" + JSON.stringify(pval), "选择图片");
}
//----更新标签列表
//根据自定义标签,填充
function GetCustom(obj) {
    var stlp = '<div outtype="@LabelType" code="@LabelName" class="list-group-item spanfixdivchechk text-start" draggable="true"><a onclick=\'opentitle(\"LabelSql?LabelName=@LabelN2\",\"修改标签\");\' href="javascript:;" title="修改标签"><span class="fa fa-edit"></span></a><span outtype="@LabelType" code="@LabelName">@LabelName</span></div>';
    $.post("LabelCall_API?action=custom", { "cate": obj.value }, function (list) {
        for (var i = 0; i < list.length; i++) {
            list[i].LabelN2 = encodeURI(list[i].LabelName);
        }
        var html = JsonHelper.FillData(stlp, list);
        $("#CustomLabel_div").html(html);
        InitLabelDrag();
        $("#CustomLabel_div div.spanfixdivchechk").each(function(){
            var obj = this;
            $(this).on("click", function(){
                GetCode(obj);
            });
        });
    }, "json");
}
function GetField(obj) {
    $.post("LabelCall_API?action=field", {"labelid": obj.value }, function (html) {
        html = base64.decode(html);
        $("#Field_div").html(html);
        InitLabelDrag();        
        $("#Field_div div").each(function () {
            $(this).click(function () {
                insertText($(this).attr("code"));
            });
        });
    })
}