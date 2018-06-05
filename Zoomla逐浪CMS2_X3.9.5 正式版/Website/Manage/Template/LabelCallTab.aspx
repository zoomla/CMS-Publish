<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabelCallTab.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.LabelCallTab" MasterPageFile="~/Manage/I/Index.master" ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>标签助手</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
        new Bread("LabelManage.aspx","标签管理 "),							
        new Bread() {url="", text="标签调用",addon="" }}
		)
    %>
    <div class="list_choice" id="labeldiv">
        <ul class="nav nav-tabs top_opbar mb-0">
            <li class="nav-item"><a class="nav-link active" href="#Tabs0" data-toggle="tab">自定标签</a></li>
            <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">字段标签</a></li>
            <li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab">系统标签</a></li>
            <li class="nav-item"><a class="nav-link" href="#Tabs3" data-toggle="tab">扩展函数</a></li>
        </ul>
<div class="container-fluid pr-0">
<div class="row sysRow table-responsive-md">
        <div class="col-lg-4 col-md-4 LabelCallTab_l">
            <div class="tab-content">
                <div class="tab-pane active" id="Tabs0" runat="server">
                    <div class="card">
                       <div class="card-header">
                            <asp:DropDownList ID="CustomLabel_DP" runat="server" CssClass="form-control" onchange="GetCustom(this);" EnableViewState="false"></asp:DropDownList>
                       </div>
                        <div class="card-body" id="CustomLabel_div"></div>
                    </div>
                </div>
                <div class="tab-pane" id="Tabs1">
                    <div class="card">
                        <div class="card-header">
                            <asp:DropDownList ID="Field_DP" runat="server" CssClass="form-control " onchange="GetField(this);"  EnableViewState="false"></asp:DropDownList>
                        </div>
                        <div class="card-body" id="Field_div"></div>
                    </div>
                </div>
                <div class="tab-pane pl-3" id="Tabs2">
                    <div class="list-group">
                        <asp:Label ID="lblSys" runat="server"  EnableViewState="false"></asp:Label>
                    </div>
                </div>
                <div class="tab-pane pl-3" id="Tabs3">
                    <div class="list-group">
                        <asp:Label ID="lblFun" runat="server"  EnableViewState="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-md-8 border p-0">
            <div class="ml-3">
                <%=ZoomLa.Safe.SafeC.ReadFileStr("/manage/Template/label.htm") %>
            </div>
            <div id="Textarea">
                <asp:TextBox TextMode="MultiLine" runat="server" ID="textContent" Style="max-width: 100%; width: 100%; height: 530px;" />
            </div>
        </div>
		</div>
		</div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
<link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
<script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
<script src="/Plugins/CodeMirror/mode/xml.js"></script>
<script src="/Plugins/CodeMirror/mode/javascript/javascript.js"></script>
<script src="/Plugins/CodeMirror/addon/selection/active-line.js"></script>
<script src="/Plugins/CodeMirror/addon/edit/matchbrackets.js"></script>
<script src="/Plugins/CodeMirror/mode/htmlmixed.js"></script>
<script src="/Plugins/CodeMirror/mode/css.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/Plugins/CodeMirror/LabelCall.js?v=10"></script>
<script src="/Design/JS/sea.js"></script>
<style>
.modal-sm{max-width:500px;width:50%;}
.modal-lg{width:1100px;}
</style>
<script>
    var base64 = null;
    seajs.use(["base64"], function (instance) {
        base64 = instance;
    })
    var diag = new ZL_Dialog();
    function opentitle(url, title) {
        diag.url = url;
        diag.title = title;
        diag.ShowModal();
    }
    function selFont() {
        var url = "<%:customPath2%>addon/fonticon/selfont.aspx";
        comdiag.maxbtn = false;
        comdiag.width = "modal-sm";
        ShowComDiag(url, "特色字体");
    }
    function selFontBack(str) {
        PasteValue(str);
    }
    function closeDiag() { closeCuModal(); }
    function closeCuModal() {
        diagLabel.CloseModal();
        CloseComDiag();
    }
</script>
</asp:Content>