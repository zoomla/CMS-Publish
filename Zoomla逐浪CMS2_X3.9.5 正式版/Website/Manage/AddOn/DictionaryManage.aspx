<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="DictionaryManage.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.DictionaryManage" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据字典</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/plus/ADManage.aspx","扩展功能"),	
        new Bread("DictionaryManage.aspx","数据字典"),	
        new Bread() {url="", text="单级数据字典管理",addon="" }}
		)
    %>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" IsHoldState="false"
        class="table table-striped table-bordered table-hover list_choice" EmptyDataText="当前没有信息!!" OnRowEditing="Gdv_Editing" OnRowDataBound="EGV_RowDataBound"  
        OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs">                            
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("DicCateID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DicCateID" HeaderText="序号" HeaderStyle-CssClass="text-center td_s">
            </asp:BoundField>                                               
            <asp:TemplateField HeaderText="分类名" HeaderStyle-CssClass="text-center">
                <ItemTemplate>                                
                   <%# Eval("CategoryName")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="是否启用" HeaderStyle-CssClass="text-center">
                <ItemTemplate>
                  <%# GetUsedFlag(Eval("IsUsed","{0}")) %>
                </ItemTemplate>
                <HeaderStyle  />
            </asp:TemplateField>                             
            <asp:TemplateField HeaderText="操作" HeaderStyle-CssClass="text-center">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Edit1" CommandArgument='<%# Eval("DicCateID") %>'><i class="zi zi_squareCorrect" title="修改"></i></asp:LinkButton> 
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("DicCateID") %>' OnClientClick="return confirm('确实要删除?');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton> 
                <asp:LinkButton ID="LinkButton3" runat="server" CommandName="DicList" CommandArgument='<%# Eval("DicCateID") %>'><i class="zi zi_list" title="列表"></i>字典项目列表</asp:LinkButton>
            </ItemTemplate>
            </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center"/>
            <RowStyle  HorizontalAlign="Center" />
    </ZL:ExGridView>     
    <table  class="table table-striped table-bordered table-hover" id="sleall">
    <tr>
        <td>                   
            <asp:Button ID="btndelete" runat="server" OnClientClick="return confirm('你确定要将所有选择项删除吗?')" Text="批量删除" OnClick="btndelete_Click" class="btn btn-outline-danger"/>             
            <asp:Button ID="btnSetUsed" runat="server" Text="批量启用" OnClick="btnSetUsed_Click" class="btn btn-outline-info"/>
            <asp:Button ID="btnSetUnUsed" runat="server" Text="批量停用" OnClick="btnSetUnUsed_Click" class="btn btn-outline-dange"/>
            <asp:Button ID="btnSetAllUsed" runat="server" Text="全部启用" OnClick="btnSetAllUsed_Click" class="btn btn-outline-info"/>
            <button type="button" class="btn btn-outline-info" onclick="ShowComDiag('<%=CustomerPageAction.customPath2+"Common/Import.aspx?Mode=Ex_Dictionary" %>','数据导入');">数据导入</button>
        </td>
        <td class="d-flex flex-row">
            分类名：
            <asp:TextBox ID="txtCategoryName" runat="server" class="form-control max20rem" data-enter="1" />
            <asp:HiddenField ID="HdnDicCateID" Value="0" runat="server" />
            <asp:Button ID="btnSave" runat="server" Text="添加分类" OnClick="btnSave_Click" class="btn btn-outline-info ml-2" data-enter="2" />
        </td>
    </tr>                
</table>   
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Controls/Control.js"></script>
    <script>
        Control.EnableEnter();
    </script>
</asp:Content>

