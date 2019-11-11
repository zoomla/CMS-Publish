var adminTab = {
    //缓存tabs数据
    cache: [],
    //tabId的起始值
    maxId: 0,
    cfg: {
        tab_max_title: 6,
        //可修改为按屏幕高度
        ifr_min_height: 600,
    },
    tlp: {
        tab: '<li class="at_tab" id="at_tab_@id"><a href="javascript:"><span class="at_tab_title">@title</span></a><a class="at_tab_close" title="关闭"><span class="zi zi_times"></span></a></li>',
        ifr: '<iframe class="at_ifr" id="at_ifr_@id" style="z-index: 2; visibility:inherit;width:100%;display:none;" src="@url" frameborder="0" scrolling="no"></iframe>'
    },
    tool: {
        //替换占位符
        replace: function (tlp, model) {
            for (var key in model) {
                if (key.indexOf("$") == 0) { continue; }
                tlp = tlp.replace(new RegExp("@" + key, "gm"), model[key]);
            }
            return $(tlp);
        },
        //iframe加载完成后,自动获取title
        setTabTitle: function (model) {
            var ref = adminTab;
            var cfg = ref.cfg;
            var title = "";
            try { title = model.$ifr[0].contentWindow.document.title; } catch (e) { }
            if (title.length > ref.cfg.tab_max_title) { title = title.substr(0, ref.cfg.tab_max_title) + ".."; }
            model.$tab.find(".at_tab_title").text(title);
        }
    },
    add: function (json) {
        var ref = this;
        var model = ref.model_new(json);
        ref.cache.push(model);
        //绑定事件
        model.$tab.find(".at_tab_close").click(function () {
            ref.del(model.id);
        })
        model.$tab.click(function () {
            ref.switchTab(model);
        });
        model.$ifr[0].onload = function () {
            ref.tool.setTabTitle(model);
            var height = model.$ifr.contents().height() + 20;
            if (height < ref.cfg.ifr_min_height) { height = ref.cfg.ifr_min_height; }
            //if (height > ref.cfg.ifr_max_height) { height = ref.cfg.ifr_max_height; }
            model.$ifr.height(height + 'px');
        };
        $("#admin_tabs").append(model.$tab);
        $("#admin_ifrs").append(model.$ifr);
        ref.switchTab(model);
    },
    del: function (id) {
        var ref = this;
        var model = ref.model_get(id);
        //最后一个不可删除
        if (!model || ref.cache.length < 1) { return; }
        model.$tab.remove();
        model.$ifr.remove();
        for (var i = 0; i < ref.cache.length; i++) {
            if (ref.cache[i].id == id)
            { ref.cache.splice(i, 1); break; }
        }
        ref.switchTab(ref.cache[0]);
    },
    //切换当前活动的tab
    switchTab: function (model) {
        var ref = this;
        ref.model_active = model;
        if (model.$tab.hasClass("active")) { return; }
        $(".at_tab").removeClass("active");
        $(".at_ifr").hide();
        model.$tab.addClass("active");
        model.$ifr.show();
    },
    model_new: function (json) {
        var ref = this;
        var model = { id: (ref.maxId++), title: "新标签", url: "/Admin/Main.aspx", $tab: null, $ifr: null };
        //赋初始值
        if (json && typeof (json) == "object") {
            for (var key in json) {
                if (!model[key]) { continue; }
                model[key] = json[key];
            }
        }
        //加载模板,并替换占位符
        model.$tab = $(ref.tool.replace(ref.tlp.tab, model));
        model.$ifr = $(ref.tool.replace(ref.tlp.ifr, model));
        return model;
    },
    model_get: function (id) {
        var ref = this;
        for (var i = 0; i < ref.cache.length; i++) {
            if (ref.cache[i].id == id) { return ref.cache[i]; }
        }
        return null;
    },
    //当前选中的model
    model_active: null,
    //当前跳转
    open: function (url) {
        var ref = this;
        var active = ref.model_active;
        if (!active || active == null) { return; }
        active.$ifr.attr("src", url);
    },

};
/*
<ul id="admin_tabs">
   <li class="at_tab_end" onclick="adminTab.add();"><a title="新选项卡" href="javascript:"><i class="zi zi_plus" zico="加号黑"></i></a></li>
</ul>
<div id="admin_ifrs"></div>
 */

//自实现html与元素方面的新增与切换 
//adminTab.add({ url: "/Admin/Default" });
//adminTab.add({ url: "/Admin/Main.aspx" });
//adminTab.add({ url: "/Admin/Main.aspx" });