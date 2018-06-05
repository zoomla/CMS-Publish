<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CitizenXmlConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.CitizenXmlConfig" MasterPageFile="~/Manage/I/Index.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>国籍数据字典管理</title>
<script src="/JS/Controls/Control.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/plus/ADManage.aspx","扩展功能"),	
        new Bread("/{manage}/Addon/DictionaryManage.aspx","数据字典"),	
        new Bread() {url="", text="国籍字典管理",addon="" }}
		)
    %>
    <asp:Label ID="lblCateName" runat="server" Text=""></asp:Label>
    <asp:Label ID="LblGradeLevel" runat="server" Text=""></asp:Label>
    <ZL:ExGridView ID="EGV" RowStyle-HorizontalAlign="Center" runat="server" DataKeyNames="FileName" AutoGenerateColumns="False" 
        AllowPaging="True" PageSize="10" OnRowDataBound="Gdv_RowDataBound" CssClass="table table-striped table-bordered table-hover list_choice" 
        OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemTemplate><input type="checkbox" name="idchk" value="<%#Eval("FileName") %>" /></ItemTemplate>
                <ItemStyle CssClass="w1rem" HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="选项">
                <ItemTemplate><%#Eval("FileName") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit1" CommandArgument='<%# Eval("FileName") %>' ><i class="zi zi_pencilalt" title="修改"></i>修改</asp:LinkButton> 
                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DicList" CommandArgument='<%# Eval("FileName") %>' ><i class="zi zi_listalt" title="列表"></i>下级选项列表</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" ></ItemStyle>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
<table class="table table-striped table-bordered table-hover">
<tr>
<td>
	<asp:Button runat="server" ID="BatDel_Btn" OnClientClick="return confirm('确定要删除吗');" OnClick="BatDel_Btn_Click" Text="批量删除" CssClass="btn btn-outline-danger" />
</td>
</tr>
</table>
    <div class="clearfix"></div>
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg">所属分类</th>
            <td>
                <asp:Label ID="LblCate" runat="server" Text="国省市三级联动"></asp:Label></td>
        </tr>
        <tr>
            <th align="left">级别</th>
            <td><asp:Label ID="LblLevel" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <th>上级选项</th>
            <td><asp:Label ID="LblPreGrade" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <th>分级选项</th>
            <td><asp:TextBox ID="txtGradeName" runat="server" CssClass="form-control max20rem" data-enter="1"></asp:TextBox></td>
        </tr>
        <tr>             
            <td colspan="2">
                <asp:HiddenField ID="HdnFileName" Value="0" runat="server" />
                <asp:HiddenField ID="HdnCountry" Value="0" runat="server" />
                <asp:Button ID="btnSave" runat="server" Text="添加" OnClick="btnSave_Click" class="btn btn-outline-info" data-enter="2"/>
                <asp:Button ID="Button1" runat="server" Text="返回" OnClick="btnBack_Click" class="btn btn-outline-info" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>Control.EnableEnter();</script>
</asp:Content>