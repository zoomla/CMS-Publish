<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MoneyManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.MoneyManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>货币管理</title>
		<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("ProductManage.aspx","商城管理"),
	new Bread("Addon/Exp/DeliverType.aspx","商城设置"),
	new Bread("MoneyManage.aspx","货币管理"),
	new Bread(){url="", text="品牌管理<a href='AddMoney.aspx'> [添加货币]</a>"}
	}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="Flow" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据！！">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("Flow") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="默认" HeaderStyle-CssClass="td_s">
                <ItemTemplate>
                    <%#(Eval("Is_flag").ToString()=="1")?"<span class='rd_green'>是</span>":"否"%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField  HeaderText="货币名称" DataField="Money_descp" />
            <asp:BoundField  HeaderText="货币代码" DataField="Money_code" />
            <asp:BoundField  HeaderText="货币符号" DataField="Money_sign" />
            <asp:TemplateField HeaderText="当前汇率">
                <HeaderStyle />
                <ItemTemplate>
                    <%#Eval("Money_rate","{0:0.00}")%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddMoney.aspx?id=<%#Eval("Flow") %>" ><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton ID="LinkButton1" CommandName="del1" CommandArgument='<%# Eval("Flow") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="alert alert-light">
    <asp:Button ID="Button1" class="btn btn-outline-danger" Text="删除选中货币" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" OnClick="Button1_Click" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        function IsSelectedId() {
            var checkArr = $("[name=idchk]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>
