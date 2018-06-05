<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="GradeOption.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.GradeOption" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <script src="/JS/Controls/Control.js"></script>
    <title>多级数据字典管理</title>
</asp:Content>

<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
	<%=Call.SetBread(new Bread[] {
		new Bread("DictionaryManage.aspx","数据字典"),
		new Bread("GradeCateManage.aspx","多级数据"),
		//new Bread("GradeCateManage.aspx","字典管理"),
        new Bread() {url="", text="字典管理",addon="" }}
		)
    %>
    <div class="panel panel-default list_choice">
        <div class="panel panel-body table-responsive-md ">
            <ZL:ExGridView ID="Gdv" RowStyle-HorizontalAlign="Center" DataKeyNames="GradeID" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" Width="100%" OnRowDataBound="Gdv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" OnRowEditing="Gdv_Editing" EmptyDataText="无相关数据" CellPadding="2" CellSpacing="1" ForeColor="Black" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" GridLines="None">
                <Columns>
                    <asp:TemplateField HeaderText="">
                        <ItemTemplate>
                            <input type="checkbox" name="idchk" value="<%#Eval("GradeID") %>" /></ItemTemplate>
                        <ItemStyle CssClass="w1rem" HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="GradeID" HeaderText="序号">
                        <ItemStyle CssClass="" />
                    </asp:BoundField>
                    <asp:BoundField DataField="GradeName" HeaderText="选项">
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="操作"> 
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit1" CommandArgument='<%# Eval("GradeID") %>' ><i class="zi zi_squareCorrect" title="修改"></i>修改</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DicList" CommandArgument='<%# Eval("GradeID") %>'><i class="zi zi_listul" title="下级"></i>下级选项列表</asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                </Columns>
                <RowStyle ForeColor="Black"  />
                <SelectedRowStyle Font-Bold="True" ForeColor="White" />
                <PagerStyle HorizontalAlign="Center" />
                <HeaderStyle Font-Bold="True" />
            </ZL:ExGridView>
        </div>
        <div class="sysBtline">
            <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClientClick="return confirm('确定要删除吗!');" OnClick="BatDel_Btn_Click" CssClass="btn btn-outline-danger" />
        </div>
    </div>
	
<div class="container-fluid pr-0">
<div class="row sysRow table-responsive-md border border-secondary">
<table class="table table-striped table-bordered table-hover sys_table" cellspacing="1" cellpadding="0" width="100%" border="0" align="center">
    <tr>
        <th colspan="2" class="text-center Maintain_title">维护[<asp:Label ID="LblCate" runat="server" Text="Label"></asp:Label>]字典</th>
    </tr>
    <tr>
        <th class="w12rem_lg">级别</th>
        <td>
            <asp:Label ID="LblLevel" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr>
        <th>上级选项</th>
        <td><asp:Label ID="LblPreGrade" runat="server" Text=""></asp:Label></td>
    </tr>
    <tr>
        <th class="tdbgleft text-right">分级选项：</th>
        <td>
            <asp:TextBox ID="txtGradeName" runat="server" Width="300px" CssClass="form-control" data-enter="1"></asp:TextBox>
        </td>
    </tr>
    <tr>
		<td></td>
        <td>
            <asp:HiddenField ID="HdnGradeID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnParentID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnCateID" Value="0" runat="server" />
            <asp:HiddenField ID="HdnLastLevel" Value="0" runat="server" />
            <asp:Button ID="btnSave" UseSubmitBehavior="false" runat="server" Text="添加" OnClick="btnSave_Click" CssClass="btn btn-outline-info" data-enter="3"/>
            <asp:Button ID="Button1" UseSubmitBehavior="false" runat="server" Text="返回" OnClick="btnBack_Click" CssClass="btn btn-outline-info"/>
        </td>
    </tr>
</table> 
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        Control.EnableEnter();
    </script>
</asp:Content>