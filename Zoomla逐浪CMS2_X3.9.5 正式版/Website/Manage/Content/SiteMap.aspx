<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteMap.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.SiteMap" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>站点地图</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ContentManage.aspx","内容管理"),
		new Bread("/{manage}/Content/CreateHtmlContent.aspx","生成发布"),
	new Bread() {url="/{manage}/Content/SiteMap.aspx", text="站点地图",addon="" }}
	)
%>
<asp:Label ID="Label1" runat="server" Text=""><br /></asp:Label>
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-striped table-bordered">
	<tr>
		<td colspan="2" class="text-center">
			<a href='http://www.google.com/webmasters/sitemaps/login' target='_blank'>
				<i class="zi zi_paw" zico="宠物黑"></i> 生成符合GOOGLE规范的XML格式地图页面
            </a>
		</td>
	</tr>
	<tr>
        <th class="td_m">更新频率：</th>
		<td>
			
			<asp:DropDownList ID="DropDownList1" runat="server">
				<asp:ListItem Value="always">频繁的更新</asp:ListItem>
				<asp:ListItem Value="hourly">每小时更新</asp:ListItem>
				<asp:ListItem Value="daily" Selected="selected">每日更新</asp:ListItem>
				<asp:ListItem Value="weekly">每周更新</asp:ListItem>
				<asp:ListItem Value="monthly">每月更新</asp:ListItem>
				<asp:ListItem Value="yearly">每年更新</asp:ListItem>
				<asp:ListItem Value="never">从不更新</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
	<tr>
        <th>每个系统调用：</th>
		<td>
			
			<asp:TextBox ID="TextBox1" runat="server" class="l_input">5</asp:TextBox>
			条信息内容为最高注意度
		</td>
	</tr>
	<tr>
        <th>注 意 度：</th>
		<td>
			<asp:TextBox ID="TextBox2" class="l_input" runat="server" Text="0.5"></asp:TextBox> 0-1.0之间,推荐使用默认值
		</td>
	</tr>
    <tr>
        <td colspan="2" class="text-center">
            <asp:Button ID="Google_Btn" runat="server" Text="开始生成网站地图" class="C_input btn btn-outline-info" OnClick="Google_Btn_Click" />
        </td>
    </tr>
	<tr>
		<td colspan="2" class="text-center">
<a href="http://news.baidu.com/newsop.html#kg" target="_blank">
				<i class="zi zi_paw" zico="宠物黑"></i> 生成符合百度XML格式的开放新闻协议
			</a>
		</td>
	</tr>
	<tr>
        <th>更新周期：</th>
		<td>
			<asp:TextBox ID="changefreq" class="l_input" runat="server">15</asp:TextBox>分钟
		</td>
	</tr>
	<tr>
        <th>每个系统调用：</th>
		<td><asp:TextBox ID="prioritynum" class="l_input" runat="server">50</asp:TextBox>条信息内容为最高注意度(最多100条)</td>
	</tr>
    <tr><td colspan="2" class="text-center">
        <asp:Button ID="Baidu_Btn" runat="server" Text="开始生成网站地图" class="C_input btn btn-outline-info" OnClick="Baidu_Btn_Click" />
        </td></tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>