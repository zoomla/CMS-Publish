<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetFieldRemind.aspx.cs" Inherits="ZoomLaCMS.Tools.dbdic.SetFieldRemind" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据字典管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr>
            <td width="8%">表名</td>
            <td width="8%">字段名</td>
            <td>字段说明 <asp:CheckBox runat="server" ID="Filter_Chk" Text="显示所有字段" AutoPostBack="true" OnCheckedChanged="Filter_Chk_CheckedChanged" /></td>
        </tr>
        <asp:Repeater runat="server" ID="Field_RPT">
            <ItemTemplate>
                <tr <%# Eval("name","").ToLower().Equals("id")?"hidden":"" %> >
                    <td><%#Eval("tbname") %></td>
                    <td><%#Eval("name") %></td>
                    <td>
                        <input type="text" class="form-control" value="<%#Eval("value") %>" autocomplete="off" onchange="updateFieldComment('<%#Eval("tbname") %>','<%#Eval("name") %>',$(this).val());" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
        <tr>
            <td colspan="3" class="text-center"><a href="javascript:;" onclick="parent.diag.CloseModal();" class="btn btn-info">关闭</a></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        function updateFieldComment(tbname, field, remind) {
            $.post("", { action: "field_remind", tbname: tbname, field: field, remind: remind }, function (data) {
                console.log("field_remind", data);
            });
        }
    </script>
</asp:Content>
