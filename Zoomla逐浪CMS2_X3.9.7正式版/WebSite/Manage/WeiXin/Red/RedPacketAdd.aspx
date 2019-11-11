<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RedPacketAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.RedPacketAdd" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>红包管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:Label runat="server" ID="Bread_L"></asp:Label>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-bordered table-striped sys_table">
        <tr><th class="w12rem_lg">公众号</th><td><asp:Label runat="server" ID="Alias_L"></asp:Label></td></tr>
        <tr><th>红包名称</th><td><ZL:TextBox runat="server" ID="Name_T" AllowEmpty="false" class="form-control max20rem" MaxLength="16"/></td></tr>
        <tr><th>匹配码</th><td>
            <ZL:TextBox runat="server" ID="Flow_T" AllowEmpty="false" class="form-control max20rem" MaxLength="12"/>
            <p><small class="text-muted">领取红包需要核对匹配码与领取码</small></p>
                        </td></tr>
        <tr><th>金额范围</th><td>
            <ZL:TextBox runat="server" ID="AmountRange_T" AllowEmpty="false" class="form-control max20rem" Text="1-10"/>
            <p><small class="text-muted">可直接指定数值,或设为随机金额,格式:最小值-最大值</small></p>
           </td></tr>
        <tr><th>红包数量</th><td><ZL:TextBox runat="server" ID="RedNum_T" AllowEmpty="false" ValidType="IntPostive" class="form-control max20rem" Text="10"/></td></tr>
        <tr><th>红包码格式</th>
            <td>
               <ZL:TextBox runat="server" ID="CodeFormat_T" CssClass="form-control max20rem" Text="RD{000000AA}" AllowEmpty="false" MaxLength="20"/>
               <p><small class="text-muted">示例:RD{000000AA},0表示数字占位符,A表示字母占位符</small></p>
            </td>
        </tr>
        <tr><th>生效日期</th><td><asp:TextBox runat="server" ID="SDate_T" class="form-control max20rem" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });"/></td></tr>
        <tr><th>到期日期</th><td><asp:TextBox runat="server" ID="EDate_T" class="form-control max20rem" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });"/></td></tr>
        <tr><th>祝福语</th><td><asp:TextBox runat="server" ID="Wishing_T" class="form-control m50rem_50" MaxLength="64"/></td></tr>
        <tr><th>活动备注</th><td><asp:TextBox runat="server" ID="Remind_T" CssClass="form-control m50rem_50" MaxLength="128" /></td></tr>
        <tr><th></th><td>
            <asp:Button runat="server" ID="Save_Btn" Text="生成红包" class="btn btn-info" OnClick="Save_Btn_Click" />
         </td></tr>
    </table>
	</div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
