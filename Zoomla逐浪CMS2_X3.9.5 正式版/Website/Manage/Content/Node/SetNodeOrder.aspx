<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetNodeOrder.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.SetNodeOrder" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>节点排序</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","系统设置"),
        new Bread() {url="", text="节点管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0"><div class="row sysRow list_choice table-responsive-md">
<table class="table table-striped table-bordered">
	<tr>
		<th scope="row">
			<strong>节点ID</strong>
		</th>
		<th scope="row">
			<strong>节点名</strong>
		</th>
		<th scope="row">
			<strong>节点目录</strong>
		</th>
		<th scope="row">
			<strong>节点类型</strong>
		</th>
        <th scope="row">
			<strong>手动排序</strong>
		</th>
		<th scope="row">
			<strong>排序</strong>
		</th>
	</tr>
	<asp:Repeater ID="RepSystemModel" runat="server" OnItemCommand="Repeater1_ItemCommand">
		<ItemTemplate>
			<tr class="order_tr" id="tr_<%#Eval("NodeID") %>">
				<td class="text-center">
					<%#Eval("NodeID")%>
				</td>
				<td class="text-center">
					<%#Eval("NodeName")%>
				</td>
				<td class="text-center">
					<%# Eval("NodeDir")%>
				</td>
				<td class="text-center">
					<%# GetNodeType(Eval("NodeType", "{0}"))%>
				</td>
                <td class="text-center">
                    <input type="text" class="order_t" style="width:40px; text-align:center" name="OrderField<%#Eval("NodeID")%>" id="OrderField<%#Eval("NodeID")%>" value="<%#Eval("OrderID") %>" />
                    <input type="hidden" name="NodeIDValue" id="NodeIDValue" value="<%#Eval("NodeID")%>" />
				</td>
				<td class="text-center">
                    <a href="javascript:;" onclick="sort.up('<%#Eval("NodeID") %>');"><i class="zi zi_longarrowaltup"></i> 上移</a>
                    |
                    <a href="javascript:;" onclick="sort.down('<%#Eval("NodeID") %>');"><i class="zi zi_longarrowaltdown"></i> 下移</a>
				</td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
</table>
</div></div>
	<div class="alert alert-light">
    <asp:Button ID="Button1" runat="server" Text="批量更新排序" CssClass="btn btn-info" onclick="Button1_Click" />
    <input type="button" value="整理序列号" class="btn btn-info" onclick="sort.reorder();" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    //用于table布局下排序
    var sort = {};
    sort.up = function (id) {
        var $tr = $("#tr_" + id);
        var $pre = $tr.prev(".order_tr");
        if ($pre.length > 0) {
            //交换orderID和位置
            var temp = sort.getorder($tr);
            sort.setorder($tr, sort.getorder($pre));
            sort.setorder($pre, temp);
            $pre.before($tr);
        }
    }
    sort.down = function (id) {
        var $tr = $("#tr_" + id);
        var $next = $tr.next(".order_tr");
        if ($next.length > 0) {
            //交换orderID和位置
            var temp = sort.getorder($tr);
            sort.setorder($tr, sort.getorder($next));
            sort.setorder($next, temp);
            $next.after($tr);
        }
    }
    //重新从1开始生成序列号(根据tr顺序)
    sort.reorder = function () {
        var $trs = $(".order_tr");
        for (var i = 0; i < $trs.length; i++) {
            $($trs[i]).find(".order_t").val((i + 1));
        }
    }
    sort.getorder = function ($tr) {
        return $tr.find(".order_t").val();
    }
    sort.setorder = function ($tr, order) {
        $tr.find(".order_t").val(order);
    }
</script>
</asp:Content>