<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ZoomLaCMS.Plugins.Office._default" MasterPageFile="~/Common/Master/Empty.master" EnableViewState="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div style="width:100%;background-color:rgba(128, 128, 128, 0.30);text-align:center;padding:10px;">
<asp:TextBox runat="server" id="fname_t" class="form-control text_300" placeholder="文件名称" />
<input type="button" value="保存文档" class="btn btn-info" onclick="saveToServer('save');"/>
<input type="button" value="保存并关闭" class="btn btn-info" onclick="saveToServer('saveAndExit');"/>
<input type="button" value="直接退出" class="btn btn-info" onclick="closeDiag();"/>
</div>
<div><script src="LoadWebOffice.js"></script></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<%--<script src="/JS/ICMS/ZL_Common.js"></script>--%>
<script type="text/javascript" FOR="WebOffice1" EVENT="NotifyCtrlReady">
<!--
    //WebOffice1_NotifyCtrlReady()			// 在装载完Weboffice(执行<object>...</object>)控件后执行 "WebOffice1_NotifyCtrlReady"方法
    //-->
</script>
<script>
    function WebOffice1_NotifyCtrlReady() {
        document.all.WebOffice1.HideMenuItem(0x01 + 0x02 + 0x04 + 0x10 + 0x20 + 0x2000);
        document.all.WebOffice1.OptionFlag |= 0x0020;
        document.all.WebOffice1.OptionFlag &= 0xffdf;
        if (word.guid == "") {
            document.all.WebOffice1.LoadOriginalFile("", "doc");
        }
        else { document.all.WebOffice1.LoadOriginalFile(getServerUrl() + "db_getword", "doc"); }
    }
    function saveToServer(after) {
        if (ZL_Regex.isEmpty($("#fname_t").val())) { alert("文件名称不能为空"); return; }
        var returnValue;
        document.all.WebOffice1.HttpInit();
        document.all.WebOffice1.HttpAddPostString("username", "公文套红");//这些上传给word文档处理的,并不会在路径中
        document.all.WebOffice1.HttpAddPostCurrFile("AipFile", "");
        returnValue = document.all.WebOffice1.HttpPost(getServerUrl() + "db_saveword");
        //-----------------------------
        var model = APIResult.getModel(returnValue);
        if (APIResult.isok(model))
        {
            word.guid = model.result;
            switch (after)
            {
                case "save":
                    alert("保存成功");
                    break;
                case "saveAndExit":
                    closeDiag();
                    break;
            }
        }
        else
        {
            alert("保存失败,原因:" + returnValue);
        }
    }
    function closeDiag() { if (parent && parent.closeDiag) { parent.closeDiag(word.guid); } }
    function getServerUrl() {
        var fname = encodeURI($("#fname_t").val());
        var url = "<%=ZoomLa.Components.SiteConfig.SiteInfo.SiteUrl%>/Plugins/Office/OfficeAction.ashx?guid="+word.guid+"&fname=" + fname + "&action=";
        return url;
    }
    var word = { guid: "<%:FileGuid%>" };
    //-------------------------
    $(function () {
        setTimeout(WebOffice1_NotifyCtrlReady, 2000);
    })
</script>
</asp:Content>