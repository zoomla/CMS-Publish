<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabelCallTab.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.LabelCallTab" MasterPageFile="~/Manage/I/Default.master" ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>标签助手</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="labeldiv">
        <ul class="nav nav-tabs top_opbar" style="margin-bottom:0px;border-bottom:none;">
            <li class="active"><a href="#Tabs0" data-toggle="tab">自定标签</a></li>
            <li><a href="#Tabs1" data-toggle="tab">字段标签</a></li>
            <li><a href="#Tabs2" data-toggle="tab">系统标签</a></li>
            <li><a href="#Tabs3" data-toggle="tab">扩展函数</a></li>
        </ul>
        <div class="col-lg-4 col-md-4" style="height:536px;max-width:450px; overflow-y:auto;border:1px solid #ddd;border-right:none;padding:0px;">
            <div class="tab-content">
                <div class="tab-pane active" id="Tabs0" runat="server">
                    <div class="panel panel-default">
                       <div class="panel-heading">
                            <asp:DropDownList ID="CustomLabel_DP" runat="server" CssClass="form-control text_md" onchange="GetCustom(this);" EnableViewState="false"></asp:DropDownList>
                       </div>
                        <div class="panel-body" id="CustomLabel_div"></div>
                    </div>
                </div>
                <div class="tab-pane" id="Tabs1">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <asp:DropDownList ID="Field_DP" runat="server" CssClass="form-control text_md" onchange="GetField(this);"  EnableViewState="false"></asp:DropDownList>
                        </div>
                        <div class="panel-body" id="Field_div"></div>
                    </div>
                </div>
                <div class="tab-pane" id="Tabs2">
                    <div class="list-group">
                        <asp:Label ID="lblSys" runat="server"  EnableViewState="false"></asp:Label>
                    </div>
                </div>
                <div class="tab-pane" id="Tabs3">
                    <div class="list-group">
                        <asp:Label ID="lblFun" runat="server"  EnableViewState="false"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-md-8" style="border:1px solid #ddd;padding:0px;">
            <div style="margin-left:30px;">
                <%=ZoomLa.Safe.SafeC.ReadFileStr("/manage/Template/label.htm") %>
            </div>
            <div id="Textarea">
                <asp:TextBox TextMode="MultiLine" runat="server" ID="textContent" Style="max-width: 100%; width: 100%; height: 530px;" />
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/App_Themes/V3.css" rel="stylesheet" />
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
<script src="/Plugins/CodeMirror/LabelCall.js"></script>
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