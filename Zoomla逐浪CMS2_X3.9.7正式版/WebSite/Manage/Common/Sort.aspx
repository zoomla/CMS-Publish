<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sort.aspx.cs" Inherits="ZoomLaCMS.Manage.Common.Sort" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>数据排序</title>
<style type="text/css">
    .thead span{font-weight:bolder;}
    .list-group-item {padding:0px;display:flex;cursor:pointer;}
    .list-group-item.active{background-color:#95d2fe;color:#fff;}

    .list-group-item span{box-sizing: border-box; border-right:1px solid #ddd; padding:5px 8px;}
    .w5{width:5%;min-width:50px;}
    .w10{width:10%;min-width:50px;}
    .w50{width:50%;min-width:250px;}
    .w40{width:40%;min-width:200px;}
    .w15{width:15%;min-width:100px;}
    .sortable-ghost{background-color:#95d2fe;color:#fff;}
    /*.sortable-chosen{background-color:#95d2fe;color:#fff;}*/
    /*.sortable-drag{display:none;}*/
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="list-group" style="margin-bottom: 5px;">
        <div class="list-group-item thead">
            <span class="w10 text-center">操作</span>
            <%--                <span class="w5">序号</span>--%>
            <span class="w5">ID</span>
            <span class="w50">标题<b class="text-danger">(支持拖动排序)</b></span>
            <span class="w40">备注</span>
        </div>
    </div>
    <div id="items_wrap" class="list-group">
        <asp:Repeater runat="server" ID="RPT">
            <ItemTemplate>
                <div class="list-group-item" data-id="<%#Eval("id") %>" data-oid="<%#Eval("order") %>">
                    <span class="w10 text-center">
                        <button type="button" class="btn btn-info btn-sm" onclick="sort.up(this);"><i class="zi zi_forUp"></i></button>
                        <button type="button" class="btn btn-info btn-sm" onclick="sort.down(this);"><i class="zi zi_forDown"></i></button>
                    </span>
                    <%--   <span class="w5">
                            <%#Eval("order") %>
                            <input type="number" class="form-control" value="<%#Eval("order") %>" max="100000" min="1"/>
                        </span>--%>
                    <span class="w5"><%#Eval("id")%></span>
                    <span class="w50"><%#Eval("title") %></span>
                    <span class="w40"><%#Eval("remind") %></span>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div style="height: 55px;"></div>
    <div style="position: fixed; text-align: center; padding: 5px 8px; background: rgba(221, 221, 221, 0.46); bottom: 0px; left: 0px; width: 100%; z-index: 10;">
        <button type="button" class="btn btn-info" onclick="sort.save();">保存排序</button>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Plugs/Sortable.js"></script>
<script>
    // List with handle
    var sortTable = Sortable.create(document.getElementById("items_wrap"), {
        //handle: '.zi_ydjt',
        filter: ".ignore",  // Selectors that do not lead to dragging (String or Function)
        animation: 0,
        dataIdAttr: 'data-id',
        onStart: function (evt) {
            $(".list-group-item").removeClass("active");
        },
        onEnd: function (evt) {
            $(evt.item).addClass("active");
        },
    });
    //用于table布局下排序
    var sort = {};
    sort.orgin = <%=Newtonsoft.Json.JsonConvert.SerializeObject(dt)%>;
    sort.up = function (dom) {
        var $item = $(dom).closest(".list-group-item");
        if (!$item.hasClass("active")) {
            $(".list-group-item").removeClass("active");
            $item.addClass("active");
        }
        //1.直接交换位置,是否会造成排序不正常
        var $pre = $item.prev(".list-group-item");
        if ($pre.length > 0) {
            $pre.before($item);
        }
    }
    sort.down = function (dom) {
        var $item = $(dom).closest(".list-group-item");
        if (!$item.hasClass("active")) {
            $(".list-group-item").removeClass("active");
            $item.addClass("active");
        }
        //1.直接交换位置,是否会造成排序不正常
        var $next = $item.next(".list-group-item");
        if ($next.length > 0) {
            $next.after($item);
        }
    }
    sort.save=function(){
        //导出排序后的orderid数组
        var array=sortTable.toArray();
        var orderStr="";
        for (var i = 0; i < array.length; i++) {
            orderStr+=array[i]+":"+sort.orgin[i].order+",";
        }
        $.post("?action=save&tbname=<%:TbName%>",{"orderStr":orderStr},function(data){
            alert("排序保存成功");
            if(parent.sort_callback){parent.sort_callback();}
        })
    }
    //重新从1开始生成序列号(根据tr顺序)
    sort.reorder = function () {
            var $trs = $(".order_tr");
            for (var i = 0; i < $trs.length; i++) {
                $($trs[i]).find(".order_t").val((i + 1));
            }
        }
</script>
</asp:Content>