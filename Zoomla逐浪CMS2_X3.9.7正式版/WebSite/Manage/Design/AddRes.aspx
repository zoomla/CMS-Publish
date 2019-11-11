<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRes.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.AddRes"  MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>资源管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ResList.aspx","资源管理"),
        new Bread() {url="", text="资源上传",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive">
<table class="table table-bordered table-striped sys_table">
    <tr>
        <th class="w12rem_lg">资源名称</th>
        <td>
            <ZL:TextBox runat="server" ID="Name_T" CssClass="form-control max20rem" AllowEmpty="false"></ZL:TextBox>
        </td>
    </tr>
    <tr><th>资源类别</th><td>
        <asp:DropDownList CssClass="form-control max20rem" runat="server" ID="Type_DP">
            <asp:ListItem Text="图片" Value="image"></asp:ListItem>
            <asp:ListItem Text="音乐" Value="music"></asp:ListItem>
            <asp:ListItem Text="图标" Value="icon"></asp:ListItem>
            <asp:ListItem Text="形状" Value="shape"></asp:ListItem>
            <asp:ListItem Text="文字" Value="text"></asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    <tr><th>使用场景</th><td>
        <asp:DropDownList CssClass="form-control max20rem" runat="server" ID="Useage_Dp" >
            <asp:ListItem Text="动力模块" Value="bk_pc"></asp:ListItem>
            <asp:ListItem Text="H5场景" Value="bk_h5"></asp:ListItem>
        </asp:DropDownList>
    </td></tr>
    <tr><th>资源文件</th><td><ZL:SFileUp runat="server" ID="Res_UP" FType="All"/></td></tr>
    <tr><th>缩略图</th><td><asp:TextBox runat="server" ID="PreviewImg_T" CssClass="form-control max20rem"></asp:TextBox></td></tr>
    <tr><th>用途</th><td><div id="use_div"></div></td></tr>
    <tr><th>功能</th><td><div id="fun_div"></div></td></tr>
    <tr><th>风格</th><td><div id="style_div"></div></td></tr>
    <tr>
        <th>状态</th>
        <td>
        <label><input type="radio" value="0" name="zstatus_rad" checked="checked" />正常</label>
        <label><input type="radio" value="1" name="zstatus_rad" />推荐</label>
        <label><input type="radio" value="-1" name="zstatus_rad" />停用</label>
    </td></tr>
    <tr>
        <td></td>
        <td>
            <asp:LinkButton runat="server" ID="Save_Btn" CssClass="btn btn-outline-info" OnClick="Save_Btn_Click">保存</asp:LinkButton>
            <a href="ResList.aspx" class="btn btn-outline-info">取消</a>
        </td>
    </tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
var usearr = "<%=resMod.UseArr%>".split(',');
var funarr = "<%=resMod.FunArr%>".split(',');
var stylearr = "<%=resMod.StyleArr%>".split(',');
var textarr = "<%=resMod.TextStyle%>".split(',');
var shapearr = "<%=resMod.ShapeStyle%>".split(',');
var iconarr = "<%=resMod.IconStyle%>".split(',');
function addchks(name, arr) {
    $("#" + name + "_div").html("");
    var list = [];
    var stlp = '<label class="mr-2"><input type="checkbox" name="' + name + '_chk" value="@name" class="chkitem" />@name</label>';
    for (var i = 0; i < arr.length; i++) {
        list.push({ name: arr[i] });
    }
    $items = JsonHelper.FillItem(stlp, list, null);
    $("#" + name + "_div").append($items);
}
addchks("use", usearr);
addchks("fun", funarr);
addchks("style", stylearr);

$("#Type_DP").change(function () {
    var type = $(this).val();
    switch (type) {
        case "image":
        case "music":
            addchks("style",stylearr);
            break;
        case "icon":
            addchks("style", iconarr);
            break;
        case "shape":
            addchks("style", shapearr);
            break;
        case "text":
            addchks("style", textarr);
            break;
    }
});
</script>
</asp:Content>
