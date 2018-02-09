<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMisModel.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.AddMisModel"  MasterPageFile="~/Manage/I/Default.master" ValidateRequest="false" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>套红管理</title>
<%--<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td class="td_l">模板名称:</td>
                <td>
                    <asp:TextBox ID="ModelName" CssClass=" form-control text_300" runat="server"></asp:TextBox>
                    <span style="color: #f00">*</span>
                    <asp:RequiredFieldValidator ID="r1" ControlToValidate="ModelName" runat="server" ErrorMessage="名称不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="tdbg">
                <td>模板类型:</td>
                <td>
                    <asp:DropDownList runat="server" ID="DocType_DP" CssClass="form-control text_300">
                        <asp:ListItem Value="0">公文</asp:ListItem>
                        <asp:ListItem Value="1">事务</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>绑定节点:</td>
                <td>
                    <asp:TextBox runat="server" ID="bindNodeT" CssClass="form-control text_300" /><span><span class="rd_green">(选填)</span></span>
                </td>
            </tr>
            <tr>
                <td>公文Word套红:</td>
                <td>
                    <input type="button" class="btn btn-info" value="打开套红模板" onclick="showTlpDiag();" />
                    <asp:HiddenField runat="server" ID="FileGuid_Hid" />
                </td>
            </tr>
            <tr runat="server" visible="false">
                <td>事务套红<br />(仅用于事务流程)</td>
                <td>
                    <asp:TextBox ID="ModelContent" Style="height: 300px;" TextMode="MultiLine" runat="server" Width="815"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="BtnSav" runat="server" CssClass="btn btn-primary" OnClick="BtnSav_Click" Text="保存信息" />
                    <button type="button" class="btn btn-primary" onclick="location='MisModelManage.aspx'">返回列表</button>
                </td>
            </tr>
        </table>
    </div>
<%--<%=Call.GetUEditor("ModelContent",3) %>--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function showTlpDiag() { ShowComDiag("/Plugins/Office/Default.aspx?guid=" + $("#FileGuid_Hid").val(),"套红模板"); }
    function closeDiag(guid) { $("#FileGuid_Hid").val(guid); CloseComDiag(); }
</script>
</asp:Content>
