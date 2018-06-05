<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Schedule.TaskList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>任务队列</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","任务列表"),
        new Bread() {url="", text="任务队列",addon="" }}
		)
    %>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass=""/>
            <asp:BoundField HeaderText="任务名称" DataField="TaskName" />
            <asp:TemplateField HeaderText="运行状态">
                <ItemTemplate>
                    <%#Eval("IsRun") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="执行计划">
                <ItemTemplate>
                    <%#GetExecuteType() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="执行时间">
                <ItemTemplate>
                      <%#GetExecuteTime() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="最近一次执行">
                <ItemTemplate>
                    <%#GetLastTime() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="创建时间" DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}"  />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="AddSche.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <a  href="ScheLogList.aspx?TaskID=<%#Eval("ID") %>"><i class="zi zi_file"></i>查看日志</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="alert alert-light">
<a href="Default.aspx" class="btn btn-outline-info">返回列表</a>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>