<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOutLink.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.AddOutLink" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加外部链接</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("../Config/SiteOption.aspx","系统设置"),
        new Bread("NodeManage.aspx","节点管理"),
        new Bread() {url="", text="添加外部链接",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-striped table-bordered table-hover sys_table">
	<tr align="center">
		<th scope="col" class="spacingtitle text-center" colspan="2">
			<asp:Label ID="LblTitle" runat="server" Text="添加外部链接" />
		</th>
	</tr>
	<tr class="tdbg">
		<th scope="col" class="w12rem_lg" scope="row">
			<strong>所属节点</strong>
		</th>
		<td scope="col">&nbsp;<asp:Label ID="LblNodeName" runat="server" Text=""></asp:Label><asp:HiddenField ID="HdnParentId" Value="0" runat="server" />
			<asp:HiddenField ID="HdnDepth" Value="0" runat="server" />
			<asp:HiddenField ID="HdnOrderID" Value="0" runat="server" />
			<asp:HiddenField ID="HdnNodeID" Value="0" runat="server" />
		</td>
	</tr>
	<tr class="tdbg">
		<th scope="row">
			<strong>外部链接名称</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtNodeName" class="form-control pull-left max20rem"  runat="server" />
			<asp:RequiredFieldValidator ID="ValrNodeName" CssClass="tips" runat="server" ErrorMessage="单页名称不能为空！" ControlToValidate="TxtNodeName" Display="Dynamic" SetFocusOnError="True" />
		</td>
	</tr>
	<tr class="tdbg">
		<th scope="row">
			<strong>单页标识符</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtNodeDir" class="form-control pull-left max20rem"  runat="server" />
			<asp:RequiredFieldValidator ID="ValrNodeIdentifier" runat="server" CssClass="tips" ForeColor="Red" ErrorMessage="标识符不能为空！" ControlToValidate="TxtNodeDir" Display="Dynamic" SetFocusOnError="True" />
		</td>
	</tr>
	<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<th scope="row">
			<strong>外部链接地址</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtNodeUrl" class="form-control pull-left max20rem"  runat="server" />
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="tips" ForeColor="Red" runat="server" ErrorMessage="链接地址不能为空！" ControlToValidate="TxtNodeUrl" Display="Dynamic" SetFocusOnError="True" />
		</td>
	</tr>
	<tr class="tdbg">
		<th scope="row">
			<strong>打开方式</strong>
		</th>
		<td>
			<asp:RadioButtonList ID="RBLOpenType" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
				<asp:ListItem Value="1">新窗口打开</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<th scope="row">
			<strong>外部链接图片地址</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtNodePicUrl" class="form-control pull-left max20rem"  runat="server" Columns="50"></asp:TextBox>
		</td>
	</tr>
	<tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
		<th  scope="row">
			<strong>外部链接提示</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtTips" class="form-control pull-left max20rem"  runat="server" Columns="60" Height="68px" Rows="2" TextMode="MultiLine"></asp:TextBox>
		</td>
	</tr>
</table>
</div>
</div>
<div>
    <asp:Button ID="EBtnSubmit" class="btn btn-info" Text="保存" OnClick="EBtnSubmit_Click" runat="server" />
		<a href="NodeManage.aspx" class="btn btn-out"/>
</div>
<script src="/JS/chinese.js"></script>
<script type="text/javascript">
    $(function () {
        $("#TxtNodeName").keyup(function () {
            Getpy("TxtNodeName", "TxtNodeDir");
        });
    })
</script>
</asp:Content>