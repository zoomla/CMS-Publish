<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataSearch.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DataSearch" MasterPageFile="~/Manage/I/Safe.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>全库搜索</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="input-group margin_t5 text_500">
        <span class="input-group-addon">全库搜索</span>
        <ZL:TextBox runat="server" ID="SearchText_T" class="form-control" placeholder="请输入需要检索的值" AllowEmpty="false"/>
        <span class="input-group-btn">
            <asp:Button ID="Button1" runat="server" Text="搜索" CssClass="btn btn-primary" OnClick="Button1_Click" OnClientClick="return check();" />
        </span>
    </div>
   <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" Visible="false"
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True"
    CssClass="table table-striped table-bordered margin_t5" EnableTheming="False" EnableModelValidation="True" EmptyDataText="未检索到相关数据">
       <Columns>
           <asp:BoundField HeaderText="表名" DataField="tablename" ItemStyle-CssClass="td_l" />
           <asp:BoundField HeaderText="字段名" DataField="columnname"/>
       </Columns>
   </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.allchk_l{display:none;}
</style>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script>
    function check() {
        var key = $("#SearchText_T").val();
        if (ZL_Regex.isEmpty(key)) { alert("关键词不能为空"); return false; }
        comdiag.ShowMask("正在检索中...");
        return true;
    }
</script>
</asp:Content>