<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollectionStep1.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.CollectionStep1"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.采集管理 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx",Resources.L.工作台),
        new Bread("../ContentManage.aspx",Resources.L.内容管理),
		new Bread("/{manage}/Content/Collect/CollectionManage.aspx",Resources.L.信息采集),
        new Bread() {url="CollectionStep1.aspx", text=Resources.L.采集管理,addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered sys_table">
        <tr>
            <th class="w12rem_lg">
                <strong><%=Resources.L.项目名称 %></strong>
            </th>
            <td>
                <ZL:TextBox ID="txtItemName" runat="server" class="form-control max20rem" AllowEmpty="false" />
            </td>
        </tr>
        <tr>
            <th>
                <strong><%=Resources.L.网站名称 %></strong>
            </th>
            <td>
                <ZL:TextBox ID="txtSiteName" runat="server" class="form-control max20rem" AllowEmpty="false"/>
            </td>
        </tr>
        <tr>
            <th>
                <strong><%=Resources.L.目标模型 %></strong>
            </th>
            <td>
                <asp:DropDownList ID="ddlModel" runat="server" CssClass="form-control max20rem" DataTextField="ModelName" DataValueField="ModelID"></asp:DropDownList>
                <asp:Label ID="Lbl_checkNode" runat="server" Visible="false" Text="你选择的栏目没有绑定数据表单！" Style="font-size: 12px; color: Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <th><strong><%=Resources.L.入库节点 %></strong></th>
            <td>
                <asp:Label class="max20rem" runat="server" ID="Node_L"></asp:Label>
            </td>
        </tr>
        <tr>
            <th><strong><%=Resources.L.采集 %>URL</strong></th>
            <td>
				<div class="input-group ">
			  <asp:DropDownList runat="server" ID="Proto_DP" CssClass="form-control max20rem">
                    <asp:ListItem Text="http://" Value="http://"></asp:ListItem>
                    <asp:ListItem Text="https://" Value="https://"></asp:ListItem>
                </asp:DropDownList>
			  <div id="port_btns" class="input-group-append">
				   <ZL:TextBox ID="txtUrl" class="form-control max20rem" runat="server" AllowEmpty="false" />
			  </div>
		 	 </div>
            </td>
        </tr>
                <tr>
            <th><strong><%=Resources.L.编码选择 %></strong></th>
            <td>
                <div>
                <asp:RadioButtonList ID="rblCoding" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="0" Selected="True" Text="<%$Resources:L,自动获取 %>"></asp:ListItem>
                    <asp:ListItem Value="1">UTF-8</asp:ListItem>
                    <asp:ListItem Value="2">GB2312</asp:ListItem>
                    <asp:ListItem Value="3">Big5</asp:ListItem>
                </asp:RadioButtonList>
                </div>
            </td>
        </tr>
        <tr>
            <th><strong><%=Resources.L.网站登录 %></strong></th>
            <td>
                <asp:TextBox runat="server" ID="Cookies_T" TextMode="MultiLine" CssClass="form-control m50rem_50" placeholder="<%$Resources:L,WebSite_notive %>" />
				<small class="text-muted"><%=Resources.L.网站登录_note %></small>
            </td>
        </tr>
 <%--       <tr>
            <th><strong>采集数量</strong></th>
            <td>
                <asp:TextBox ID="txtNum" class="form-control max20rem" runat="server"></asp:TextBox>
                <span style="color: Green"> 注：不指定为全部</span>
            </td>
        </tr>--%>
        <tr>
            <th><strong><%=Resources.L.备注 %></strong></th>
            <td>
                <asp:TextBox ID="txtContext" runat="server" Rows="8" TextMode="MultiLine" class="form-control m50rem_50"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" class="btn btn-outline-info" runat="server" Text="<%$Resources:L,下一步 %>" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
function selNode() {
    ShowComDiag("/Common/NodeList.aspx?Source=content", "请选择节点<input type='button' value='确定' onclick='GetDiagCon().SureFunc();' class='btn btn-primary'>");
}
function setNodeDP(nid)
{
    $("#node_dp").val(nid);
}
</script>    
</asp:Content>
