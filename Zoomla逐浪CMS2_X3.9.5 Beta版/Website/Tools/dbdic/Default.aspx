<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Tools.dbdic.Default" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据字典管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="container">
        <div style="text-align: center; margin-bottom: 15px;">
            <h1><i class="fa fa-database"></i> 数据字典管理</h1>
        </div>
        <table class="table table-bordered table-striped">
            <tr>
                <td style="width: 120px;">表名</td>
                <td>表说明 
                    <asp:CheckBox runat="server" Text="仅显示无备注表" ID="Filter_Chk" OnCheckedChanged="Filter_Chk_CheckedChanged" AutoPostBack="true" />
                    <asp:Button runat="server" ID="WriteToDList_Btn" Text="写入DataList" OnClick="WriteToDList_Btn_Click" class="btn btn-info" />
                </td>
            </tr>
            <asp:Repeater runat="server" ID="AllTable_RPT">
                <ItemTemplate>
                    <tr>
                        <td style="width: 120px;"><a href="javascript:;" title="编辑字段说明" onclick="showfield('<%#Eval("name") %>');"><%#Eval("name") %></a></td>
                        <td>
                            <input type="text" class="form-control" value="<%#Eval("value") %>" onchange="updateTableComment('<%#Eval("name") %>',$(this).val());" />
                            <%--<div class="margin_t5"><input type="button" value="更新注释" onclick="" /></div>--%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        function updateTableComment(tbname, remind) {
            $.post("", { action: "table_remind", tbname: tbname, remind: remind }, function (data) {
                console.log("table_remind", data);
            });
        }
        function updateFieldComment(tbname, field, remind) {
            $.post("", { action: "field_remind", tbname: tbname, field: field, remind: remind }, function (data) {
                console.log("field_remind", data);
            });
        }
        var diag = new ZL_Dialog();
        function showfield(tbname) {
            diag.url = "SetFieldRemind.aspx?tbname=" + tbname;
            diag.title = "编辑表字段说明";
            diag.maxbtn = false;
            diag.ShowModal();
        }
    </script>
</asp:Content>
