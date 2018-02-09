<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trademark.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Trademark" ValidateRequest="false" MasterPageFile="~/Manage/I/Default.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加品牌</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="td_m"><strong>品牌名称：</strong></td>
            <td>
                <ZL:TextBox ID="Trname" runat="server" class="form-control text_300"  AllowEmpty="false"></ZL:TextBox>
            </td>
        </tr>
        <tr>
            <td><strong>所属厂商：</strong></td>
            <td>
                <asp:DropDownList ID="Producer_DP" runat="server" CssClass="form-control text_300" DataTextField="Producername" DataValueField="ID"></asp:DropDownList></td>
        </tr>
        <tr>
            <td><strong>是否推荐：</strong> </td>
            <td>
              <input type="checkbox" runat="server" id="isbest_chk" class="switchChk" />
            </td>
        </tr>
        <tr>
            <td><strong>品牌分类：</strong></td>
            <td>
                <asp:RadioButtonList ID="TrClass" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="大陆品牌">大陆品牌</asp:ListItem>
                    <asp:ListItem Value="港台品牌">港台品牌</asp:ListItem>
                    <asp:ListItem Value="日韩品牌">日韩品牌</asp:ListItem>
                    <asp:ListItem Value="欧美品牌">欧美品牌</asp:ListItem>
                    <asp:ListItem Value="其他品牌">其他品牌</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td><strong>品牌照片：</strong></td>
            <td>
                <ZL:SFileUp ID="SFile_Up" runat="server" FType="Img" MaxWidth="500" MaxHeight="500" />
            </td>
        </tr>
        <tr class="WebPart">
            <td><strong>品牌简介：</strong></td>
            <td>
                <textarea cols="80" id="TrContent" name="TrContent" style="width: 99%; height: 200px;" rows="20" runat="server"></textarea>
                <%=Call.GetUEditor("TrContent",4) %>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="保存设置" class="btn btn-primary" OnClick="Button1_Click" />
                <a href="TradeManage.aspx" class="btn btn-default">返回列表</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script>
</asp:Content>
