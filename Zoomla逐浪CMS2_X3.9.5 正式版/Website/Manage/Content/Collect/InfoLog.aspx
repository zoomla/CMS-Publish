<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InfoLog.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.InfoLog" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>检索动态</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("../ContentManage.aspx","内容管理"),
	new Bread("CollSite.aspx","采集检索"),
	new Bread() {url="", text="检索日志",addon="" }},
	Call.GetHelp(3)
	)
%>

    <div class="list_choice d-flex flex-row">
		<div class="input-group mb-3">
	  <asp:TextBox runat="server"  ID="BeginTime_T" onclick="WdatePicker()"  CssClass="form-control max20rem" placeholder="开始时间"></asp:TextBox>
	  
	  <div class="input-group-prepend">
		<span class="input-group-text">-</span>
	  </div>
	  <asp:TextBox runat="server" ID="EndTime_T" onclick="WdatePicker()"  CssClass=" form-control max20rem" placeholder="结束时间"></asp:TextBox>
	  <div class="input-group-prepend">
		<span class="input-group-text">-</span>
	  </div>
	  <div class="input-group max20rem">
            <asp:TextBox runat="server" ID="Search_T" class="form-control" placeholder="请输入需要搜索的内容" />
            <span class="input-group-append">
                <asp:LinkButton runat="server" CssClass="btn btn-outline-secondary" OnClick="souchok_Click" ID="souchok_B"><span class="zi zi_search"></span></asp:LinkButton>
            </span>
        </div>
	</div>
    </div>
    <asp:CompareValidator ID="comparevalidator2" runat="server" ForeColor="Red"  ControlToCompare="BeginTime_T" ControlToValidate="EndTime_T" Operator="GreaterThan" ErrorMessage="结束日期必须大开于始日期"></asp:CompareValidator>
    <ZL:ExGridView runat="server" AllowPaging="true" AllowSorting="true" EmptyDataText="当前日志为空！" OnPageIndexChanging="EGV_PageIndexChanging" AutoGenerateColumns="false" PageSize="10" ID="EGV" CssClass="table table-bordered table-hover table-striped">
        <Columns>
            <asp:TemplateField HeaderText="采集结果">
                <ItemTemplate>
                    <%#Eval("LogTypeStr") %>
                </ItemTemplate>
                <HeaderStyle Width="10%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="采集信息">
                <ItemTemplate>
                    <%#Eval("Remind") %>
                </ItemTemplate>
                <HeaderStyle Width="10%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="采集时间">
                <ItemTemplate>
                    <%#Eval("CreateDate") %>
                </ItemTemplate>
                <HeaderStyle Width="10%" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
