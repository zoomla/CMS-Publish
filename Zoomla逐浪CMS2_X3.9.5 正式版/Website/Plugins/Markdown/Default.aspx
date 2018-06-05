<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Plugins.Markdown.Default" MasterPageFile="~/Common/Master/Empty.master" ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>MarkDown编辑器</title>
<link rel="stylesheet" href="/Plugins/Markdown/css/editormd.min.css" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="editormd" style="max-width:1920px;">
    <textarea style="display:none;" runat="server" id="content_md"></textarea>
</div>
<div class="btn_wrap">
    <div class="input-group" style="width:400px;margin:0 auto;">
        <asp:TextBox runat="server" ID="Title_T" placeholder="内容标题" class="form-control"></asp:TextBox>
        <span class="input-group-btn">
            <button type="button" class="btn btn-info" onclick="zlmd.down();">下载MD文档</button>
            <button type="button" class="btn btn-info" onclick="zlmd.check();">保存内容</button>
        </span>
    </div>
    </div>
    <div style="display:none;">
        <asp:Button runat="server" ID="Save_Btn" class="btn btn-info" Text="保存内容" OnClick="Save_Btn_Click"/>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.btn_wrap{position:fixed;background-color:rgba(233, 233, 233, 0.52);width:100%;padding:10px 15px;text-align:center;
bottom:0px;left:0px;z-index:9999;

}
</style>
<script src="/Plugins/Markdown/editormd.js"></script>
<script src="/JS/Controls/B_User.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script type="text/javascript">
    var buser = new B_User();
    var diag = new ZL_Dialog();
    $(function () {
        $("#editormd").height($(window).height());
        var editor = editormd("editormd", {
            path: "/Plugins/Markdown/lib/",
            //autoHeight: true,
            //width: 1920,
            height:$(window).height(),
            htmlDecode: "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启    
            //toolbar  : false,             //关闭工具栏
            //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
            saveHTMLToTextarea: true,    // 保存 HTML 到 Textarea
            searchReplace: true,
            //watch : false,                // 关闭实时预览
            emoji: true,
            taskList: true,
            flowChart: true,
            sequenceDiagram: true,
            imageUpload: true,
            imageFormats: ["jpg", "jpeg", "gif", "png"],
            imageUploadURL: zlmd.apiUrl + "upload",
            onload: function () { },
            success: function () { }
        });
        buser.IsLogged(function () { });
    });
    function LoginSuccess() {
        diag.CloseModal();
        $("#Save_Btn").click();
    }
    function AutoHeight() { diag.AutoHeight(); }

    zlmd = { apiUrl: "/Plugins/Markdown/API.aspx?action=" };
    zlmd.check = function () {
        var title = $("#Title_T").val();
        if (ZL_Regex.isEmpty(title)) { alert("标题不能为空"); return false; }
        buser.IsLogged(function (data, flag) {
            if (flag) {
                if (confirm("确定要保存吗?")) { $("#Save_Btn").click(); }              
            }
            else {
                diag.width = "minwidth";
                diag.title = "用户登录";
                diag.url = "/com/login_Ajax";
                diag.maxbtn = false;
                diag.backdrop = true;
                diag.ShowModal();
            }
        });

    }
    zlmd.down = function () {
        var ref = this;
        var content = "";
        var $form = $('<form target="_blank"  method="post" action="'+ref.apiUrl+'down"></form>');
        $form.append('<input type="hidden" name="content" value=' + $("#content_md").val() + '>');
        $("body").append($form);//兼容IE
        $form.submit();
        $form.remove();
    }
</script>
</asp:Content>