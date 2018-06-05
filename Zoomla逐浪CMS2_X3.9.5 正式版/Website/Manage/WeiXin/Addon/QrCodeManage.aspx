<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QrCodeManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.QrCodeManage" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>二维码管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","微信管理"),
        new Bread() {url="", text="二维码管理<a href='QrCode.aspx'>[生成二维码]</a>",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table  class="table table-striped table-bordered table-hover sys_table"> 
<tr>
<th scope="col" class="w1rem"> </th>
<th scope="col">ID</th>
<th scope="col">类型</th>
<th scope="col">名称</th>
<th scope="col">创建时间</th>
<th scope="col">操作</th>
</tr>
<ZL:ExRepeater ID="RPT" runat="server" PageSize="10" PagePre="<tr><td colspan='6' class='text-center'><input type='checkbox' id='CheckAll' />" PageEnd="</td></tr>" OnItemCommand="Repeater1_ItemCommand" >
<ItemTemplate>
<tr class="tdbg" ondblClick="UpadateSite('<%#Eval("ID") %>','<%#Eval("Type")%>')">
<td align="center" ><input type="checkbox" name="Btchk" id="Btchk" value='<%# Eval("ID") %>' /></td>
<td align="center"><%#Eval("ID") %></td>
<td align="center"><%#getType(Convert.ToInt32(Eval("Type"))) %></td>
<td align="left"><a href="UpdateCode.aspx?ID=<%#Eval("ID")%>&Type=<%#Eval("Type")%>"><%#getTit(Convert.ToInt32(Eval("Type")),Eval("CodeContents").ToString()) %></a></td>
<td align="center"><%#Eval("CreateTime") %></td>
<td align="center"><a href="UpdateCode.aspx?ID=<%#Eval("ID") %>&Type=<%#Eval("Type") %>" ><i class="zi zi_pencilalt" title="修改"></i></a>  
 <asp:LinkButton ID="linkBtn" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Del"  OnClientClick=" return confirm('你确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton> </td> 
</tr>
</ItemTemplate>
<FooterTemplate></FooterTemplate>
</ZL:ExRepeater>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
	function UpadateSite(id, type) {
		location.href = "UpdateCode.aspx?ID=" + id + "&Type=" + type;
	}
	function checkAll() {
		xstatus = document.getElementById("cbAll").checked;
		var checkBoxs = document.getElementsByName("Btchk");
		for (i = 0; i < checkBoxs.length; i++) {
			checkBoxs[i].checked = xstatus;
		}

	}
	function isAnyOneChecked() {
		var checkBoxs = document.getElementsByName("Btchk");
		for (i = 0; i < checkBoxs.length; i++) {
			if (checkBoxs[i].checked) return true;
		}
	}
</script>
</asp:Content>