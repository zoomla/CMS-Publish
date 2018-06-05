<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryManAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopManage.DeliveryManAdd" MasterPageFile="~/Manage/I/Index.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>送货员管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("../Shop/ProductManage.aspx","商城管理"),
        new Bread("StoreManage.aspx","店铺管理"),
        new Bread("DeliveryMan.aspx","送货员管理"),
        new Bread() {url="", text="添加送货员",addon="" }}
		)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-bordered table-striped sys_table">
        <tr>
            <th class="w12rem_lg">送货员</th>
            <td>
				<div class="input-group mb-3">
				  <asp:TextBox CssClass="form-control max20rem" runat="server" ID="UserName_T"></asp:TextBox>
				  <div class="input-group-append">
					<input type="button" class="btn btn-outline-info"  value="选择用户" onclick="SelUser();" />
				  </div>
				</div>
				
                <asp:HiddenField ID="UserID_H" runat="server" />
            </td>
        </tr>
        <tr>
            <th>所属店铺</th>
            <td>
                <asp:DropDownList runat="server" ID="UserShop_DP" DataValueField="GeneralID" DataTextField="Title" class="form-control max20rem" />
            </td>
        </tr>
        <tr>
            <th>权限</th>
            <td>
                <asp:CheckBoxList ID="Auth_DP" runat="server" RepeatColumns="8">
                    <asp:ListItem Value='settle'>结算</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <th>备注</th>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" CssClass="form-control max20rem" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Save_B" runat="server" CssClass="btn btn-info" Text="保存" OnClick="Save_B_Click" />
                <a href="DeliveryMan.aspx" class="btn btn-outline-info">取消</a>
            </td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var TemDiag = new ZL_Dialog();
        function SelUser() {
            TemDiag.title = "选择用户";
            TemDiag.maxbtn = false;
            TemDiag.url = "/Common/Dialog/SelGroup.aspx?selmode=single";
            TemDiag.ShowModal();
        }
        function UserFunc(list, select) {
            $("#UserName_T").val(list[0].UserName);
            $("#UserID_H").val(list[0].UserID);
            TemDiag.CloseModal()
        }
    </script>
</asp:Content>
