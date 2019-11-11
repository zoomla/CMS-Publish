<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreUpdate.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopMannger.StoreUpdate" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/TemplateView.ascx" TagPrefix="ZL" TagName="TlpViewList" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商家店铺修改</title>
    <script charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script charset="utf-8" src="/Plugins/Ueditor/ueditor.all.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/I/Main.aspx","工作台"),
new Bread("../Shop/ProductManage.aspx","商城管理"),
new Bread("StoreManage.aspx","店铺管理"),
new Bread(){url="", text="店铺信息"}
}) %>
    <div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive">
        <table class="table table-striped table-bordered table-hover sys_table">
            <tr>
                <th class="text-right">店铺名称</th>
                <td>
					<div class="input-group mb-3">
					  <asp:TextBox ID="UserShopName_T" runat="server" CssClass="form-control max20rem" />
					  <div class="input-group-append">
						<a href="/Store/StoreIndex?id=<%:Mid %>" class="btn btn-info <%:Mid==0?"hidden":"" %>" target="_blank"><i class="zi zi_eye"></i></a>
					  </div>
					</div>
                </td>
            </tr>
            <tr><th class="text-right">所属用户</th><td>
				<div class="input-group mb-3">
				  <asp:TextBox runat="server" ID="UserName_T" class="form-control max20rem" />
				  <asp:HiddenField runat="server" ID="UserName_H" />
				  <div class="input-group-append">
					<input type="button" class="btn btn-info" value="选择用户" onclick="SelUser();" />
				  </div>
				</div>
				
                <small class="text-muted">每个用户只允许拥有一个店铺</small>
			 </td></tr>
            <tr>
                <th class="text-right">店铺样式</th>
                <td>
                    <ZL:TlpViewList ID="TlpView_Tlp" runat="server" TemplateID="ID" TemplateUrl="Template_Index" TemplateTitle="StyleName" TemplatePic="Thumbnail" />
                </td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
        </table>
	</div>
    </div>
    <div class="Conent_fix">
        <asp:Button ID="Esubmit" CssClass="btn btn-info" runat="server" Text="保存信息" OnClick="Esubmit_Click" />
        <a href="StoreManage.aspx" class="btn btn-outline-info">返回列表</a>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    var zlconfig = {
        updir: "<%=ZoomLa.Components.SiteConfig.SiteOption.UploadDir.ToLower()%>",
    duptitlenum: "<%=ZoomLa.Components.SiteConfig.SiteOption.DupTitleNum%>",
    modelid: "<%=0%>"
};
</script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/chinese.js"></script>
<script src="/JS/Common.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/tags.json"></script>
<script src="/JS/ZL_Content.js"></script>
<script>
function SelUser() {
    comdiag.maxbtn = false;
    ShowComDiag("/Common/Dialog/SelGroup.aspx?selmode=single", "选择用户");
}
function UserFunc(list, select) {
    $("#UserName_T").val(list[0].UserName);
    $("#UserName_H").val(list[0].UserID);
    CloseComDiag();
}
</script>
</asp:Content>

