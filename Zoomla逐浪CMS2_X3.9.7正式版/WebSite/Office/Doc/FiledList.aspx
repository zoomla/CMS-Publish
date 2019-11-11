<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FiledList.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Doc.FiledList" MasterPageFile="~/Office/OAMain.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>已归档公文</title>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href="/Office/Main.aspx">办公管理</a></li>
        <li class="breadcrumb-item"><a href="/Office//Flow/ApplyList.aspx?view=3">我的公文</a></li>
        <li class="breadcrumb-item">归档公文</li>
    </ol>
    <div class="table-responsive-md list_choice pr-1">
    <ZL:ExGridView ID="SEGV" runat="server" AutoGenerateColumns="False" PageSize="10"
        OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有文档">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="档号" DataField="No" ItemStyle-CssClass=""/>
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate><!--点击进入审核界面,用于浏览-->
                    <a href="/Office/FreeFlow/FlowView.aspx?AppID=<%#Eval("ID") %>&Action=filed"><%#Eval("Title") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="部门" DataField="Branch" ItemStyle-CssClass="" />
            <asp:BoundField HeaderText="发起人" DataField="UserName" ItemStyle-CssClass="" />
            <asp:TemplateField HeaderText="日期" ItemStyle-CssClass="td_l">
                <ItemTemplate><%#Eval("SendDate","{0:yyyy年MM月dd日}") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
                <ItemTemplate><a href="/Office/FreeFlow/FlowView.aspx?AppID=<%#Eval("ID") %>&Action=filed">查看</a></ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
	<div class="sysBtline">
    <input type="button" value="文档借阅" onclick="ShowBorrow();" class="btn btn-outline-info" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="/JS/SelectCheckBox.js"></script>
    <script>
        function ShowBorrow() {
            var ids = GetValByName("idchk");
            if (ids == "") { alert("请先选择需要代阅的文件!"); return; }
            location = "AddBorrow.aspx?ids=" + ids;
            //ShowComDiag("BorrowEdit.aspx?ids=" + ids,"文档借阅");
        }
    </script>
</asp:Content>