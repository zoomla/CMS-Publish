<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendTlpMsg.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.SendTlpMsg"  MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模板消息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
        new Bread("/{manage}/WeiXin/WxAppManage.aspx","公众号管理"),
        new Bread() {url="", text="模板消息",addon= "" }}
        )
    %>
	<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-bordered table-striped sys_table">
        <tr>
            <th class="w12rem_lg">模板标题</th>
            <td>
                <asp:Label runat="server" ID="title_L" />
            </td>
        </tr>
        <tr>
            <th>详情URL</th>
            <td>
                <ZL:TextBox runat="server" ID="Url_T" AllowEmpty="false" CssClass="form-control max20rem" />
            </td>
        </tr>
        <tr>
            <th>模板内容</th>
            <td>
                <asp:Label runat="server" ID="content_L" /></td>
        </tr>
        <tr>
            <th>JSON样例</th>
            <td>
                <asp:Label runat="server" ID="data_L" /></td>
        </tr>
        <tr>
            <th>模板示例</th>
            <td>
                <asp:Label runat="server" ID="ex_L" />
            </td>
        </tr>
        <%--        <tr>
            <th>消息内容</th>
            <td><%=GetInputHtml() %></td>
        </tr>
        <tr>
            <th>参数颜色</th>
            <td><%=GetColorHtml() %></td>
        </tr>--%>
        <label runat="server" id="ParasTr"></label>
        <tr>
            <th></th>
            <td>
                <asp:Button runat="server" ID="Send_B" OnClick="Send_B_Click" Text="发 送" CssClass="btn btn-info" />
            </td>
        </tr>
    </table>
	</div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $(function () {
            $(".col_t").css("margin-right", 15);
            $(".col_t").click(function () {
                var cid = $(this).attr("name");
                $("#" + cid).click();
            });
            $(".col_c").change(function () {
                var cid = $(this).attr("id");
                $("input[name=" + cid + "]").val($(this).val()).css("color", $(this).val());
            });
        });
    </script>
</asp:Content>
