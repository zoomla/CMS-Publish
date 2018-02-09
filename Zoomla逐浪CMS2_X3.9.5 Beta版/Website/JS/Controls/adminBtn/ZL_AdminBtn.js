(function ($) {

    $.fn.popmenu = function (options) {

        var settings = $.extend({
            'controller': true,
            'width': '300px',
            'background': 'rgba(102,204,102,1)',
            'focusColor': '#1abc9c',
            'borderRadius': '10px',
            'top': '300',//50
            'left': '260',//0
            'iconSize': '100px'
        }, options);
        if (settings.controller === true) {
            var temp_display = 'none';
        } else {
            var temp_display = 'block';
        }
        var tar = $(this);
        var tar_body = tar.children('ul');
        var tar_list = tar_body.children('li');
        var tar_a = tar_list.children('a');
        var tar_ctrl = tar.children('.adminBtn_pop_ctrl');

        function setIt() {
            tar_body.css({
                'display': temp_display,
                'position': 'absolute',
                'margin-top': -settings.top,
                'margin-left': -settings.left,
                'background': settings.background,
                'width': settings.width,
                'float': 'left',
                'padding': '0',
                'border-radius': settings.borderRadius
            });
            tar_list.css({
                'display': 'block',
                'color': '#fff',
                'float': 'left',
                'width': settings.iconSize,
                'height': settings.iconSize,
                'text-align': 'center',
                'border-radius': settings.borderRadius
            });
            tar_a.css({
                'text-decoration': 'none',
                'color': '#fff'
            });
            tar_ctrl.hover(function () {
                tar_ctrl.css('cursor', 'pointer');
            }, function () {
                tar_ctrl.css('cursor', 'default')
            });
            tar_ctrl.click(function (e) {
                e.preventDefault();
                tar_body.show('fast');
                $(document).mouseup(function (e) {
                    var _con = tar_body;
                    if (!_con.is(e.target) && _con.has(e.target).length === 0) {
                        _con.hide();
                    }
                    //_con.hide(); some functions you want
                });
            });
            tar_list.hover(function () {
                $(this).css({
                    'background': settings.focusColor,
                    'cursor': 'pointer'
                });
            }, function () {
                $(this).css({
                    'background': settings.background,
                    'cursor': 'default'
                });
            });
        }
        return setIt();

    };

}(jQuery));
//-----------------------------------
var adminBtn = { hooks: {}, conf: { path: "" }, api: "/common/api/adminBtn.ashx?action=", $wrap: null };
adminBtn.init = function () {
    var ref = this;
    $.post(adminBtn.api + "init", {}, function (data) {
        try {
            var model = JSON.parse(data);
            if (model.retcode == 1) {
                ref.conf = JSON.parse(model.result);
                ref.$wrap = $('<div style="display:none;position:fixed;right:10px; top:60vh;z-index:9999999;width:50px;" title="逐浪通">');
                ref.$wrap.load("/JS/Controls/AdminBtn/adminBtn.html", function () {
                    $("body").append(ref.$wrap);
                    var model = ref.getPageInfo(); console.log(model);
                    ref.$wrap.find("#adminBtn_box li").not(".mod_common,.mod_" + model.type).remove();//去除当前页面不需要的按钮
                    ref.$wrap.find("#adminBtn_box").popmenu({ borderRadius: "0" })
                    ref.$wrap.show();
                });
            }
            else { console.log("adminBtn err", model.retmsg); }
        } catch (ex) { console.log("adminBtn init failed",data); }
    });
    //    $("#adminBtn_box li").not(".mod_common,.mod_product")
}
//根据页面链接,获悉所属模块 content|node|shop|store,只处理路由路径
adminBtn.getPageInfo = function () {
    var model = { type: "", id: 0 };
    var path = location.pathname.toLowerCase();
    var query = location.search.toLowerCase();

    if (path == "/" || path.indexOf("/default") == 0 || path.indexOf("/index.") == 0) { model.type = "index"; }
    else if (path.indexOf("/item/") == 0) {
        model.type = "content";// /item/1.aspx /item/1_2.aspx
        model.id = parseInt(path.replace("/item/", "").split('.')[0].split('_')[0]);
    }
    else if (path.indexOf("/shop/") == 0) {
        model.type = "product";
        model.id = parseInt(path.replace("/shop/", "").split('.')[0].split('_')[0]);
    }
    else if (path.indexOf("/class_") == 0) {
        //节点列表页等:/Class_1/Default.aspx /Class_1/NodeElite.aspx
        model.type = "node";
        model.id = parseInt(path.replace("/class_", "").split('/')[0]);
        model.nodeTlp = "";
        if (path.indexOf("/default") > 0) { model.nodeTlp = "default"; }
        else if (path.indexOf("/nodeelite") > 0) { model.nodeTlp = "elite"; }
    }
    else if (path.indexOf("/special_") == 0) {
        model.type = "special";
        model.id = parseInt(path.replace("/special_", "").split('/')[0]);
    }
    return model;
}
adminBtn.call = function (cmd) {
    if (!cmd || cmd == "") { return; }
    var model = adminBtn.getPageInfo();
    if (!adminBtn.hooks[cmd])//不存在则直接给服务端解决
    {
        window.open(adminBtn.api + cmd + "&id=" + model.id);
    }
    else { adminBtn.hooks[cmd](model); }
}
adminBtn.hooks["node_tlp"] = function (model) {
    window.open(adminBtn.api + "node_tlp&id=" + model.id + "&nodeTlp=" + model.nodeTlp);
}
//-------------------
adminBtn.hooks["content_edit"] = function (model) {
    window.open("/AdminMVC/Content/EditContent?GeneralID=" + model.id);
}
adminBtn.hooks["ToAdmin"] = function () { window.open(adminBtn.conf.path + "default.aspx"); }
adminBtn.hooks["ToUser"] = function () { window.open("/User/"); }
adminBtn.hooks["ToOrder"] = function () { window.open(adminBtn.conf.path + "Shop/OrderList.aspx"); }
adminBtn.hooks["ToContent"] = function () { window.open(adminBtn.conf.path + "Content/ContentManage.aspx"); }
adminBtn.hooks["ToProduct"] = function () { window.open(adminBtn.conf.path + "Shop/ProductManage.aspx"); }
//-------------------
adminBtn.hooks["exit"] = function () { adminBtn.$wrap.remove(); }

$(function () { adminBtn.init(); })