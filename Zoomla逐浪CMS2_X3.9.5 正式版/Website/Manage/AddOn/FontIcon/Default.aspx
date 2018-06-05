<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.FontIcon.Default" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>字库图标</title>
<link href="/dist/css/zfont.css" rel="stylesheet" type="text/css">
<link type="text/css" rel="stylesheet" href="/dist/css/ZLico.css" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),			
        new Bread() {url="Default.aspx", text="字体图标<a href='http://v.ziti163.com' target='_blank' class='reds'> [在线做字]</a>",addon="" }}
		)
    %>
	<div class="list_choice">
<ul class="nav nav-tabs">
    <li class="nav-item"><a class="nav-link active" href="#tab0" data-toggle="tab">WebFont</a></li>
    <li class="nav-item"><a class="nav-link" href="#tab2" data-toggle="tab">zico图标</a></li>
    <li class="nav-item"><a class="nav-link" href="#tab1" data-toggle="tab">其它图标</a></li>
</ul>
<div class="tab-content">
    <div class="tab-pane active fontWrap container-fluid" id="tab0">
	<div class="row">
        <asp:Repeater runat="server" ID="FontRPT" EnableViewState="false">
            <ItemTemplate>
			<div class="col-12 col-md-3">
                 <div class="<%#Eval("css") %> fonts_list w-100">我是<%#Eval("name") %></div>
			 </div>
            </ItemTemplate>
        </asp:Repeater>
		<a class="fonts_list p-3 ml-3" href="http://www.ziti163.com/webfont" target="_blank"><div title="更多webfont" class="ZoomlaXSongExtraLight">更多Webfont <i class="zi zi_plusSquare"></i></div></a>
    </div>
	</div>
    <div class="tab-pane" id="tab1">
        <iframe class="iconifr" src="/common/icon1.html"></iframe>
    </div>
    <div class="tab-pane" id="tab2">
        <iframe class="iconifr" src="/common/icon2.html"></iframe>
    </div>
</div>
<div class="modal fade" id="code_modal">
    <div class="modal-dialog modal-dialog-centered codeModal">
        <div class="modal-content">
            <div class="modal-header">
				<h4 class="modal-title">字体引用</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
			<div class="modal-body">
<textarea id="codeText" spellcheck="false">
</textarea>
        </div>
        </div>
    </div>
</div>
<div class="modal fade" id="icon_modal">
<div class="modal-dialog modal-dialog-centered iconModal">
        <div class="modal-content">
            <div class="modal-header">
				<div class="modal-title">图标引用</div>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
			<div class="modal-body">
			<div class="text-center"><i id="icon_i" class="zi zi_useralt" style="font-size:3em;"></i></div>
			<div class="text-center" id="icon_t"></div>
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
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
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