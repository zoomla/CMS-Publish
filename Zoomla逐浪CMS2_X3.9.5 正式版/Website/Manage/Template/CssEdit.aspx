<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CssEdit.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.CssEdit" MasterPageFile="~/Manage/I/Index.master"  ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
<link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
<script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
<script src="/Plugins/CodeMirror/mode/css.js"></script>
<script src="/Plugins/CodeMirror/addon/selection/active-line.js"></script>
<script src="/Plugins/CodeMirror/mode/htmlmixed.js"></script>
<title>样式编辑</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("TemplateSet.aspx","模板风格"),				
        new Bread("CssManage.aspx","风格管理"),				
        new Bread() {url=Request.RawUrl, text="样式编辑",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
    <div class="row sysRow list_choice">
        <div class="card card-info">
            <div class="card-header">
                 <div class="input-group max20rem">
                        <span class="input-group-prepend"><span class="input-group-text">风格名称：</span></span>
                        <input runat="server" id="TxtFilename" class="form-control text-right" />
                        <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">.css</span>
                        </div>
                    </div>
            </div>
            <div class="card-body" style="padding:0px;">
                <asp:TextBox ID="textContent" runat="server" TextMode="MultiLine" style="width:100%;" />
            </div>
            <div class="card-footer text-center">
                <asp:Button ID="Button1" runat="server" Text="保存风格" OnClick="Button1_Click" class="btn btn-outline-info" />
            </div>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        //var editor = CodeMirror.fromTextArea(document.getElementById("textContent"), {
        //    lineNumbers: true,
        //    styleActiveLine: true
        //});
        editor = CodeMirror.fromTextArea(document.getElementById("textContent"), {
            mode: "text/css",
            lineNumbers: true,
            textWrapping: false,
            styleActiveLine: true
        });
    </script>
</asp:Content>