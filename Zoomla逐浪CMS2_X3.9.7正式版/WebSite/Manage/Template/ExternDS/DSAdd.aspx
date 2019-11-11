<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DSAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.ExternDS.DSAdd" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.数据源管理 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx",Resources.L.工作台),		
		new Bread("/{manage}/Config/SiteInfo.aspx",Resources.L.系统设置),		
		new Bread("DSList.aspx",Resources.L.数据源列表),		
        new Bread() {url="", text=Resources.L.数据源管理,addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-striped table-bordered table-hover sys_table">
    <tr>
        <th class="w12rem_lg"><%=Resources.L.名称 %></th>
        <td>
            <ZL:TextBox ID="DSName" runat="server" CssClass="form-control max20rem" AllowEmpty="false" />
        </td>
    </tr>
    <tr>
        <th><%=Resources.L.类型 %></th>
        <td>
            <asp:DropDownList ID="DataSource_DP" CssClass=" form-control max20rem" runat="server" OnSelectedIndexChanged="DataSource_DP_SIChanged" AutoPostBack="true">
                <asp:ListItem Value="mssql" Text="<%$Resources:L,SQL数据库 %>"></asp:ListItem>
                <asp:ListItem Value="mysql" Text="<%$Resources:L,MYSQL数据库 %>"></asp:ListItem>
                <asp:ListItem Value="oracle" Text="<%$Resources:L,Oracle数据库 %>"></asp:ListItem>
                <asp:ListItem Value="access" Text="<%$Resources:L,Access数据库 %>"></asp:ListItem>
<%--                <asp:ListItem Value="xml" >XML</asp:ListItem>--%>
                <asp:ListItem Value="excel">Excel</asp:ListItem>
            </asp:DropDownList></td>
        <asp:HiddenField runat="server" ID="LastIndex_Hid" Value="1" />
    </tr>
    <tr>
        <th><%=Resources.L.描述 %></th>
        <td>
            <asp:TextBox ID="Remind_T" CssClass="form-control max20rem" runat="server" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <th><%=Resources.L.连接字符串 %> </th>
        <td>
            <asp:TextBox ID="DBConnectText" class="form-control" runat="server" Text="Data Source=(local);Initial Catalog=test;User ID=test;Password=test" />
            <asp:RequiredFieldValidator ID="RF1" runat="server" ControlToValidate="DBConnectText" ErrorMessage="连接字符串不能为空!" CssClass="tips" SetFocusOnError="True" Display="Dynamic" />
        </td>
    </tr>
    <tr><th><%=Resources.L.测试结果 %></th><td><asp:Literal runat="server" ID="TestResult_L" EnableViewState="false"></asp:Literal></td></tr>
    <tr>
        <th><%=Resources.L.操作 %></th>
        <td>
            <asp:Button ID="Test_Btn" runat="server" CssClass="btn btn-outline-info" Text="<%$Resources:L,测试连接 %>" OnClick="Test_Btn_Click" />
            <asp:Button ID="Save_Btn" runat="server" CssClass="btn btn-outline-info" Text="<%$Resources:L,保存连接 %>" OnClick="Save_Btn_Click" />
            <a href="DSList.aspx" class="btn btn-outline-info mt-2"><%=Resources.L.返回列表 %></a>
        </td>
    </tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>