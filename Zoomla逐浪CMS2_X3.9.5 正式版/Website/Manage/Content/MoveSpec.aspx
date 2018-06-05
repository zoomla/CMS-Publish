<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoveSpec.aspx.cs"  MasterPageFile="~/Manage/I/Index.master" Inherits="ZoomLaCMS.Manage.Content.MoveSpec" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>专题迁移</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
		new Bread("/{manage}/Content/SpecialManage.aspx","专题管理"),
        new Bread() {url="", text="专题迁移",addon="" }},
		Call.GetHelp(17)
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td colspan="3" class="text-center">批量迁移专题</td>
        </tr>
        <tr>
            <td>
                <asp:ListBox ID="Specs_List" runat="server" CssClass="form-control max20rem system_list" DataTextField="SpecName" DataValueField="SpecID"  SelectionMode="Multiple"></asp:ListBox>
            </td>
            <td></td>
            <td>
                <asp:ListBox ID="TagetSpecs_List" runat="server" CssClass="form-control max20rem system_list" DataTextField="SpecName" DataValueField="SpecID" ></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td colspan="3"><span class="text-success"><i class="zi zi_bulbLine"></i> 专题与文章互为内容的经纬关系，专题合并后，并不会更改原有专题关系，请谨慎操作。</span></td>
        </tr>
        <tr>
            <td class="text-center" colspan="3">
                <asp:Button ID="MoveSpecs_Btn" runat="server" CssClass="btn btn-info" Text="迁移专题" OnClick="MoveSpecs_Btn_Click"/>
                <a href="SpecialManage.aspx" class="btn btn-outline-info">返回专题</a>
            </td>
        </tr>
    </table>
	</div></div>
</asp:Content>


