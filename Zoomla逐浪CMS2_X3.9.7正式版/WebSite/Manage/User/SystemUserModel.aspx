<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemUserModel.aspx.cs" Inherits="ZoomLaCMS.Manage.User.SystemUserModel"   MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>会员模型字段列表</title>
<%=Call.SetBread(new Bread[] {
        new Bread("UserManage.aspx","用户管理"),
        new Bread("UserManage.aspx","会员管理"),
        new Bread() {url="", text="注册字段管理 [<a href='javascript:;' onclick='ShowList();''>显示所有字段</a>] [<a href='../Content/Model/AddModelField.aspx?ModelID=-1&ModelType=9'>添加字段</a>]",addon= "" }},
        Call.GetHelp(106)
        )
    %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table id="FieldList" class="table table-striped table-bordered table-hover">
    <tr class="gridtitle">
      <th scope="col"><strong><%=Resources.L.字段名 %></strong></th>
      <th scope="col"><strong><%=Resources.L.字段别名 %></strong></th>
      <th scope="col"><strong><%=Resources.L.字段类型 %></strong></th>
      <th scope="col"><strong><%=Resources.L.字段级别 %></strong></th>
      <th scope="col"><strong><%=Resources.L.是否必填 %></strong></th>
      <th scope="col"><strong><%=Resources.L.排序 %></strong></th>
      <th scope="col"><strong><%=Resources.L.操作 %></strong></th>
    </tr>
    <asp:Repeater ID="RepSystemModel" runat="server">
      <ItemTemplate>
        <tr style="text-align:center;">
          <td><%#Eval("FieldName")%></td>
          <td align="center"><%#Eval("FieldAlias")%></td>
          <td align="center"><%# Eval("FieldType", "{0}")%></td>
          <td align="center"><span class="text-success"><%=Resources.L.系统 %></span></td>
          <td align="center"><%# GetStyleTrue(Eval("IsNotNull", "{0}"))%></td>
          <td></td>
          <td align="center"></td>
        </tr>
      </ItemTemplate>
    </asp:Repeater>
    <asp:Repeater ID="RepModelField" runat="server" OnItemCommand="Repeater1_ItemCommand">
      <ItemTemplate>
          <tr style="text-align: center;" ondblclick="editField('<%# Eval("FieldID") %>');">
              <td><%#Eval("FieldName")%></td>
              <td align="center"><%#Eval("FieldAlias")%></td>
              <td align="center"><%# GetFieldType(Eval("FieldType", "{0}").ToString ())%></td>
              <td align="center"><%=Resources.L.自定义 %> </td>
              <td align="center"><%# GetStyleTrue(Eval("IsNotNull", "{0}"))%></td>
              <td align="center">
                  <asp:LinkButton ID="LinkButton2" runat="server" CommandName="UpMove" CommandArgument='<%# Eval("FieldID") %>' CssClass="option_style"><i class="zi zi_arrowUp" zico="指上长箭头"></i>上移</asp:LinkButton>
                  <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DownMove" CommandArgument='<%# Eval("FieldID") %>' CssClass="option_style">下移<i class="zi zi_arrowDown" zico="指下长箭头"></i></asp:LinkButton></td>
              <td align="center">
                  <a href="javascript:;" onclick="editField('<%# Eval("FieldID") %>');" class="option_style"><i class="zi zi_pencilalt" zico="笔黑"></i></a>
                  <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" CommandArgument='<%# Eval("FieldID") %>' OnClientClick="return confirm('确定删除此字段吗?')" CssClass="option_style"><i class="zi zi_trashalt" zico="垃圾箱竖条"></i>删除</asp:LinkButton></td>
          </tr>
      </ItemTemplate>
    </asp:Repeater>
  </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/Common.js"></script>
<script>
    window.onload = function () {
        var FiledListTable = document.getElementById("FieldList");
        for (var i = 0; i < FiledListTable.rows.length; i++) {
            var FiledLevel = FiledListTable.rows[i].cells[3];
            if (FiledLevel.innerText.Trim() == "<%=Resources.L.系统 %>") {
                FiledListTable.rows[i].style.display = "none";
            }
            else {
                FiledListTable.rows[i].style.display = "";
            }
        }
    }
    function ShowList() {
        var FiledListTable = document.getElementById("FieldList");
        for (var i = 0; i < FiledListTable.rows.length; i++) {
            var FiledLevel = FiledListTable.rows[i].cells[3];
            if (FiledLevel.innerHTML.indexOf("<%=Resources.L.系统 %>") != -1 && FiledListTable.rows[i].style.display == "none") {
                FiledListTable.rows[i].style.display = "";
				$("#ShowLink").val("[<%=Resources.L.隐藏系统字段 %>]");
            }
            else if (FiledLevel.innerHTML.indexOf("<%=Resources.L.系统 %>") != -1 && FiledListTable.rows[i].style.display == "") {
				
                FiledListTable.rows[i].style.display = "none";
				$("#ShowLink").val("[<%=Resources.L.显示所有字段 %>]");
            }
        }
    }
    function editField(field)
    {
        location = "../Content/Model/AddModelField.aspx?ModelID=-1&ModelType=9&FieldID=" + field;
    }
</script>
</asp:Content>