<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataSearch.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DataSearch" MasterPageFile="~/Manage/I/Safe.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>全库搜索</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("DatalistProfile.aspx","扩展功能"),
        new Bread("RunSql.aspx","开发中心"),
        new Bread() {url="DataSearch.aspx", text="全库搜索",addon="" }}
		)
    %>
	<div class="list_choice">
	<div class="input-group mb-3">
	  <div class="input-group-prepend">
		<span class="input-group-text">全库搜索</span>
	  </div>
	  <ZL:TextBox runat="server" ID="SearchText_T" class="form-control max20rem" placeholder="请输入需要检索的值" AllowEmpty="false"/>
	  <div class="input-group-append">
		<asp:Button ID="Button1" runat="server" Text="搜索" CssClass="btn btn-outline-secondary" OnClick="Button1_Click" OnClientClick="return check();" />
	  </div>
	</div>
	
   <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" Visible="false"
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="未检索到相关数据">
       <Columns>
           <asp:BoundField HeaderText="表名" DataField="tablename" ItemStyle-CssClass="" />
           <asp:BoundField HeaderText="字段名" DataField="columnname"/>
       </Columns>
   </ZL:ExGridView>
   </div>
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