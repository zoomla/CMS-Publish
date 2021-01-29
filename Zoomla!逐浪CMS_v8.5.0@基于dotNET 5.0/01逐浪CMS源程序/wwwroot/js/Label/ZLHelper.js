﻿var ZLHelper = {};
ZLHelper.ToWordByID = function (id, name) {
    var html = document.getElementById(id).innerHTML;
    if (!name || name == "") { name = $("title").text(); }
    ZLHelper.OutToWord(html, name);
}
// excel_no,excel_show

//ZLHelper.ToExcelByID = function (id,name) {
//    if (!id) { id = "EGV"; }
//    var $html = $(document.getElementById(id).outerHTML);
//    $html.find("td").css("border", "1px solid #666");
//    $html.find("th").css("border", "1px solid #666");
//    $html.find("tr:last").remove();//移除分页与不需要输出的列
//    $html.find(".excel_no").remove();
//    //将超链接中的文本取出替换超链接
//    $html.find("a").each(function () {
//        var text = $(this).text();
//        $(this).replaceWith("<span>" + text + "</span>");
//    });
//    if (!name || name == "") { name = $("title").text(); }
//    ZLHelper.OutToExcel($html.html(), name);
//}
//可对html自定义处理后,再利用其导出
//元素间(<div></div>)不能换行,否则后台格式需要特殊处理 
ZLHelper.OutToWord = function (html, name) {
    if (name == undefined || !name) { name = $("title").text(); }
    if (name && name != "") { name = escape(name); }
    var $form = $('<form  method="post" action="/Common/Label/OutToWord?name=' + name + '"></form>');
    $form.append('<input type="hidden" name="html_toword_hid" value=' + encodeURI(html) + '>');
    $("body").append($form);//兼容IE
    $form.submit();
    $form.remove();
}
//根据html生成Excel [disuse]
//ZLHelper.OutToExcel = function (html, name) {
//    if (name == undefined || !name) { name = ""; }
//    if (name && name != "") { name = escape(name); }
//    var $form = $('<form   method="post" action="/Common/Label/OutToExcel?name=' + name + '"></form>');
//    $form.append('<input type="hidden" name="html_toword_hid" value=' + encodeURI(html) + '>');
//    $("body").append($form);//兼容IE
//    $form.submit();
//    $form.remove();
//}
ZLHelper.OutToExcel = function (id, name)
{
    if (!id || id == undefined) { id = "EGV"; }
    if (name == undefined || !name) { name = $("title").text(); }
    if (name) { name = escape(name); }
    var json = ZLHelper.TableToJson(id);
    var $form = $('<form method="post" action="/Common/OutToExcel?name=' + name + '"></form>');
    $form.append('<input type="hidden" name="table_head_hid" value=' + encodeURI(JSON.stringify(json.head)) + '>');
    $form.append('<input type="hidden" name="table_data_hid" value=' + encodeURI(JSON.stringify(json.data)) + '>');
    $("body").append($form);//兼容IE
    $form.submit();
    $form.remove();
}
ZLHelper.OutToPdf = function (html, name) {

}
//<script src="/Plugins/Third/html2canvas.js"></script>
ZLHelper.OutToImage = function (id, name) {
    if (!name) { name = $("title").text(); }
    var dom = document.getElementById(id);
    if (!dom || dom == null) { alert("需生成图片的元素未指定"); return false;}
    html2canvas(dom).then(function (canvas) {
        var base64 = canvas.toDataURL("image/png");//base64

        var $form = $('<form   method="post" action="/Common/Label/OutToImg"></form>');
        $form.append('<input type="hidden" name="base64_hid" value="' + base64 + '">');
        $form.append('<input type="hidden" name="name" value="' + name + '"/>');
        $("body").append($form);//兼容IE
        $form.submit();
        $form.remove();
    });
}
//将table转换为json用于导出
ZLHelper.TableToJson = function (id) {
    //[{UserID:"",UserName:""}]
    var tb_head = [];
    var tb_data = [];
    var isFirst = true;
    var $table = $("#" + id);//EGV
    $table.find("tr:not(:last)").each(function () {
        if (isFirst) {
            $(this).find("td:not(.excel_no),th:not(.excel_no)").each(function () {
                tb_head.push($(this).text());
            });
            isFirst = false;
            return;
        }
        //------------------
        var tb_row = {};
        var $tds = $(this).find("td:not(.excel_no)");
        for (var i = 0; i < $tds.length; i++) {
            tb_row["c" + i] = $($tds[i]).text().replace(/(\n| )/ig, "");
        }
        tb_data.push(tb_row);
    });
    return { "head": tb_head, "data": tb_data }
}
//点击非目标对象关闭提示层
var pophelp = {};
pophelp.autoclose = function () {
    $body = $("body");
    $body.find('.popovers').each(function () {
        $(this).click(function (e) {
            $('.popover').remove();
            e.preventDefault();
            return false;
        });
        $(this).popover({
            trigger: 'click'
        });
    });
    $body.click(function () {
        $('.popover').remove();
    });
}
