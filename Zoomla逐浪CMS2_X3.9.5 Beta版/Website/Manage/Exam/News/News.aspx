<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="ZoomLaCMS.Manage.Exam.News.News" MasterPageFile="~/Manage/I/Default.master" %>
<%@ Register TagPrefix="uc"TagName="NodeList"Src="~/Manage/I/ASCX/PublishNodeTree.ascx"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>报纸管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="nodelist" class="col-lg-2 col-md-2 col-xs-3 padding_l_r0">
<uc:NodeList runat="server" />
</div>
  <iframe id="Publist_IF" src="PublishDesc.aspx?Nid=0" class="col-lg-10 col-md-10 col-xs-9 padding_l2px" style="border:none;min-height:750px;"></iframe>
  <asp:HiddenField runat="server" ID="CurID_Hid" />
  <div class="modal" id="add_div">
    <div class="modal-dialog" style="width:1024px;">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span class="fa fa-remove-sign">Close</span></button>
          <span class="modal-title"><strong>添加报纸</strong></span> </div>
        <div class="modal-body">
          <table class="table table-bordered table-hover">
            <tr>
              <td>报纸名：</td>
              <td><asp:TextBox runat="server" ID="NewsName_T" CssClass="form-control text_md" />
                <asp:RequiredFieldValidator runat="server" ID="r1" ControlToValidate="NewsName_T" ForeColor="Red" ErrorMessage="不能为空" ValidationGroup="Add" /></td>
            </tr>
            <tr>
              <td>分类：</td>
              <td><asp:DropDownList ID="NodeList_D" CssClass="form-control text_md" runat="server">
                  <asp:ListItem Text="请选择分类" Value="0" />
                </asp:DropDownList></td>
            </tr>
            <tr>
              <td>操作：</td>
              <td><asp:Button runat="server" ID="Add_Btn" OnClick="Add_Btn_Click" Text="添加" ValidationGroup="Add" CssClass="btn btn-primary" /></td>
            </tr>
          </table>
        </div>
        <div class="modal-footer" style="text-align: center;"> </div>
      </div>
    </div>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript">
    function ShowModal() {
        $("#edit_href").click();
    }
    function ClearHid() {
        $("#CurID_Hid").val("");
        $("#NewsName_T").val("");
        $("#Add_Btn").val("添加");
    }
    function ShowInfo(id) {
        $("#Publist_IF").attr("src", "PublishDesc.aspx?Nid=" + id);
    }
    function ShowPubNode(nid) {
        if (!nid) { nid = 0; }
        ShowComDiag("PubNodeAdd.aspx?id=" + nid, "分类管理");
    }
</script>
</asp:Content>
