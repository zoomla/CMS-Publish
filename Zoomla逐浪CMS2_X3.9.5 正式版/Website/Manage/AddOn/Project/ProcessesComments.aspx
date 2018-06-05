<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcessesComments.aspx.cs" MasterPageFile="~/Manage/I/Index.Master" Inherits="ZoomLaCMS.Manage.AddOn.Project.ProcessesComments" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>项目评论</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
new Bread("admin"),
new Bread("/{manage}/AddOn/Project/Projects.aspx","项目管理"),
new Bread(Request.RawUrl,"评论管理")

}) %>

<table class="table list_choice table-bordered table-responsive">
	<tbody>
		<asp:Repeater ID="RpComments" runat="server" 
			onitemcommand="RpComments_ItemCommand">
			<ItemTemplate>
				<tr>
					<td width="10%" align="right" style=" background-color:#e7f7e7"><asp:Label ID="Label1" runat="server" visible="false" Text='<%#Eval("CommentsID")%>'></asp:Label><asp:CheckBox ID="ChkBox" runat="server" /><strong>评分：</strong></td>
					<td width="5%" align="left">
						<asp:Label ID="lblRating" runat="server" Text=""></asp:Label>
					<td width="5%" align="right" style=" background-color:#e7f7e7"><strong>作者：</strong></td>
					<td width="7%">
						<asp:Label ID="lblUser" runat="server" Text=""></asp:Label>
					<td width="5%" align="right" style=" background-color:#e7f7e7"><strong>时间：</strong></td>
					<td width="15%"><%# Eval("CommentsDate")%></td>
					<td width="40%"><asp:LinkButton ID="LBtn" runat="server" OnClientClick="return confirm('你确定要永久删除吗？');" CommandArgument=<%#Eval("CommentsID") %>>删除</asp:LinkButton></td>
				</tr>
				<tr>
					<td align="right" style=" background-color:#e7f7e7"><strong>内容：</strong></td>
					<td  colspan=6 align="left"><%#Eval("Content") %></td>
				</tr>
			</ItemTemplate>
		</asp:Repeater>
	</tbody>
</table>
<table class="table table-bordered">
	<tbody>
		<tr>
			<td class="td_m">项目名称：</td>
			<td><asp:Label ID="TxtProjectName" runat="server" /></td>
		</tr>
		<tr>
			<td>流程名称：</td>
			<td><asp:Label ID="TxtProcessName" runat="server"/></td>
		</tr>
		<tr>
			<td>评分：</td>
			<td>
                <asp:TextBox ID="TxtRating" class="form-control text_300" runat="server" />
                <div>
                    <small>给该项目/流程打分，请输入0-100间的数字</small>
                </div>
				<asp:RangeValidator ID="RVRating" runat="server" ControlToValidate="TxtRating" 
					Display="Dynamic" ErrorMessage="RangeValidator" MaximumValue="100" 
					MinimumValue="0" Type="Integer">请输入数字范围0-100</asp:RangeValidator>
			</td>
		</tr>
		<tr>
			<td><strong>项目评价：</strong></td>
			<td>
				<asp:TextBox ID="TxtContent" class="form-control" runat="server" Height="82px" TextMode="MultiLine" Width="381px" />
			</td>
		</tr>
        <tr><td></td><td>
            <asp:Button ID="BtnCommit" runat="server" Text="评论" class="btn btn-info" OnClick="BtnCommit_Click" />
            <asp:Button ID="BtnBack" runat="server" Text="返回" class="btn btn-info" OnClick="BtnBack_Click" />
                     </td></tr>
	</table>

</asp:Content>

