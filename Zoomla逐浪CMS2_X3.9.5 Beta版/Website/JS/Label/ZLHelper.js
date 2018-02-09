var ZLHelper = {};
ZLHelper.ToWordByID = function (id, name) {
    var html = document.getElementById(id).innerHTML;
    ZLHelper.OutToWord(html, name);
}
ZLHelper.ToExcelByID = function (id) {
    if (!id) { id = "EGV"; }
    var $html = $(document.getElementById("EGV").outerHTML);
    $html.find("td").css("border", "1px solid #666");
    $html.find("th").css("border", "1px solid #666");
    $html.find("tr:last").remove();//移除分页与不需要输出的列
    $html.find(".excel_no").remove();
    //将超链接中的文本取出替换超链接
    $html.find("a").each(function () {
        var text = $(this).text();
        $(this).replaceWith("<span>" + text + "</span>");
    });
    ZLHelper.OutToExcel($html.html(), $("title").text());
}
//可对html自定义处理后,再利用其导出
//元素间(<div></div>)不能换行,否则后台格式需要特殊处理 
ZLHelper.OutToWord = function (html, name) {
    if (name == undefined || !name) { name = ""; }
    if (name && name != "") { name = escape(name); }
    var $form = $('<form target="_blank"  method="post" action="/Common/Label/OutToWord.aspx?name=' + name + '"></form>');
    $form.append('<input type="hidden" name="html_toword_hid" value=' + encodeURI(html) + '>');
    $("body").append($form);//兼容IE
    $form.submit();
    $form.remove();
}
ZLHelper.OutToExcel = function (html, name) {
    if (name == undefined || !name) { name = ""; }
    if (name && name != "") { name = escape(name); }
    var $form = $('<form target="_blank"  method="post" action="/Common/Label/OutToExcel.aspx?name=' + name + '"></form>');
    $form.append('<input type="hidden" name="html_toword_hid" value=' + encodeURI(html) + '>');
    $("body").append($form);//兼容IE
    $form.submit();
    $form.remove();
}
ZLHelper.OutToPdf = function (html, name) {

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