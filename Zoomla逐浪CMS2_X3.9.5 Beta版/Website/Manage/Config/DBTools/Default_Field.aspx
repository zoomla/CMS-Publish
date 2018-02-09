<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default_Field.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DBTools.Default_Field" EnableViewState="false" %>

<%--<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>--%>
    <form id="form1" runat="server">
<table class="table table-bordered table-striped">
    <tr>
        <td class="td_s">序号</td>
        <td>字段名</td>
        <td>类型</td>
        <td>长度</td>
        <td>允许空</td>
        <td>默认值</td>
        <td>操作</td>
    </tr>
    <asp:Repeater runat="server" ID="RPT">
        <ItemTemplate>
            <tr>
                <td><%#Eval("字段序号") %></td>
                <td>
                    <%#Eval("字段名") %>
                    <%#string.IsNullOrEmpty(Eval("主键",""))?"" :"<i class='fa fa-key' style='color:#c2a710;' title='主键'></i>"%>
                </td>
                <td>
                    <input type="text" value="<%#Eval("类型") %>" data-init="<%#Eval("类型") %>" class="form-control text_md" id="field_type_<%#Eval("字段名") %>"/>
                </td>
                <td><input type="text" value="<%#Eval("长度") %>" data-init="<%#Eval("长度") %>" class="form-control text_s" id="field_len_<%#Eval("字段名") %>"/></td>
                <td><%#Eval("允许空") %></td>
                <td><%#Eval("默认值") %></td>
                <td>
                    <button type="button"  class="btn btn-info" onclick="dbtool.field.update('<%#Eval("字段名") %>');">更新</button>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
    </form>
<%--</body>
</html>--%>
