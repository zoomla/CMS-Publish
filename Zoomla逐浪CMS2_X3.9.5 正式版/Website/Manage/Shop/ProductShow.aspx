<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductShow.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ProductShow"  MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>显示商品</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<!--<asp:Label runat="server" ID="Bread_L"></asp:Label>-->
<nav aria-label="breadcrumb" role="navigation" class="fixed-top">
<ol class="breadcrumb">
<li class="breadcrumb-item"><a href="/admin/I/Main.aspx">工作台</a> </li>
<li class="breadcrumb-item"><a href="ProductManage.aspx">商城管理</a> </li>
<li class="breadcrumb-item"><a href="ProductManage.aspx?NodeID=<%=proMod.Nodeid %>">商品管理</a> </li>
<li class="breadcrumb-item active" aria-current="page">商品预览</li>
<div class="pull-right ml-auto"> <a href="/Shop/<%=proMod.ID %>.aspx" target="_blank" title="前台浏览"><span class="zi zi_eye" zico="眼睛"></span></a>
<span onclick="opentitle('/admin/Content/Node/EditNode.aspx?NodeID=<%=proMod.Nodeid %>','配置本节点');" class="zi zi_cog" title="配置本节点" style="cursor:pointer;margin-left:5px;"></span>
</div>
</ol></nav>
    <div class="list_choice">
        <table class="table table-striped table-bordered sys_table">
            <tbody>
				<tr><th class="text-center" colspan="2"><asp:Label ID="Title_L" runat="server" /></th></tr>
                <tr>
                    <th class="w12rem_lg">所属栏目</th>
                    <td><asp:Label ID="NodeName_L" runat="server" /></td>
                </tr>
                <tr><th>商品ID</th>
                    <td><asp:Label runat="server" ID="ProID_L" /></td>
                </tr>
                <tr><th>商品编号</th>
                    <td><asp:Label runat="server" ID="ProNo_L" /></td>
                </tr>
                <tr>
                    <th>商品名称</th>
                    <td><asp:Label ID="ProName_L" runat="server" /></td>
                </tr>
                <tr>
                    <th>所属店铺</th>
                    <td><asp:Label ID="StoreName_L" runat="server" /></td>
                </tr>
                <tr>
                    <th>当前零售价</th>
                    <td><asp:Label ID="LinPrice_L" runat="server" /></td>
                </tr>
                <tr>
                    <th>预订价格</th>
                    <td><asp:Label ID="BookPrice_L" runat="server" /></td>
                </tr>
                <tr>
                    <th>商品类型</th>
                    <td><asp:Label ID="ProType_L" runat="server" /> </td>
                </tr>
                <tr>
                    <th>属性设置</th>
                    <td><asp:Label ID="Status_L" runat="server" /></td>
                </tr>
                <tr>
			        <td colspan="2" class="text-center" style="line-height: 25px;">
				        <a href="AddProduct.aspx?menu=edit&ModelID=<%=proMod.ModelID %>&NodeID=<%=proMod.Nodeid %>&id=<%=proMod.ID %>" class="btn btn-outline-info">重新修改</a>
                        <a href="AddProduct.aspx?ModelID=<%=proMod.ModelID %>&NodeID=<%=proMod.Nodeid %>" class="btn btn-outline-info">继续添加</a>
                        <a href="ProductManage.aspx?NodeID=<%=proMod.Nodeid %>" class="btn btn-outline-info">管理商品</a>
                        <a href="ShowProduct.aspx?id=<%=proMod.ID %>" class="btn btn-outline-info">后台预览</a>
                        <a href="/Shop/<%=proMod.ID %>.aspx" target="_blank" class="btn btn-outline-info">前台预览</a>
			        </td>
		        </tr>
            </tbody>
        </table>
        <br />
        <asp:Label ID="Label9" runat="server" Text=""  />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript">
        var userdiag = new ZL_Dialog();
        function opentitle(url, title) {
            userdiag.title = title;
            userdiag.url = url;
            userdiag.ShowModal();
        }
        function editnode(NodeID) {
            var answer = confirm("该栏目未绑定模板，是否立即绑定");
            if (answer == false) {
                return false;
            }
            else {
                open_page(NodeID, "Node/EditNode.aspx?NodeID=");
            }
        }
        function closdlg() {
            Dialog.close();
        }
    </script>
</asp:Content>