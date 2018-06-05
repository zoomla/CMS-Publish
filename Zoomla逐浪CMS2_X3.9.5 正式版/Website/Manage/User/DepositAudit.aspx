<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositAudit.aspx.cs" Inherits="ZoomLaCMS.Manage.User.DepositAudit" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>提现审核</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <div style="min-height:500px;">
      <table class="table table-striped table-bordered">
        <tr>
            <td style="width: 15%" class="text-right">用户名：</td>
            <td><asp:Label ID="UName_L" runat="server" /></td>
        </tr>
       <tr><td class="text-right">提现金额：</td><td><asp:Label runat="server" ID="Money_L"></asp:Label></td></tr>
       <tr runat="server" id="reject_tr"><td class="text-right">提示：</td><td class="rd_red">拒绝提现后,预扣的金额将会返还给用户
           </td></tr>
        <tr>
            <td class="text-right">备注信息：</td>
            <td>
                <asp:TextBox ID="BackDecs_T" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control txtbody"></asp:TextBox></td>
        </tr>
        <tr><td class="text-right">上传凭证：</td><td>
            <input type="button" id="upfile_btn" class="btn btn-info" value="选择文件" runat="server" />
            <div style="margin-top: 10px;" id="uploader" class="uploader">
                <ul class="filelist"></ul>
            </div>
            <input type="hidden" id="Attach_Hid" name="Attach_Hid" runat="server"/>
        </td></tr>
        <tr runat="server" id="optr">
            <td></td>
            <td>
                <asp:Button runat="server" ID="Reject_Btn" class="btn btn-info" OnClick="Reject_Btn_Click" Visible="false" Text="拒绝"/>
                <asp:Button runat="server" ID="Accept_Btn" class="btn btn-info" OnClick="Accept_Btn_Click" Visible="false" Text="确认" OnClientClick="return confirm('要确认该笔出金吗?');"/>
<%--                <asp:Button ID="Audit_L" runat="server" OnClick="Audit_L_Click" CssClass="btn btn-info" />--%>
                <button type="button" onclick="parent.diag.CloseModal();" class="btn btn-info">取消</button>
            </td>
        </tr>
    </table>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>
 #navHolder{display:none;}
</style>
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script>
    $(function () {
        ZL_Webup.config.json.accept = 'img';
        $("#upfile_btn").click(ZL_Webup.ShowFileUP);
        var imgs = $("#Attach_Hid").val();
        if (imgs != "") { ZL_Webup.AddReadOnlyLi(imgs); }
    })
    function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
</script>
</asp:Content>