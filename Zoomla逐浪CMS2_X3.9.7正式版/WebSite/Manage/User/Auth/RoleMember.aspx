<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleMember.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Auth.RoleMember" MasterPageFile="~/Manage/I/Index.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>角色成员</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <table id="EGV" class="table table-striped table-bordered table-hover content_list">
	<tr>
		<td></td>
        <td>ID</td>
        <td>用户名</td>
        <td>昵称</td>
        <td>操作</td>
	</tr>
<ZL:Repeater ID="RPT" runat="server" PageSize="20" PagePre="<tr><td><label class='allchk_l'><input type='checkbox' id='chkAll' onclick=''/>全选</label></td><td colspan='8'><div class='text-center'>"
     PageEnd="</div></td></tr>" OnItemCommand="RPT_ItemCommand">
	<ItemTemplate>
        <tr>
            <td><input type="checkbox" value="<%#Eval("UserID") %>" name="idchk"/></td>
            <td><%#Eval("UserID") %></td>
            <td><%#Eval("UserName") %></td>
            <td><%#Eval("HoneyName") %></td>
            <td>
                <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("UserID") %>' class="btn btn-info btn-sm"><i class="zi zi_trash"></i></asp:LinkButton>
            </td>
        </tr>
	</ItemTemplate>
	<FooterTemplate></FooterTemplate>
</ZL:Repeater>
</table>   
<div>
    <button type="button" class="btn btn-info" onclick="selMember();">选择成员</button>
    <asp:Button runat="server" ID="BatDel" OnClick="BatDel_Click" class="btn btn-danger" Text="批量删除" />
    <div style="display:none;">
        <asp:Button runat="server" ID="Sure_Btn" OnClick="Sure_Btn_Click" />
        <asp:HiddenField runat="server" ID="HiddenUser" />
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript">
        function selMember() { ShowComDiag("/Common/Dialog/SelGroup.aspx", "选择成员"); }
        function UserFunc(json, select) {
            if (json.length < 1) { return; }
            var uname = "";
            var uid = "";
            for (var i = 0; i < json.length; i++) {
                uname += json[i].UserName + ",";
                uid += json[i].UserID + ",";
            }
            if (uid) uid = uid.substring(0, uid.length - 1);
            $("#HiddenUser").val(uid);
            $("#Sure_Btn").trigger("click");
        }
    </script>
</asp:Content>