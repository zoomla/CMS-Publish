<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="ZoomLaCMS.Common.Comp.UserList" %>
<table class="table table-bordered table-striped margin_t5">
    <tr>
        <td style="width:60px;">ID</td>
        <td style="width:70px;">头像</td>
        <td>用户名</td>
        <td>昵称</td>
        <td style="width:100px;">操作</td>
    </tr>
        <asp:Repeater runat="server" ID="User_RPT">
            <ItemTemplate>
                <tr id="ulist_<%#Eval("UserID") %>">
                    <td><%#Eval("UserID") %></td>
                    <td><img src="<%#Eval("UserFace") %>" onerror="shownoface(this);" style="width:50px;height:50px;border-radius:50%;"/></td>
                    <td><%#Eval("UserName") %></td>
                    <td><%#Eval("HoneyName") %></td>
                    <td><a href="javascript:;" onclick="<%#del+"(this,"+Eval("UserID")+")"%>;"><i class="fa fa-trash-o"></i></a></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
</table>