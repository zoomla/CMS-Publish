<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trademark.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Trademark" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加品牌</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("ProductManage.aspx","商城管理"),
	new Bread("TrademarkManage.aspx","品牌列表"),
	new Bread(){url="Trademark.aspx", text="品牌管理"}
	}) %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg"><strong>品牌名称</strong></th>
            <td>
                <ZL:TextBox ID="Trname" runat="server" class="form-control max20rem"  AllowEmpty="false"></ZL:TextBox>
            </td>
        </tr>
        <tr>
            <th><strong>所属厂商</strong></th>
            <td>
                <asp:DropDownList ID="Producer_DP" runat="server" CssClass="form-control max20rem" DataTextField="Producername" DataValueField="ID"></asp:DropDownList></td>
        </tr>
        <tr>
            <th><strong>是否推荐</strong> </th>
            <td>
              <input type="checkbox" runat="server" id="isbest_chk" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th><strong>品牌分类</strong></th>
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
            <th><strong>品牌照片</strong></th>
            <td>
                <ZL:SFileUp ID="SFile_Up" runat="server" FType="Img" MaxWidth="500" MaxHeight="500" />
            </td>
        </tr>
        <tr class="WebPart">
            <th><strong>品牌简介</strong></th>
            <td>
                <textarea cols="80" id="TrContent" name="TrContent" style="width: 99%; height: 200px;" rows="20" runat="server"></textarea>
                <%=Call.GetUEditor("TrContent",4) %>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="保存设置" class="btn btn-info" OnClick="Button1_Click" />
                <a href="TradeManage.aspx" class="btn btn-outline-info">返回列表</a>
            </td>
        </tr>
    </table>
	</div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script>
</asp:Content>
