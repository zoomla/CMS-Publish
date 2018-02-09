<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductShow.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ProductShow"  MasterPageFile="~/Manage/I/Default.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>显示商品</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered">
            <caption class="t_caption"><asp:Label ID="Title_L" runat="server" /></caption>
            <tbody>
                <tr>
                    <td class="text-right" style="width:120px;">所属栏目：</td>
                    <td><asp:Label ID="NodeName_L" runat="server" /></td>
                </tr>
                <tr><td class="text-right">商品ID：</td>
                    <td><asp:Label runat="server" ID="ProID_L" /></td>
                </tr>
                <tr><td class="text-right">商品编号：</td>
                    <td><asp:Label runat="server" ID="ProNo_L" /></td>
                </tr>
                <tr>
                    <td class="text-right">商品名称：</td>
                    <td><asp:Label ID="ProName_L" runat="server" /></td>
                </tr>
                <tr>
                    <td class="text-right">所属店铺：</td>
                    <td><asp:Label ID="StoreName_L" runat="server" /></td>
                </tr>
                <tr>
                    <td class="text-right">当前零售价：</td>
                    <td><asp:Label ID="LinPrice_L" runat="server" /></td>
                </tr>
                <tr>
                    <td class="text-right">预订价格：</td>
                    <td><asp:Label ID="BookPrice_L" runat="server" /></td>
                </tr>
                <tr>
                    <td class="text-right">商品类型：</td>
                    <td><asp:Label ID="ProType_L" runat="server" /> </td>
                </tr>
                <tr>
                    <td class="text-right">属性设置：</td>
                    <td><asp:Label ID="Status_L" runat="server" /></td>
                </tr>
                <tr>
			        <td colspan="2" class="text-center" style="line-height: 25px;">
				        <a href="AddProduct.aspx?menu=edit&ModelID=<%=proMod.ModelID %>&NodeID=<%=proMod.Nodeid %>&id=<%=proMod.ID %>" class="btn btn-primary">重新修改</a>
                        <a href="AddProduct.aspx?ModelID=<%=proMod.ModelID %>&NodeID=<%=proMod.Nodeid %>" class="btn btn-primary">继续添加</a>
                        <a href="ProductManage.aspx?NodeID=<%=proMod.Nodeid %>" class="btn btn-primary">管理商品</a>
                        <a href="ShowProduct.aspx?id=<%=proMod.ID %>" class="btn btn-primary">后台预览</a>
                        <a href="/Shop/<%=proMod.ID %>.aspx" target="_blank" class="btn btn-primary">前台预览</a>
			        </td>
		        </tr>
            </tbody>
        </table>
        <br />
        <asp:Label ID="Label9" runat="server" Text="" />
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