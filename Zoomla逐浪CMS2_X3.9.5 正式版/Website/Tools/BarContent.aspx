<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarContent.aspx.cs" Inherits="ZoomLaCMS.Tools.BarContent" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>贴吧内容解密</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="row" style="margin-top:55px;">
    <div class="col-6">
        <asp:TextBox runat="server" ID="CompressContent_T" TextMode="MultiLine" class="form-control fullheight" Rows="20" placeholder="请拷贝入待解压缩字符串" style="resize: none;"></asp:TextBox>
    </div>
    <div class="col-6" style="border:1px solid #ddd;">
        <div runat="server" id="UnCompressContent" class="fullheight" style="overflow:auto;">解压缩结果</div>
    </div>
    
</div>
<div class="fixed-top container-fulid bg-dark p-1">
<a href="../Tools/"><i class="zi zi_redoalt" aria-hidden="true"></i> 返回工具箱</a>
    <asp:Button runat="server" ID="Sure_Btn" class="btn btn-info btn-sm" Text="点击解压缩字符串->" OnClick="Sure_Btn_Click" OnClientClick="return subCheck();"/>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/ZL_Regex.js"></script>
<script>
    $(function () {
        $(".fullheight").css("height", $(document).height() - 60);
    })
    function subCheck() {
        if (ZL_Regex.isEmpty($("#CompressContent_T").val()))
        {
            alert("待解压缩字符串不能为空"); return false;
        }
        return true;
    }
</script>
</asp:Content>