//后期修改main_right id
var FrameTab = {
    cfg: {
        tabTlp: '<li class="FrameTab" id="FrameTab{tabId}" data-id="{tabId}" onclick="FrameTab.switchTab(this);"><a href="javascript:"><span class="FrameTabTitle">新选项卡</span></a><a class="closeTab" title="关闭" onclick="FrameTab.del(this);"><span class="zi zi_times"></span></a></li>',
        iframeTlp: '<iframe id="main_right" name="main_right" class="FrameIframe" data-id="{tabId}" onload="FrameTab.setTitle(this)" src="I/Main.aspx" style="z-index: 2; visibility: inherit; overflow-x: hidden; width: 100%; display: block;" frameborder="0" scrolling="yes"></iframe>'
    },
    cache: {
        activeId: 0,//当前active tab
        maxId:0
        //list: []//tabs存储
    },
    init:function(){
    
    },
    //单击创建新tab
    add: function (addDom) {
        var ref = this;
        ref.cache.maxId++;
        $(".ascx_key").blur();//触发关键词记忆
        var tabHtml = ref.cfg.tabTlp.replace(/{tabId}/ig, ref.cache.maxId);
        var iframeHtml = ref.cfg.iframeTlp.replace(/{tabId}/ig, ref.cache.maxId);
        $(tabHtml).insertBefore(addDom);
        $("#main_right_frame").append(iframeHtml);
        //-------切换新建的tab为当前active
        ref.switchTab(ref.getDomById(ref.cache.maxId));
    },
    del: function (dom) {
        var ref = this;
        var $tab = $(dom).closest(".FrameTab");
        var tabId = $(this).data("id");
        //如果只剩一个,则不关闭
        if ($(".FrameTab").length <= 1) { return false; }
        //移除tab,iframe
        var iframe = ref.getDomById(tabId, "iframe");
        //如果关闭的标签是当前标签，则切换到后一标签，如果不存在，则切换到前一标签
        if ($tab.hasClass("active")) {
            var $near = $tab.next(".FrameTab");
            if ($near.length < 1) { $near = $tab.prev(".FrameTab"); }
            ref.switchTab($near[0]);
        }
        $tab.remove();
        $(iframe).remove();
        //---阻止冒泡
        window.event ? window.event.cancelBubble = true : e.stopPropagation();
        return false;
    },
    //鼠标单击切换tab
    switchTab: function (dom) {
        var ref = this;
        var tabId = $(dom).data("id"); 
        if (ref.cache.activeId == tabId) { return false; }
        //-----------------------------------------------------
        //隐藏当前活动的tab对应的iframe,显示dom对应的iframe
        //修改tab的active状态
        //加载对应的左边栏菜单
        //var tab1 = {
        //    tab: ref.getDomById(ref.cache.activeId),
        //    iframe: ref.getDomById(ref.cache.activeId, "iframe")
        //};
        var tab2 = {
            tab: ref.getDomById(tabId),
            iframe: ref.getDomById(tabId, "iframe")
        };
        $(".FrameTab").removeClass("active");
        $(".FrameIframe").hide();
        $(tab2.tab).addClass("active");
        $(tab2.iframe).show();
        ref.cache.activeId = currentFrameTabId = tabId;
        myFrame.SwitchLeft(tabId);//main.js
        //document.getElementById("main_right").height = document.documentElement.clientHeight - 140;
        //记忆搜索
        setTimeout(function () { myFrame.SetKeyword(tabId); $(".ascx_key").bind("blur paste clip", function () { myFrame.SaveKeyword(tabId, $(this).val()); }); }, 300);
        //-----------------------------------------------------
    },
    //iframe加载完成后,获取所加载页面的title填充tab
    setTitle: function (iframe) {
        var ref = this;
        var tabId = $(iframe).data("id");
        var title = "";
        try { title = iframe.contentWindow.document.title; } catch (e) { }
        title = title || "新选项卡";
        if (title.length > 5) { title = title.substr(0, 4) + ".." }
        $(ref.getDomById(tabId)).find(".FrameTabTitle").html(title);
        //------设置iframe高度
        document.getElementById("main_right_frame").style.width = document.documentElement.clientWidth;
        iframe.height = document.documentElement.clientHeight - 140;
    },
    getDomById: function (id, type) {
        if (!type) { type = "tab"; }
        if (type == "tab") { return document.getElementById("FrameTab" + id); }
        else if (type == "iframe") {return $(".FrameIframe[data-id="+id+"]")[0]; }
        else { console.error("未取到匹配的tab控件"); return null; }
    }
};
FrameTab.init();
//兼容旧版
var currentFrameTabId = 0;