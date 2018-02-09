<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryManAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopManage.DeliveryManAdd" MasterPageFile="~/Manage/I/Default.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>送货员管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr>
            <td class="td_m">送货员：</td>
            <td>
                <div class="input-group" style="width: 401px;">
                    <asp:TextBox CssClass="form-control text_300" runat="server" ID="UserName_T"></asp:TextBox>
                    <span class="input-group-btn">
                        <input type="button" class="btn btn-info" style="width: 101px;" value="选择用户" onclick="SelUser();" /></span>
                </div>
                <asp:HiddenField ID="UserID_H" runat="server" />
            </td>
        </tr>
        <tr>
            <td>所属店铺：</td>
            <td>
                <asp:DropDownList runat="server" ID="UserShop_DP" DataValueField="GeneralID" DataTextField="Title" class="form-control text_300" />
            </td>
        </tr>
        <tr>
            <td>权限：</td>
            <td>
                <asp:CheckBoxList ID="Auth_DP" runat="server" RepeatColumns="8" Width="586px">
                    <asp:ListItem Value='settle'>结算</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td>备注：</td>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" CssClass="form-control" TextMode="MultiLine" Width="300" Height="120"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Save_B" runat="server" CssClass="btn btn-info" Text="保存" OnClick="Save_B_Click" />
                <a href="DeliveryMan.aspx" class="btn btn-info">取消</a>
            </td>
        </tr>
    </table>
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
