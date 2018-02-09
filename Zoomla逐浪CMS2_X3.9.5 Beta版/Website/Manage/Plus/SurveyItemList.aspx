<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyItemList.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.SurveyItemList" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>问卷投票问题列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" DataKeyNames="ID"
        CssClass="table table-striped table-bordered" GridLines="None" runat="server" AutoGenerateColumns="False" 
        AllowPaging="True" PageSize="10"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" 
        OnRowDataBound="EGV_RowDataBound">
        <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs"><ItemTemplate><input type="checkbox" value="<%#Eval("ID") %>" name="idchk"/></ItemTemplate></asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-CssClass="td_s" />
            <asp:TemplateField HeaderText="问题标题">
                <ItemTemplate>
                    <a href="SurveyItem.aspx?ID=<%# Eval("ID") %>"><%# Eval("QTitle") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类别" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <%# GetQType() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="排序">
                <ItemTemplate>
                    <input type="text" name="orderid" data-oid="<%#Eval("Orderid") %>" data-id="<%# Eval("ID") %>" class="form-control text_xs text-center" value="<%#Eval("Orderid") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="SurveyItem.aspx?ID=<%#Eval("ID") %>" class="option_style"><i class="fa fa-pencil"></i>修改</a>
                    <a href="javascript:;" class="option_style"><i class="fa fa-arrow-up"></i>上移</a>
                    <a href="javascript:;" class="option_style"><i class="fa fa-arrow-down"></i>下移</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:HiddenField ID="Order_Hid" runat="server" />
    <asp:Button runat="server" ID="BatDel_Btn" class="btn btn-primary" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗');"  Text="批量删除"/>
    <asp:Button ID="Order_B" runat="server" OnClientClick="return SetOrder()" OnClick="Order_B_Click" Text="保存排序" CssClass="btn btn-primary" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        function CheckOrder() {
            var bl = true;
            $("[name='orderid']").each(function (i, v) {
                if (!ZL_Regex.isNum($(v).val())) {
                    alert("排序ID必须为数字!");
                    $(v).focus();
                    bl = false;
                    return false;
                }
            });
            return bl;

        }
        function SetOrder() {
            if (CheckOrder()) {
                var result = [];
                var $inputs = $("input[name='orderid']");
                for (var i = 0; i < $inputs.length; i++) {
                    var $obj = $($inputs[i]);
                    result.push({ id: $obj.data("id"), oid: $obj.val() });
                }
                $("#Order_Hid").val(JSON.stringify(result)); return true;
            }
            else { return false; }
        }
    </script>
</asp:Content>
