<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailSendLog.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.MailSendLog" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>发送日志</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="BreadDiv" class="container-fluid mysite">
    <div class="row">
        <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
            <li><a href='<%=customPath2 %>Main.aspx'>工作台</a></li>
            <li><a href='MailList.aspx'>发送列表</a> </li>
            <li class="active"><a href="<%=Request.RawUrl %>">发送日志</a></li>
        </ol>
    </div>
</div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
         <asp:TemplateField HeaderText="收件人">
            <ItemTemplate>
                <%#ZoomLa.Common.StringHelper.SubStr(Eval("ToAddress","")) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="发送结果">
            <ItemTemplate>
              <%#ShowResult()%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="信息记录">
            <ItemTemplate>
                <%#Eval("ErrorMsg") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="发送时间" ItemStyle-CssClass="td_l"/>
    </Columns>
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script runat="server">
    public string ShowResult()
    {
        switch (Eval("Result", ""))
        {
            case "1":
                return "<span style='color:green;'>成功</span>";
            case "-1":
                return "<span style='color:red;'>失败</span>";
            default:
                return "未处理";
        }
    }
</script>
</asp:Content>