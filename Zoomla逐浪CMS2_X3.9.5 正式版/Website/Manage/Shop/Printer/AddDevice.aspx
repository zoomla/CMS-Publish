<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDevice.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Printer.AddDevice"  MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>设备管理</title>
    <link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ListDevice.aspx","智能硬件"),
        new Bread("ListDevice.aspx","设备列表"),
        new Bread() {url="", text="设备管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered sys_table">
        <tr>
            <th class="w12rem_lg">商户编码</th>
            <td>
                <asp:TextBox ID="MemberCode_T" runat="server" class="form-control max20rem" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="MemberCode_T" ErrorMessage="商户编码不能为空" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <th>API密钥</th>
            <td>
                <asp:TextBox ID="SecurityKey_T" runat="server" class="form-control max20rem" MaxLength="30" />
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="SecurityKey_T" ErrorMessage="API密钥不能为空" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <th>设备名称</th>
            <td>
                <asp:TextBox ID="Alias_T" runat="server" class="form-control max20rem" MaxLength="30" />
                <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="Alias_T" ErrorMessage="别名不能为空" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <th>所属门店</th>
            <td>
                <asp:TextBox ID="ShopName_T" runat="server" class="form-control max20rem" MaxLength="50" /></td>
        </tr>
        <tr>
            <th>设备编码</th>
            <td>
                <asp:TextBox ID="DeviceNo_T" runat="server" class="form-control max20rem" />
                <asp:RequiredFieldValidator runat="server" ID="R2" ControlToValidate="DeviceNo_T" ErrorMessage="设备编码不能为空" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <th>默认设备</th>
            <td>
                <input type="checkbox" runat="server" id="IsDefault_C" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th>备注信息</th>
            <td>
                <asp:TextBox ID="Remind_T" TextMode="MultiLine" runat="server" class="form-control m50rem_50" /></td>
        </tr>
        <tbody runat="server" id="addon_tb" visible="false">
            <tr>
                <th>激活日期</th>
                <td>
                    <asp:Label ID="Since_L" runat="server" /></td>
            </tr>
            <%--    <tr>
                <th>连接状态</th>
                <td>
                    <asp:Label ID="DeviceStatus_L" runat="server" /></td>
            </tr>--%>
        </tbody>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Save_Btn" class="btn btn-info" runat="server" OnClick="Save_Btn_Click" Text="保存信息" />
                <a href="ListDevice.aspx" class="btn btn-outline-info">返回列表</a>
            </td>
        </tr>
    </table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/dist/js/bootstrap-switch.js"></script>
</asp:Content>

