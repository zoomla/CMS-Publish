if (parent && parent.ShowMain) {
   var  ShowMain = parent.ShowMain;
   var showleft = parent.showleft;
}
function lock(evt) {//alt+ 快捷键
    var a;
    var res;
    if (navigator.appName == "Microsoft Internet Explorer") {
        a = event.keyCode;
        res = event.altKey;
    } else {
        a = evt.which;
        res = evt.altKey;
    }
    if (a == 13) { event.keyCode = 9; }
    //-------------------
    if (res && evt.shiftKey)//按下 alt+shift
    {
        switch (a) {
            case 70:
                if (!$("#BaiduTrans_btn")[0]) {; $("body").append("<button type='button' id='BaiduTrans_btn' style='display:none;'></button>"); }
                $("#BaiduTrans_btn").TransTools();
                $("#BaiduTrans_btn").click();
                break;
        }
    }
    else if (res)//只按下alt键
    {
        switch (a) {
            case 65:
                ShowMain('LabelGuide.ascx', 'Template/LabelCallTab.aspx');
                break;
            case 67:
                showleft('menu8_6', 'Template/TemplateSetOfficial.aspx');
                break;
            case 68:
                ShowMain('', '/Common/SelectChinaDay.html');
                break;
            case 72:
                window.open("../../help.html");
                break;
            case 73:
                window.open("/");
                break;
            case 74:
                modalDialog('/Common/calc.html', 'calculator', 420, 320)
                break;
            case 76:
                ShowMain('LabelGuide.ascx', 'Template/LabelManage.aspx');
                break;
            case 77:
                showleft('menu8_2', 'Content/Model/ModelManage.aspx?ModelType=1');
                break;
            case 78:
                ShowMain('', 'Main.aspx');
                break;
            case 81:
                showWindow('Lockin.aspx', 900, 460);
                break;
            case 82://r
                ShowMain('NodeTree.ascx', 'Content/ContentManage.aspx');
                break;
            case 83:
                showleft('menu8_6', 'Template/CSSManage.aspx');
                break;
            case 84:
                showleft('menu8_6', 'Template/TemplateSet.aspx');
                break;
            case 85:
                window.open("/User/");
                break;
            case 87:
                $(top.document).find(".manage_mobilemenu").addClass("active");
                break;
        }
    }
}
$(document).keydown(lock);
function modalDialog(url, name, width, height)
{
    if (width == undefined) {
        width = 600;
    }
    if (height == undefined) {
        height = 500;
    }
    if (window.showModalDialog) {
        window.showModalDialog(url, name, 'dialogWidth=' + (width) + 'px; dialogHeight=' + (height + 5) + 'px; status=off');
    }
    else {
        x = (window.screen.width - width) / 2;
        y = (window.screen.height - height) / 2;
        window.open(url, name, 'height=' + height + ', width=' + width + ', left=' + x + ', top=' + y + ', toolbar=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, modal=yes');
    }
}