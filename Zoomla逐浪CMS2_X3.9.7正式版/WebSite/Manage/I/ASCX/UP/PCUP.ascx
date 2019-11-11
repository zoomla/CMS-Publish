<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PCUP.ascx.cs" Inherits="Extend_Common_PCUP" %>


<div id="webup_wrap_<%:Field %>" class="webup_wrap">
    <div style="margin-bottom: 5px;">
    <input type="button" id="webup_btn_<%:Field %>" value="图片上传" class="btn btn-info btn-sm imgup_btn" />
</div>
<div id="webup_div_<%=Field%>" class="uploader webup_div">
    <ul class="filelist"></ul>
</div>
<input type="hidden" id="<%=GetHidName() %>" name="<%=GetHidName() %>" class="webup_hid"/>
</div>
<script runat="server">
    public string GetHidName()
    {
        //兼容
        if (string.IsNullOrEmpty(Field)) { return "Attach_Hid"; }
        else { return "webup_hid_" + Field; }
    }
</script>
<script>
    $(function () {
        var myup = new MFileUP();
        var imgs = "<%=Value%>".split('|');
        myup.config.json.ashx = "action=OAattach";
        myup.config.json.accept = "img";
        myup.config.json.fileNum = JSON.parse("<%:MaxCount%>");
        myup.config.id = "webup_div_<%=Field%>";
        myup.config.hid = "<%=GetHidName() %>";
        myup.config.attachDiag = new ZL_Dialog();
        myup.config.upcallback = "";
        for (var i = 0; i < imgs.length; i++) {
            if (!imgs[i] || imgs[i] == "") { continue; }
            else { myup.AddAttach("", { _raw: imgs[i] }); }
            //$(".file-panel").remove();
        }
        if (!window.upcallback) { window.upcallback = {}; }
        window.upcallback[myup.config.id] = function (file, ret, pval) {
            myup.AddAttach(file, ret, pval);
        }
        $("#webup_btn_<%:Field%>").click(function () { myup.ShowFileUP(); });
    })
</script>