<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="CollectionStatus.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.CollectionStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"><title><%=Resources.L.采集状态 %></title></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<%=Call.SetBread(new Bread[] {
	new Bread("../ContentManage.aspx",Resources.L.内容管理),
	new Bread("/{manage}/Content/Collect/CollectionManage.aspx",Resources.L.信息采集),
	new Bread() {url="/{manage}/Content/Collect/CollectionStatus.aspx", text=Resources.L.采集状态 ,addon="" }}
	)
%>

<div id="log_div" style="height:500px;border:1px solid #ddd;overflow-y:auto;"></div>
<div class="text-center m-3">
    <input type="button" value="<%=Resources.L.停止采集 %>" class="btn btn-outline-danger" onclick="stopWork();" />
</div>
<div class="alert alert-success ">
    <label><%=Resources.L.Collect_notice %><br /></label>
    <label><%=Resources.L.Collect_help %></label><br />
    <span><%=Resources.L.Collect_empty %></span><br />
    <span><%=Resources.L.Collect_success %></span><br />
    <span><%=Resources.L.Collect_odd %></span><br />
</div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
$(function () {
    setInterval(function () {
        $.post("CollectionStatus.aspx?action=getlog", {}, function (data) {
            if (data != "") {
                var list = JSON.parse(data);
                for (var i = 0; i < list.length; i++) {
                    list[i].cdate = list[i].cdate.replace("T", " ").split('.')[0];
                }
                var tlp = '<div class="item mb-1 log@logType">[@cdate] @msg</div>';
                var $items = JsonHelper.FillItem(tlp, list);
                $("#log_div").append($items);
            }
        });
    }, 1000);
})
function stopWork() {
    if (!confirm("确定要停止采集工作吗")) { return; }
    $.post("CollectionStatus.aspx?action=stop", {}, function () { });
    alert("已向服务端发送停止信号,请等待正在处理的记录完成");
}
</script>
</asp:Content>