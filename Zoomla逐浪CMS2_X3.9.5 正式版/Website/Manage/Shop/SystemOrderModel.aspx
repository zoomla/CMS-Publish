<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemOrderModel.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.SystemOrderModel"  MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
 <title>订单参数</title>
 	<%=Call.SetBread( new Bread[] {
	new Bread("ProductManage.aspx","商城管理"),
	new Bread("OrderList.aspx","订单管理"),
	new Bread(){url="", text="字段管理<a id='ShowLink' href='javascript:ShowList()'> [显示所有字段]</a><a class='text-danger' href='AddOrderModel.aspx?Type="+SType+"'> [添加字段]</a>"}
}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
  <table id="EGV" class="table table-striped table-bordered table-hover">
      <tr>
          <th class="w12rem_lg">
              <strong>字段名</strong>
          </th>
          <th scope="row">
              <strong>字段别名</strong>
          </th>
          <th scope="row">
              <strong>字段类型</strong>
          </th>
          <th scope="row">
              <strong>字段级别</strong>
          </th>
          <th scope="row">
              <strong>是否必填</strong>
          </th>
          <th scope="row">
              <strong>排序</strong>
          </th>
          <th scope="row">
              <strong>操作</strong>
          </th>
      </tr>
        <asp:Repeater ID="RepSystemModel" runat="server">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("FieldName")%></td>
                    <td><%#Eval("FieldAlias")%></td>
                    <td><%# Eval("FieldType", "{0}")%></td>
                    <td ><span style="color: #339900">系统</span></td>
                    <td ><%# GetStyleTrue(Eval("IsNotNull", "{0}"))%></td>
                    <td></td>
                    <td ></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <asp:Repeater ID="RepModelField" runat="server" OnItemCommand="Repeater1_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td><%#Eval("FieldName")%></td>
                    <td><%#Eval("FieldAlias")%></td>
                    <td><%# GetFieldType(Eval("FieldType", "{0}").ToString ())%></td>
                    <td>自定义</td>
                    <td><%# GetStyleTrue(Eval("IsNotNull", "{0}"))%></td>
                    <td>
                        <input type="hidden" name="fid_hid" value="<%# Eval("FieldID") %>" />
                        <asp:LinkButton ID="LinkButton2" runat="server" CommandName="UpMove" CommandArgument='<%# Eval("FieldID") %>'><i class="zi zi_arrowUp" title="上移"></i>上移</asp:LinkButton>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DownMove" CommandArgument='<%# Eval("FieldID") %>'><i class="zi zi_arrowDown" title="下移"></i>下移</asp:LinkButton>
                    </td>
                    <td >
                        <a href="ModifySysOrderField.aspx?FieldID=<%# Eval("FieldID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("FieldID") %>' OnClientClick="return confirm('确定删除此字段吗?')" ><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $().ready(function () {
            $("#EGV tr").dblclick(function () {
                var id = $(this).find("[name=fid_hid]").val();
                if (id) {
                    location = "ModifySysOrderField.aspx?FieldID=" + id;
                }
            });
        })
        window.onload = function ()
        {
            $("#EGV tr td:contains('系统')").parent().hide();
        }
        function ShowList() {
            $("#EGV tr td:contains('系统')").parent().toggle();
            $("#ShowLink").text($("#ShowLink").text() == "[显示所有字段]" ? "[隐藏系统字段]" : "[显示所有字段]");
        }
    </script>
</asp:Content>