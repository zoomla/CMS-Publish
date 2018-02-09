<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupPro.aspx.cs" Inherits="ZoomLaCMS.Common.Comp.GroupPro" EnableViewState="false" %>
<div runat="server" id="data_div" visible="false">
    <table class="table table-bordered table-striped">
    <tr><td>商品图</td><td>商品名称</td><td>短名称</td><td>价格</td><td>操作</td></tr>
<asp:Repeater runat="server" ID="GroupPro_RPT" EnableViewState="false">
    <ItemTemplate>
        <tr id="grouppro_tr_<%#Eval("ID") %>">
            <td><img src="<%#ZoomLa.Common.function.GetImgUrl(Eval("Thumbnails")) %>" onerror="shownopic(this);" style="width:50px;height:50px;" /></td>
            <td><%#Eval("Proname") %></td>
            <td><%#Eval("ShortProname") %></td>
            <td><%#Eval("LinPrice","{0:f2}") %></td>
            <td>
                <a href="AddProduct?ID=<%#Eval("ID") %>">修改</a>
                <a href="javascript:;" onclick="grouppro.del('<%#Eval("ID") %>',function(){$('#grouppro_tr_<%#Eval("ID") %>').remove();});">移除</a>
            </td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</table>
</div>
<div class="alert alert-info" runat="server" id="empty_div"></div>
<script>
    //单品促销
    var grouppro = {};
    grouppro.del = function (id, callback) {
        $.post("/common/comp/GroupPro.aspx?action=del&proid=" + id, {}, function (data) {
            if (callback) { callback(data); }
        });
    }
</script>