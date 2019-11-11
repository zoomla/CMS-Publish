<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DBTools.Default" MasterPageFile="~/Manage/I/Safe.master" EnableViewState="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>数据库管理</title>
<link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
<link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("RunSql.aspx","开发中心"),
        new Bread() {url="/{manage}/Config/DBTools/Default.aspx", text="数据管理",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
<div class="card pull-left col-12 col-sm-3" style="padding:0px;">
    <div class="card-header"><i class="zi zi_table"></i> 数据表</div>
    <div class="card-body p-1">
        <div class="input-group" style="border-bottom:1px solid #ddd;padding-bottom:5px;">
            <input type="text" class="form-control" placeholder="请输入表名" id="table_filter_t" />
            <span class="input-group-append"><button type="button" class="btn btn-outline-secondary" onclick="dbtool.table_filter();"><i class="zi zi_search"></i></button></span>
        </div>
        <ul class="table_ul" style="overflow-y:auto;">
            <asp:Repeater runat="server" ID="Table_RPT">
                <ItemTemplate>
                    <li class="table_item"><i class="zi zi_table"></i> <%#Eval("name") %></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>
<div class="card pull-right col-12 col-sm-9" id="data_panel" style="padding:0px;">
    <div class="card-header">
        <div class="btn-group d-flex flex-wrap" id="sql_btns">
            <button type="button" class="btn btn-outline-info" data-cmd="select">SELECT</button>
            <button type="button" class="btn btn-outline-info" data-cmd="update">UPDATE</button>
            <button type="button" class="btn btn-outline-info" data-cmd="insert">INSERT</button>
            <button type="button" class="btn btn-outline-info" data-cmd="delete">DELETE</button>
            <button type="button" class="btn btn-outline-info" data-cmd="leftjoin">LEFT JOIN</button>
            <button type="button" class="btn btn-outline-info" data-cmd="user">查询用户</button>
            <button type="button" class="btn btn-outline-info" data-cmd="field_add">增加字段</button>
        </div>
    </div>
    <div class="card-body p-0">
        <div style="border-bottom: 1px solid #ddd;">
            <textarea runat="server" id="sql_t" style="display: none;"></textarea>
        </div>
        <div class="card"><div class="card-header">
            <button type="button" class="btn btn-outline-info" onclick="dbtool.execute();" id="execute_btn" style="margin-left:15px;">执行语句</button></div></div>
        <div style="min-height:400px;overflow:auto;position:relative;" id="result_div">
            <div class="text-center" style="color:#ccc;padding-top:100px;">
                <i style="font-size: 160px;" class="zi zi_tv"></i>
                <div style="font-size:20px;">请在上方输入SQL语句</div>
            </div>
        </div>
    </div>
</div>
</div></div>
<div style="display:none;">
    <div id="sql_select">SELECT * FROM ZL_CommonModel</div>
    <div id="sql_update">UPDATE ZL_CommonModel SET Title=''</div>
    <div id="sql_insert">INSERT INTO ZL_User (UserName,UserPwd,Email,Question,Answer) VALUES('UserName','UserPwd','Email','Question','Answer')</div>
    <div id="sql_delete">DELETE FROM ZL_CommonModel WHERE GeneralID IN ()</div>
    <div id="sql_leftjoin">SELECT * FROM ZL_CommonModel A LEFT JOIN ZL_C_Article B ON A.ItemID=B.ID</div>
    <div id="sql_user">SELECT * FROM ZL_User WHERE UserName LIKE '%admin%'</div>
    <div id="sql_field_add">ALTER TABLE [TableName] ADD [FieldName] nvarchar(500)</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
<script src="/Plugins/CodeMirror/mode/sql.js"></script>
<script src="/JS/Plugs/base64.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script>
var dbtool = {api:"Default.aspx?action=", field: {}};
dbtool.execute = function () {
    var sql = editor.getValue();
    if (ZL_Regex.isEmpty(sql)) { return false; }
    document.getElementById("execute_btn").disabled = "disabled";
    $("#result_div").load("Default_Result.aspx", { "sql": Base64.encode(sql) }, function () {
        document.getElementById("execute_btn").disabled = "";
        //$("#EGV tr:first").find("th").each(function () {
        //    $(this).css("width", $(this).width() + 10);
        //});

        //$("#EGV tr:eq(1)").find("td").each(function () {
        //    $(this).css("width", $(this).width() + 10);
        //});
    });
}
dbtool.table_filter = function () {
    var skey = $("#table_filter_t").val();
    if (ZL_Regex.isEmpty(skey)) { $(".table_item").show(); }
    else
    {
        skey = skey.replace(/ /ig, "").toUpperCase();
        $(".table_item").each(function () {
            if ($(this).text().toUpperCase().indexOf(skey) < 0) { $(this).hide(); }
            else { $(this).show(); }
        });
    }
}
dbtool.field.update = function (fdname) {
    var tbname = $(".table_item.active").text();
    if (ZL_Regex.isEmpty(tbname)) { alert("表名不能为空"); return false; }
    if (ZL_Regex.isEmpty(fdname)) { alert("字段名不能为空"); return false; }
    var json = { "tbname": tbname, "fdname": fdname, len: "", type: "" };
    var $len = $("#field_len_" + fdname);
    var $type = $("#field_type_" + fdname);
    json.len = $len.val(); json.type = $type.val();
    $.post(dbtool.api + "field_update", json, function (data) {
        APIResult.ifok(data, function (result) { alert("更新成功"); }, function (data) { alert("error:" + data); })
    })
}
//----------------------------------
var editor = null;
$(function () {
    editor = CodeMirror.fromTextArea(document.getElementById("sql_t"), {
        mode: "text/x-mssql",
        height: "300",
        lineNumbers: true,
        textWrapping: false,
        styleActiveLine: true,
    });
    editor.setSize('auto', '300');
    $("#sql_btns button").click(function () {
        var cmd = $(this).data("cmd");
        var sql = $("#sql_" + cmd).text() + " \r\r";
        editor.replaceSelection(sql, null, "paste");
    });
    $(".table_item").click(function () {
        $(this).addClass("active");
        $(this).siblings().removeClass("active");
        //加载该表的字段列表
        $("#result_div").load("Default_Field.aspx", { "tbname": $(this).text() });
    });
    $("#table_filter_t").keydown(function () {
        if (event.keyCode == 13) { dbtool.table_filter(); return false; }
    });
    //-------设置高度
    var height = $(window).height()-200;
    var width = $(window).width();
    $(".table_ul").css("height", height);
    //$("#result_div").css("height", (height - 310)).css("width", $("#data_panel").width());
	$("#result_div").css("height", (height - 310));


    //$("#result_div").scroll(function (e) {
    //    var $head = $("#EGV tr:first");
    //    if (e.target.scrollTop > 0 && !$head.hasClass("fixhead")) {
    //        $head.addClass("fixhead");
    //    }
    //    else if (e.target.scrollTop < 1) {$head.removeClass("fixhead");  }
    //});
})
</script>
</asp:Content>