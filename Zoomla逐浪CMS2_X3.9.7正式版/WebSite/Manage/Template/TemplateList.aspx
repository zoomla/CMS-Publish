<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateList.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.TemplateList" MasterPageFile="~/Common/Common.master" %>
<%@ Register Src="~/Manage/I/ASCX/FileBrower.ascx" TagPrefix="ZL" TagName="FileBrower" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">

<title>选择模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="height:350px;overflow-y:auto;">
         <ZL:FileBrower runat="server" ID="FileBrower"  />
    </div>
    <div class="input-group">
        <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1">文件名称</span>
        </div>
        <input type="text" id="fname_t" class="form-control max20rem" />
        <div class="input-group-append">
            <input type="button" id="BtnSubmit" class="btn btn-info" value="确定" onclick="SureSel()" />
            <input type="button" id="BtnCancel" class="btn btn-info" value="关闭" onclick="closeDiag()" />
        </div>
    </div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script>
    var fb = {
        choose: function (path) { $("#fname_t").val(path); }
    };
    function SureSel() {
        var name = "<%:Request["OpenerText"] %>";
        var val = document.getElementById('fname_t').value;
        parent.Tlp_SetValByName(name, val);
        closeDiag();
    }
    function closeDiag() {
        if (parent.CloseDiag) { parent.CloseDiag(); }
        if (parent.CloseComDiag) { parent.CloseComDiag(); }
    }
</script>
</asp:Content>