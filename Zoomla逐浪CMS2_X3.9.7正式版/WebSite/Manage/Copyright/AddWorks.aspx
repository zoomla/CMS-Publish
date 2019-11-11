<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWorks.aspx.cs" Inherits="ZoomLaCMS.Manage.Copyright.AddWorks" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加作品</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("","内容管理"),						
        new Bread("","资讯中心"),						
        new Bread() {url="", text="[向本栏目添加文章]",addon="" }}
		)
    %>
<div class="list_choice">
<div class="input-group mb-3">
<ZL:TextBox runat="server" ID="Title_T" CssClass="form-control max20rem" placeholder="标题" AllowEmpty="false" />
<div class="input-group-append">
<input type="button" value="选择内容" onclick="SelContent();" class="btn btn-info"  />
</div>
</div>

<div class="table-responsive-md">
    <asp:TextBox runat="server" ID="content_t" style="height:260px;" TextMode="MultiLine"></asp:TextBox>
</div>
<div class="table-responsive">
<table class="table table-condensed table-bordered sys_table">
    <tr><th scope="col" rowspan="2" class="w12rem_lg">选择授权规则</th>
        <td scope="col">
            <label class="chkLabel"><input type="checkbox" checked="checked" onchange="repChange(this);" />转载使用</label>
            <ZL:TextBox runat="server" ID="RepPrice_T" CssClass="form-control max20rem" Text="0" ValidType="FloatZeroPostive" />
        </td>
        <td><input type="button" class="btn btn-info" value="设置价格模板" style="display:none;" /></td>
    </tr>
    <tr>
        <td scope="col">
            <label class="chkLabel"><input type="checkbox" checked="checked" onchange="matChange(this);" />素材使用</label>
            <ZL:TextBox runat="server" ID="MatPrice_T" CssClass="form-control max20rem" Text="0" ValidType="FloatZeroPostive" />
        </td>
        <td><a href="http://www.baidu.com" target="_blank" class="btn btn-info" style="width:110px;display:none;">进入版权印</a></td>
    </tr>
</table>
</div>
<div class="text-center">
<asp:Button runat="server" ID="Add_Btn" Text="发表文章" CommandArgument="add" CssClass="btn btn-info" OnClick="Add_Btn_Click" />
<%--<asp:Button runat="server" ID="Draft_Btn" Text="存为草稿" CommandArgument="draft" CssClass="btn btn-lg btn-info"  OnClick="Add_Btn_Click" style="margin-left:5px;"/>--%>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<%=Call.GetUEditor("content_t",2) %>
<script>
var repChange = function (chk) {
    if ($(chk).is(':checked')) {
        $("#RepPrice_T").attr("disabled", false);
        $("#RepPrice_T").val("0");
    }
    else {
        $("#RepPrice_T").attr("disabled", true);
        $("#RepPrice_T").val("");
    }
}
var matChange = function () {
    if ($(chk).is(':checked')) {
        $("#MatPrice_T").attr("disabled", false);
        $("#MatPrice_T").val("0");
    }
    else {
        $("#MatPrice_T").attr("disabled", true);
        $("#MatPrice_T").val("");
    }
};
function SelContent()
{
    ShowComDiag("/Common/Dialog/SelContent.aspx", "选择内容");
}
function GetContent(content, title, gid) {
    location = siteconf.path + "CopyRight/AddWorks.aspx?gid=" + gid;
}
function CloseDiag() {
    CloseComDiag();
}
</script>
</asp:Content>