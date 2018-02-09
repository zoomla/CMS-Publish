<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="create.aspx.cs" Inherits="ZoomLaCMS.webfont.write.create" MasterPageFile="../WebFont.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>新建字体</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fulid ZfontC_banner">
<h1><i class="fa fa-paint-brush"></i> 自由的字库创作之旅</h1>
</div>
<div class="container margin_t10">
    <table class="table table-bordered bgfff">
        <tr>
            <td class="td_m">字体名称：</td>
            <td>
                <asp:TextBox runat="server" ID="FontName_T" class="form-control" MaxLength="50" placeholder="请输入字体名称" /></td>
        </tr>
        <tr>
            <td>字体版本：</td>
            <td>
                <asp:DropDownList runat="server" ID="ZType_DP" class="form-control ">
                    <asp:ListItem Value="0" Selected="True">775字+符号</asp:ListItem>
                    <%--                <asp:ListItem Value="1">3500字+符号</asp:ListItem>
                <asp:ListItem Value="2">6763字+符号</asp:ListItem>--%>
                    <asp:ListItem Value="4">6790汉字+73数字符号</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>字体简介：</td>
            <td>
                <asp:TextBox runat="server" TextMode="MultiLine" ID="Remind_T" class="form-control" Style="height: 120px;" placeholder="请对你自己书写的字体进行简单的介绍"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button runat="server" ID="Save_Btn" Text="确定创建" OnClick="Save_Btn_Click" class="btn btn-info" OnClientClick="showWait();" />
                <a href="/webfont/write/" class="btn btn-link">返回列表</a>
            </td>
        </tr>
    </table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function showWait() { comdiag.maxbtn = false; comdiag.closebtn = false; comdiag.ShowMask("正在生成字体中,请等待"); }
</script>
</asp:Content>