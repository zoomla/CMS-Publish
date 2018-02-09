<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyResultList.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.SurveyResultList" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>结果列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
<%--        <asp:BoundField HeaderText="回答" DataField="Answer" />--%>
        <asp:TemplateField HeaderText="回答">
            <ItemTemplate>
                <button type="button" class="btn btn-info btn-xs" onclick="ShowAnswer(<%#Eval("ID") %>);">查看详情</button>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="来源" DataField="Source" ItemStyle-CssClass="td_m" />
        <asp:TemplateField HeaderText="IP">
            <ItemTemplate>
                <%#ZoomLa.BLL.Helper.IPScaner.IPLocation(Eval("IP","")) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日 HH:mm:ss}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_m">
            <ItemTemplate>
                <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<div class="margin_t5">
    <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" class="btn btn-info" OnClientClick="return confirm('确定要删除吗');" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function ShowAnswer(ansid) {
        ShowComDiag("/Vote/ShowAnswer?ID=<%:Mid%>&AnsID="+ansid,"详情");
    }
</script>
</asp:Content>