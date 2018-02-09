<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.FontIcon.Default" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>字库图标</title>
<link href="/dist/css/zfont.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="/dist/css/ZLico.css" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
    <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
    <li><a href='Default.aspx'>字体图标</a> <a href='http://v.ziti163.com' target="_blank" class='reds'>[在线做字]</a></li>
</ol>
<ul class="nav nav-tabs">
    <li class="active"><a href="#tab0" data-toggle="tab">WebFont</a></li>
    <li><a href="#tab1" data-toggle="tab">官方图标</a></li>
    <li><a href="#tab2" data-toggle="tab">其它图标</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane margin_t10 active fontWrap" id="tab0">
        <asp:Repeater runat="server" ID="FontRPT" EnableViewState="false">
            <ItemTemplate>
                 <div class="<%#Eval("css") %>">我是<%#Eval("name") %></div>
            </ItemTemplate>
        </asp:Repeater>
		<a href="http://www.ziti163.com/webfont" target="_blank"><div title="更多webfont" class="ZoomlaXSongExtraLight">更多Webfont <i class="fa fa-plus-square-o"></i></div></a>
    </div>
    <div class="tab-pane" id="tab1">
        <iframe class="iconifr" src="/common/icon1.html"></iframe>
    </div>
    <div class="tab-pane" id="tab2">
        <iframe class="iconifr" src="/common/icon2.html"></iframe>
    </div>
</div>
<div class="modal fade" id="code_modal">
    <div class="modal-dialog codeModal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">字体引用</h4>
            </div>
<textarea id="codeText" spellcheck="false">
</textarea>
        </div>
    </div>
</div>
<div class="modal fade" id="icon_modal">
<div class="modal-dialog iconModal">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">图标引用</h4>
                <div class="text-center"><i id="icon_i" class="fa fa-user" style="font-size:3em;"></i></div>
                <div class="margin_t10 text-center" id="icon_t"></div>
            </div>
            <%--<div class="modal-footer" style="text-align:center;"><input id="icon_btn" type="button" value="复制图标" onclick="" class="btn btn-info" /></div>--%>
        </div>
    </div>
</div>
<div style="display:none;">
<textarea id="codeTextTlp">
快速一步式网页引用方法（直接在网页中放入下面代码）
<style>
    @import url("https://code.z01.com/Zfont.css"); /*此行相同页面只需引用一次*/
    .{name} { font-family: '{name}'; }
</style>
<div class="{name}">{text}</div>


CSS与HTML分离引用方法
/*第一步：将下面代码放在CSS中*/
@import url("Zfont.css");
.{name}{font-family:'{name}';}
/*第二步：网页中直接引用字体名称，引用方法为：
<div class="{name}">{text}</div>

</textarea>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.fontWrap div{font-size:40px;cursor:pointer;float:left;background-color:#5bc0de;color:#fff;
              width:420px;text-align:center;height:120px;margin-bottom:5px;line-height:120px;border-radius:5px;margin-right:5px;
              box-shadow: rgba(0, 0, 0, 0.0980392) 0px 2px 5px 0px, rgba(0, 0, 0, 0.0784314) 0px 2px 10px 0px;overflow:hidden;text-overflow:ellipsis;
              }
.fontWrap div:hover{background-color:#0f6983;}
.iconifr{width:100%;height:500px;border:none;}
.codeModal{width:80%;max-width:1024px;}
.codeModal #codeText{width:100%;height:500px;resize:none;border:none;padding:10px 8px;}
.iconModal{width:50%;max-width:300px;}
</style>
<script src="/Plugins/Ueditor/third-party/zeroclipboard/ZeroClipboard.min.js"></script>
<script>
    $(function () {
        var height=$(window).height()-100;
        $(".iconifr").css("height", height);
        $(".fontWrap div").attr("title", "点击引用字体");
        $(".fontWrap div").click(function () {
            var name = $(this).attr("class");
            var text = $(this).text();
            $("#codeText").text($("#codeTextTlp").text().replace(/{name}/g, name).replace(/{text}/g, text));
            $("#code_modal").modal({});
        });
        //---------------------
        //var client = new ZeroClipboard(document.getElementById("icon_btn"));
        //client.on("ready", function (readyEvent) {
        //    client.on('copy', function (e) { client.setText($("#icon_t").text()); });
        //    client.on("aftercopy", function (event) { alert("复制完成"); });
        //});
    })
    var zlicon = {
        back: function (icon) {
            $("#icon_i").attr("class", icon);
            $("#icon_t").text(icon);
            $("#icon_modal").modal({});
        }
    }
</script>
</asp:Content>