<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddScenceTlp.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.AddScenceTlp" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<%@ Register Src="~/Manage/I/ASCX/TreeTlpDP.ascx" TagPrefix="ZL" TagName="TreeTlp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="/dist/css/star-rating.min.css" rel="stylesheet" />
    <script src="/dist/js/star-rating.min.js"></script>
    <title>场景模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("TlpList.aspx?type=1","模板列表"),
        new Bread() {url="", text="模板管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
<tr>
    <th class="w12rem_lg">模板名称</th>
    <td>
        <ZL:TextBox runat="server" ID="TlpName_T" CssClass="form-control max20rem" AllowEmpty="false"></ZL:TextBox>
    </td>
</tr>
<tr><th>模板分类</th><td>
    <ZL:TreeTlp ID="NodeTree" Selected="Node_Hid" NodeID="ID" Pid="Pid" Name="Name" EmpyDataText="请选择分类!" runat="server" />
    <asp:HiddenField ID="Node_Hid" runat="server" />
               </td></tr>
<tr <%=Mid>0 ? "":"hidden" %>>
    <th>创建时间</th>
    <td><asp:Label ID="CDate_L" runat="server" /></td>
</tr>
<tr><th>模板价格</th><td>
    <ZL:TextBox runat="server" ID="Price_T" CssClass="form-control max20rem" AllowEmpty="true" ValidType="FloatZeroPostive" />
               </td></tr>
<tr><th>预览图片</th><td><ZL:SFileUp runat="server" ID="PreView_UP" FType="Img" /></td></tr>
<tr id="score_tr" runat="server" visible="false">
    <th>模板评分</th>
    <td runat="server">
        <input id="score_num" name="score_num" type="number" class="rating" min="0" max="5" step="0.5" data-size="xs">
    </td>
</tr>
<tr><th>模板状态</th><td>
    <label><input type="radio" value="0" name="zstatus_rad" checked="checked" />正常</label>
    <label><input type="radio" value="1" name="zstatus_rad" />推荐</label>
    <label><input type="radio" value="-1" name="zstatus_rad" />停用</label>
</td></tr>
<tr><th>模板用途</th><td>
   <label><input type="checkbox" value="mbh5_fast" name="defby_chk" />场景快速生成</label>
   <label><input type="checkbox" value="404" name="defby_chk" />404模板</label>
</td></tr>
<tr><th>模板备注</th><td><asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" CssClass="form-control m50rem_50"></asp:TextBox></td></tr>
<tr>
    <td></td>
    <td>
        <asp:LinkButton runat="server" ID="Save_Btn" CssClass="btn btn-info" OnClick="Save_Btn_Click">保存</asp:LinkButton>
        <a href="TlpList.aspx?type=<%:ZType %>" class="btn btn-outline-info">取消</a>
        <a runat="server" ID="edit_a" target="_blank" class="btn btn-outline-info" Visible="false"><i class="zi zi_pencil"></i> 修改模板</a>
    </td>
</tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script>
    function setscore(score) {
        $("#score_num").val(score);
        $(".rating").rating('refresh', {
            showClear: false,
        });
    }
</script>
</asp:Content>
