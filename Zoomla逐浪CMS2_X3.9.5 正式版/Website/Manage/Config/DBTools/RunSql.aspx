<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RunSql.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.RunSql" MasterPageFile="~/Manage/I/Safe.master" ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
<link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
<title>SQL执行</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("DatalistProfile.aspx","扩展功能"),
        new Bread("RunSql.aspx","开发中心"),
        new Bread() {url="RunSql.aspx", text="执行SQL语句",addon="" }},
		Call.GetHelp(65)
		)
    %>
	<div class="list_choice">
        <ul class="nav nav-tabs">
            <li class="nav-item"><a class="nav-link active" href="#Tabs0" data-toggle="tab">录入脚本</a></li>
            <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">上传脚本</a></li>
        </ul>
		<div class="container-fluid pr-0">
		<div class="row sysRow table-responsive-md">
        <div class="tab-content w-100">
            <div class="tab-pane active" id="Tabs0">
                <div id="sql_div" runat="server" class="card">
                    <div class="card-header">
                        <div class="btn-group d-flex flex-wrap" id="sql_btns">
                            <button type="button" class="btn btn-outline-info" data-cmd="select">SELECT</button>
                            <button type="button" class="btn btn-outline-info" data-cmd="update">UPDATE</button>
                            <button type="button" class="btn btn-outline-info" data-cmd="insert">INSERT</button>
                            <button type="button" class="btn btn-outline-info" data-cmd="delete">DELETE</button>
                            <button type="button" class="btn btn-outline-info" data-cmd="leftjoin">LEFT JOIN</button>
                            <button type="button" class="btn btn-outline-info" data-cmd="user">查询用户</button>
                        </div>
                    </div>
                    <div class="card-body">
                          <div style="border-top:1px solid #ddd;border-bottom:1px solid #ddd;"><textarea runat="server" id="Sql_T" style="display: none;"></textarea></div>
                    </div>
                    <div class="panel-footer mb-3 text-center">
                        <asp:Button ID="RunSql_B" runat="server" Text="执行SQL语句" CssClass="btn btn-outline-info mb-2" OnClick="RunSql_B_Click" />
                        <asp:Button ID="SaveSql_B" runat="server" Text="保存为脚本" CssClass="btn btn-outline-info mb-2" OnClick="SaveSql_B_Click" />
                    </div>
                </div>
                <div id="result_div" runat="server" visible="false">
                    <ZL:ExGridView ID="Result_EGV" runat="server" AutoGenerateColumns="true" CssClass="table table-striped table-bordered table-hover"></ZL:ExGridView>
                    <div class="Conent_fix"><asp:Button ID="Return_B" runat="server" CssClass="btn btn-outline-info" OnClick="Return_B_Click" Text="返 回" /></div>
                </div>
            </div>
            <div class="tab-pane" id="Tabs1">
                <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false"
                    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
                    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
                    <Columns>
                        <asp:BoundField HeaderText="文件名" DataField="name" />
                        <asp:BoundField HeaderText="文件大小" DataField="size" />
                        <asp:BoundField HeaderText="创建时间" DataField="CreateTime" DataFormatString="{0:yyyy年MM月dd日 HH:mm:ss}" />
                        <asp:BoundField HeaderText="路径" DataField="Path" />
                        <asp:TemplateField HeaderText="操作">
                            <ItemTemplate>
                                <asp:LinkButton runat="server"  CommandName="execute" CommandArgument='<%#Eval("Path") %>' OnClientClick="return confirm('确定要执行该脚本吗');"><i class="zi zi_play" title="执行"></i>执行</asp:LinkButton>
                                <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("Path") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </ZL:ExGridView>
            </div>
        </div>
        </div>
        </div>
        
<div style="display:none;">
    <div id="sql_select">SELECT * FROM ZL_CommonModel</div>
    <div id="sql_update">UPDATE ZL_CommonModel SET Title=''</div>
    <div id="sql_insert">INSERT INTO ZL_User (UserName,UserPwd,Email,Question,Answer) VALUES('UserName','UserPwd','Email','Question','Answer')</div>
    <div id="sql_delete">DELETE FROM ZL_CommonModel WHERE GeneralID IN ()</div>
    <div id="sql_leftjoin">SELECT * FROM ZL_CommonModel A LEFT JOIN ZL_C_Article B ON A.ItemID=B.ID</div>
    <div id="sql_user">SELECT * FROM ZL_User WHERE UserName LIKE '%admin%'</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
<script src="/Plugins/CodeMirror/mode/sql.js"></script>
<script>
var editor = null;
$(function () {
     editor = CodeMirror.fromTextArea(document.getElementById("Sql_T"), {
        mode: "text/x-mssql",
        height: "300",
        lineNumbers: true,
        textWrapping: false,
        styleActiveLine: true,
     });
     editor.setSize('auto', '300');
    $("#sql_btns button").click(function () {
        var cmd = $(this).data("cmd");
        var sql = $("#sql_" + cmd).text()+" \r\r";
        editor.replaceSelection(sql, null, "paste");
    });
})
</script>
</asp:Content>
