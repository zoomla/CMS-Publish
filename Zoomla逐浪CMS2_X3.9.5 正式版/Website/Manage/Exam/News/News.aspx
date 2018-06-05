<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="News.aspx.cs" Inherits="ZoomLaCMS.Manage.Exam.News.News" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register TagPrefix="uc"TagName="NodeList"Src="~/Manage/I/ASCX/PublishNodeTree.ascx"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>报纸管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("News.aspx","数字出版"),
        new Bread() {url="", text="<a onclick='ClearHid();' id='add_href'  href='javascript:;' data-toggle='modal' data-target='#add_div'> [添加报纸]</a><a href='javascript:;' onclick='ShowPubNode();'> [添加分类]</a>",addon="" }}
		)
    %>
	
<div class="list_choice"></div>
<div class="row">
<div id="nodelist" class="col-sm-2">
<uc:NodeList runat="server" />
</div>
  <iframe id="Publist_IF" src="PublishDesc.aspx?Nid=0" class="col-sm-10" style="border:none;min-height:750px;"></iframe>
  <asp:HiddenField runat="server" ID="CurID_Hid" />
  <div class="modal" id="add_div">
    <div class="modal-dialog" style="width:1024px;">
      <div class="modal-content">
        <div class="modal-header">
		<span class="modal-title"><strong>添加报纸</strong></span> 
          <button type="button" class="close" data-dismiss="modal"><span class="zi zi_expandarrowsalt">Close</span></button>
          </div>
        <div class="modal-body">
          <table class="table table-bordered table-hover sys_table">
            <tr>
              <th>报纸名</th>
              <td><asp:TextBox runat="server" ID="NewsName_T" CssClass="form-control text_md" />
                <asp:RequiredFieldValidator runat="server" ID="r1" ControlToValidate="NewsName_T" ForeColor="Red" ErrorMessage="不能为空" ValidationGroup="Add" /></td>
            </tr>
            <tr>
              <th>分类</th>
              <td><asp:DropDownList ID="NodeList_D" CssClass="form-control text_md" runat="server">
                  <asp:ListItem Text="请选择分类" Value="0" />
                </asp:DropDownList></td>
            </tr>
            <tr>
              <th>操作</th>
              <td><asp:Button runat="server" ID="Add_Btn" OnClick="Add_Btn_Click" Text="添加" ValidationGroup="Add" CssClass="btn btn-outline-info" /></td>
            </tr>
          </table>
        </div>
        <div class="modal-footer" style="text-align: center;"> </div>
      </div>
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
