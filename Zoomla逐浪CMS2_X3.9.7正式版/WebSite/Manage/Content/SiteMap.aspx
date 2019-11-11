<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.SiteMap" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title><%=Resources.L.站点地图 %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx",Resources.L.工作台),
        new Bread("ContentManage.aspx",Resources.L.内容管理),
		new Bread("/{manage}/Content/CreateHtmlContent.aspx",Resources.L.生成发布),
	new Bread() {url="/{manage}/Content/SiteMap.aspx", text=Resources.L.站点地图,addon="" }}
	)
%>
<asp:Label ID="Label1" runat="server" Text=""><br /></asp:Label>
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-striped table-bordered">
	<tr>
		<td colspan="2" class="text-center">
			<a href='http://www.google.com/webmasters/sitemaps/login' target='_blank'>
				<i class="zi zi_paw" zico="宠物黑"></i> <%=Resources.L.生成符合GOOGLE规范 %>
            </a>
		</td>
	</tr>
	<tr>
        <th class="td_m"><%=Resources.L.更新频率 %> ：</th>
		<td>
			
			<asp:DropDownList ID="DropDownList1" runat="server">
				<asp:ListItem Value="always" Text="<%$Resources:L,频繁的更新 %>"></asp:ListItem>
				<asp:ListItem Value="hourly" Text="<%$Resources:L,每小时更新 %>"></asp:ListItem>
				<asp:ListItem Value="daily" Selected="selected" Text="<%$Resources:L,每日更新 %>"></asp:ListItem>
				<asp:ListItem Value="weekly" Text="<%$Resources:L,每周更新 %>"></asp:ListItem>
				<asp:ListItem Value="monthly" Text="<%$Resources:L,每月更新 %>"></asp:ListItem>
				<asp:ListItem Value="yearly" Text="<%$Resources:L,每年更新 %>"></asp:ListItem>
				<asp:ListItem Value="never" Text="<%$Resources:L,从不更新 %>"></asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
	<tr>
        <th><%=Resources.L.每个系统调用 %> ：</th>
		<td>
			
			<asp:TextBox ID="TextBox1" runat="server" class="l_input">5</asp:TextBox>
			<%=Resources.L.条信息内容为最高 %>
		</td>
	</tr>
	<tr>
        <th><%=Resources.L.注意度 %> ：</th>
		<td>
			<asp:TextBox ID="TextBox2" class="l_input" runat="server" Text="0.5"></asp:TextBox> <%=Resources.L.注意度_notice %>
		</td>
	</tr>
    <tr>
        <td colspan="2" class="text-center">
            <asp:Button ID="Google_Btn" runat="server" Text="<%$Resources:L,开始生成网站地图 %>" class="C_input btn btn-outline-info" OnClick="Google_Btn_Click" />
        </td>
    </tr>
	<tr>
		<td colspan="2" class="text-center">
<a href="http://news.baidu.com/newsop.html#kg" target="_blank">
				<i class="zi zi_paw" zico="宠物黑"></i> <%=Resources.L.生成符合百度XML格式 %>
			</a>
		</td>
	</tr>
	<tr>
        <th><%=Resources.L.更新周期 %> ：</th>
		<td>
			<asp:TextBox ID="changefreq" class="l_input" runat="server">15</asp:TextBox><%=Resources.L.分钟 %>
		</td>
	</tr>
	<tr>
        <th><%=Resources.L.每个系统调用 %> ：</th>
		<td><asp:TextBox ID="prioritynum" class="l_input" runat="server">50</asp:TextBox><%=Resources.L.条信息内容为最 %></td>
	</tr>
    <tr><td colspan="2" class="text-center">
        <asp:Button ID="Baidu_Btn" runat="server" Text="<%$Resources:L,开始生成网站地图 %>" class="C_input btn btn-outline-info" OnClick="Baidu_Btn_Click" />
        </td></tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>