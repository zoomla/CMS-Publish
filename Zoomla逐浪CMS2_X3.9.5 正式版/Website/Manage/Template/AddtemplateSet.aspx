<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddtemplateSet.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.AddtemplateSet" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>方案设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("","工作台"),
        new Bread("","系统设置"),				
        new Bread("","方案管理"),				
        new Bread() {url="", text="发布当前站点方案",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover sys_table">
        <tr align="center" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <td colspan="2" class="spacingtitle">
                <asp:Label ID="LblTitle" runat="server" Text="发布当前站点方案" Font-Bold="True"></asp:Label></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <th class="w12rem_lg">方案名称</th>
            <td align="left">
                <asp:TextBox ID="proname" runat="server" class=" form-control max20rem"></asp:TextBox></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <th>作者</th>
            <td align="left">
                <asp:TextBox ID="txtAuthor" runat="server" class="form-control max20rem"></asp:TextBox></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <th>授权方式</th>
            <td align="left">
                <asp:RadioButtonList ID="protype" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="1">付费</asp:ListItem>
                    <asp:ListItem Value="0">免费</asp:ListItem>
                </asp:RadioButtonList></td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <th>模板目录</th>
            <td align="left">
                <asp:DropDownList ID="tempdirlist" CssClass="form-control max20rem" runat="server"></asp:DropDownList>
            </td>
        </tr>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'">
            <th>排序</th>
            <td align="left">
                <asp:TextBox ID="ornum" runat="server"  Columns="5" class=" form-control pull-left max20rem">0</asp:TextBox>
				<small class="text-muted">数字越大越高排在越前</small>
				</td>
        </tr>
        <tr class="tdbgbottom">
            <td colspan="2" class="text-center">
                <asp:Button ID="EBtnSubmit" class="btn btn-info" Text="保存" runat="server" OnClick="EBtnSubmit_Click" />
                <input name="Cancel" type="button" class="btn btn-outline-info" id="Cancel" value="取消" onclick="javascript: window.location.href = 'TemplateSet.aspx'" />
            </td>
        </tr>
    </table>
	</div></div>
</asp:Content>
