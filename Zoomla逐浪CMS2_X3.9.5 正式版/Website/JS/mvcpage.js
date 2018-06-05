
/*
<a href="javascript:;" class="option_style" onclick="mvcpage.del({ ids: '@dr["FavoriteID"]', url: 'favour_del', confirm: '确定要移除吗' });"><i class="zi zi_trashalt"></i></a>
<input type="button" value="批量删除" onclick="mvcpage.bat({url: 'favour_del', confirm: '确定要批量移除吗',after:'reload' });" class="btn btn-info" />
after:'方法名'
<input type="hidden" id="skey" value="@ViewBag.skey">

mvcpage.load();//搜索或其他条件选项变更,重新加载页面(表名等均为默认参数)
mvcpage.load(url:'xxxx',target:"EGV1",page:"first");//回复后至第一页
mvcpage.post({ url: 'addon_verbak_del', data: {ids:'@dr["ID"]'},callback:'delback',confirm:'确定要操作吗'});
*/
var mvcpage = {};
//加载指定页
mvcpage.load = function (opts) {
    //{target:"EGV",page:1,psize:10}
    opts = mvcpage.fillopts(opts);
    var $target = $("#" + opts.target);
    var filter = mvcpage.help.getPageFilter(opts);//需要提交的筛选器
    if (opts.psize) { filter.psize = opts.psize; }

    switch (opts.page) {
        case "first":
            filter.cpage = 1;
            break;
        case "last":
            filter.cpage = filter.pcount;
            break;
        case "prev":
            filter.cpage--;
            break;
        case "next":
            filter.cpage++;
            break;
        case "reload"://刷新当前页(添加|删除)
            break;
        default:
            filter.cpage = parseInt(opts.page);
            break;
    }
    var url = filter.url;
    //移除不需要提交的数据
    delete filter.url;
    delete filter.pcount;
    $.post(url, filter, function (data) {
        $target.replaceWith(data);
        if (opts.cb) { opts.cb(filter); }
    })
}
//自动获取页面上的checkbox选值,提交
mvcpage.bat = function (opts) {
    //{chkname:'',taraget:'',||url:'',confirm:'确定要删除吗'}
    if (!opts.chkname) { opts.chkname = "idchk"; }
    var ids = mvcpage.help.getchk(opts.chkname);
    if (ids == "") { alert("请选择需要操作的数据"); return; }
    if (!opts.after) { opts.after = "reload"; }
    if (opts.confirm) { if (!confirm(opts.confirm)) { return; } }
    if (!opts.data) { opts.data = {}; }//需要提交的数据
    opts.data.ids = ids;
    $.post(opts.url, opts.data, function (data) {
        if (typeof (opts.after) == "function") {
            opts.after(data);
        }
        else if (typeof (opts.after) == "string") {
            switch (opts.after) {
                case "reload":
                    break;
                default://未命中则执行js方法
                    mvcpage.help.call(opts.after, data);
                    break;
            }
        }
        if (data == 1 || data.indexOf("{\"retcode\":1,") == 0)
        { mvcpage.load({ target: opts.target, page: "reload" }); } else { console.log(data); }
       
    })
}
//删除指定数据,完成后重载当前页
mvcpage.del = function (opts) {
    //{id:'',url:'',confirm:'确定要删除吗'}
    opts = mvcpage.fillopts(opts);
    if (opts.confirm) { if (!confirm(opts.confirm)) { return; } }
    $.post(opts.url, { "ids": opts.ids, "id": opts.id }, function (data) {
        if (opts.after && typeof (opts.after) == "function") { opts.after(data); return; }
        if (data == 1) {
            mvcpage.load({ target: opts.target, page: "reload" });
        }
        else { console.log("del err", data); }
    })
}
//提交后执行页面回调方法
mvcpage.post = function (opts) {
    //{id:'',url:'',confirm:'确定要执行此操作吗',data:{id:1},callback:'方法名'}
    opts = mvcpage.fillopts(opts);
    if (opts.confirm) { if (!confirm(opts.confirm)) { return; } }
    $.post(opts.url, opts.data, function (result) {
        if (opts.callback == "reload") { opts.url = ""; mvcpage.load(opts); }
        else { mvcpage.help.call(opts.callback, opts.data, result); }
    });
}
//为分页等各选项填充默认值
mvcpage.fillopts = function (opts) {
    if (!opts) { opts = {}; }
    if (!opts.page) { opts.page = "1";}
    if (!opts.target) { opts.target = "EGV"; }
    if (!opts.chkname) { opts.chkname = "idchk"; }
    if (!opts.mvcparam) { opts.mvcparam = ".mvcparam"; }
    return opts;
}
//-----辅助方法不仅可用于mvcpage
mvcpage.help = {};
//获取当前列表页面的筛选条件,与分页数据
mvcpage.help.getPageFilter = function (opts) {
    //mvcpage.fillopts(opts);
    var filter = {};
    var $div = $(".mvcpage[data-for='" + opts.target + "']");//信息存在分页处
    if ($div.length > 0) {
        filter.pcount = $div.data("pcount");
        filter.cpage = parseInt($div.data("cpage"));
        filter.psize = $div.data("psize");
        filter.url = $div.data("url");
        filter.mvcparam = $div.data("mvcparam");
    } else {
        //无存储数据的分页div,则读默认配置
        filter = opts;
    }
    $(filter.mvcparam).each(function () {
        var $this = $(this);
        var val = $this.val();
        //其中的数据如果标识是json
        if ($this.data("type") == "json") {
            if (val) {
                var json = JSON.parse(val);
                for (var key in json) {
                    filter[key] = json[key];
                }
            }
        }
        else {
            filter[$this.attr("id")] = $this.val();
        }
    });
    console.log("mvcpage.filter",filter);
    return filter;
}
mvcpage.help.getchk = function (name) {
    var ids = "";
    var $chks = $("input[name='" + name + "']:checked");
    if ($chks.length < 1) { return ""; }
    $chks.each(function () { ids += this.value + ","; });
    if (ids.length > 0) { ids = ids.substr(0, ids.length - 1); }
    return ids;
}
//根据方法名称,执行方法
mvcpage.help.call = function (name, data,result) {
    try {
        var func = eval(name);
        func(data, result);
    } catch (ex) { console.log("call failed", name, ex); }
}
mvcpage.help.submit = function (conf) {
    if (!conf.formid) { conf.formid = "form1"; }
    var form = document.getElementById(conf.formid);
    form.action = conf.url;
    //form.submit();
    //使用jquery提交,便于捕捉事件
    $(form).submit();
}