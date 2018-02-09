<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserByList.aspx.cs" Inherits="ZoomLaCMS.Office.Comp.UserByList" EnableViewState="false" %>
<table class="table table-bordered table-striped" style="font-size:12px;">
    <tr><td style="width:50px;">ID</td><td style="width:120px;">部门</td><td>用户名</td><td style="width:120px;">姓名</td><td style="width:80px;">操作</td></tr>
    <asp:Repeater runat="server" ID="RPT" EnableViewState="false">
        <ItemTemplate>
            <tr>
                <td><%#Eval("UserID") %></td>
                <td><%#Eval("StrName") %></td>
                <td><%#Eval("UserName") %></td>
                <td><%#Eval("HoneyName") %></td>
                <td><a href="javascript:;" onclick="<%#del+"(this,"+Eval("UserID")+")"%>;"><i class="fa fa-trash-o"></i></a></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>