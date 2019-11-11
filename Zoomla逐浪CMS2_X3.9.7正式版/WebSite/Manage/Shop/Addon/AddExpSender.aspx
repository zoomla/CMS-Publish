<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddExpSender.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.AddExpSender" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑发件信息</title>
	<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("../ProductManage.aspx","商城管理"),
	new Bread("/{manage}/Shop/Addon/exp/DeliverType.aspx","商城设置"),
	new Bread("ExpSenderManage.aspx","发件信息"),
	new Bread(){url="", text="编辑发件信息"}
	}) %>
    <link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-striped table-bordered sys_table">
        <tr>
            <th class="w12rem_lg"><strong>收件人</strong></th>
            <td>
                <ZL:TextBox ID="Name_T" runat="server" CssClass="form-control text_300" AllowEmpty="false" />
            </td>
        </tr>
        <tr>
            <th><strong>公司名称</strong></th>
            <td>
                <ZL:TextBox ID="CompName_T" runat="server" CssClass="form-control text_300" />
            </td>
        </tr>
        <tr>
            <th><strong>手机号码</strong></th>
            <td>
                <ZL:TextBox ID="Mobile_T" runat="server" CssClass="form-control text_300" ValidType="MobileNumber" AllowEmpty="false" />
            </td>
        </tr>
        <tr>
            <th><strong>是否默认</strong></th>
            <td>
                <input type="checkbox" runat="server" id="IsDefault_C" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th><strong>详细地址</strong></th>
            <td>
                <ZL:TextBox ID="Address_T" runat="server" CssClass="form-control m50rem_50" TextMode="MultiLine"  AllowEmpty="false" />
            </td>
        </tr>
        <tr>
            <th><strong>备注信息</strong></th>
            <td>
                <asp:TextBox ID="Remind_T" TextMode="MultiLine" runat="server" class="form-control m50rem_50" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Save_Btn" class="btn btn-info" runat="server" OnClick="Save_Btn_Click" Text="保存信息" />
                <a href="ExpSenderManage.aspx" class="btn btn-outline-info">返回列表</a>
            </td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/dist/js/bootstrap-switch.js"></script>
</asp:Content>