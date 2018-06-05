var ZLHelper = {};
ZLHelper.ToWordByID = function (id, name) {
    var html = document.getElementById(id).innerHTML;
    if (!name || name == "") { name = $("title").text(); }
    ZLHelper.OutToWord(html, name);
}
ZLHelper.ToExcelByID = function (id,name) {
    if (!id) { id = "EGV"; }
    var $html = $(document.getElementById(id).outerHTML);
    $html.find("td").css("border", "1px solid #666");
    $html.find("th").css("border", "1px solid #666");
    $html.find("tr:last").remove();//移除分页与不需要输出的列
    $html.find(".excel_no").remove();
    //将超链接中的文本取出替换超链接
    $html.find("a").each(function () {
        var text = $(this).text();
        $(this).replaceWith("<span>" + text + "</span>");
    });
    if (!name || name == "") { name = $("title").text(); }
    ZLHelper.OutToExcel($html.html(), name);
}
//可对html自定义处理后,再利用其导出
//元素间(<div></div>)不能换行,否则后台格式需要特殊处理 
ZLHelper.OutToWord = function (html, name) {
    if (name == undefined || !name) { name = ""; }
    if (name && name != "") { name = escape(name); }
    var $form = $('<form   method="post" action="/Common/Label/OutToWord.aspx?name=' + name + '"></form>');
    $form.append('<input type="hidden" name="html_toword_hid" value=' + encodeURI(html) + '>');
    $("body").append($form);//兼容IE
    $form.submit();
    $form.remove();
}
ZLHelper.OutToExcel = function (html, name) {
    if (name == undefined || !name) { name = ""; }
    if (name && name != "") { name = escape(name); }
    var $form = $('<form   method="post" action="/Common/Label/OutToExcel.aspx?name=' + name + '"></form>');
    $form.append('<input type="hidden" name="html_toword_hid" value=' + encodeURI(html) + '>');
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

        var $form = $('<form   method="post" action="/Common/Label/OutToImg.aspx"></form>');
        $form.append('<input type="hidden" name="base64_hid" value="' + base64 + '">');
        $form.append('<input type="hidden" name="name" value="' + name + '"/>');
        $("body").append($form);//兼容IE
        $form.submit();
        $form.remove();
    });
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
