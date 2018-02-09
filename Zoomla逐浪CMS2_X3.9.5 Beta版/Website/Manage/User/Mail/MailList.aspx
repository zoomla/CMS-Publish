<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailList.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.MailList" ValidateRequest="false" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>EMail发送列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=customPath2 %>Main.aspx'>工作台</a></li>
                <li class="active"><a href='<%=Request.RawUrl %>'>发送列表</a> 
                    [<a href='MailSend.aspx'><i class="fa fa-envelope"></i> 发送新邮件</a>]
                    [<a href='<%=customPath2 %>Config/MailConfig.aspx'><i class="fa fa-cog"></i> 邮箱配置</a>]
                </li>
                <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="fa fa-search"></i></a></div>
                <div id="sel_box" class="padding5">
                    <div class="input-group">
                        <input type="text" id="skey" runat="server" class="form-control mvcparam" placeholder="请输入邮件标题" onkeypress="selbox.search();" />
                        <span class="input-group-btn">
                            <asp:LinkButton runat="server" class="btn btn-default" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="fa fa-search"></i></asp:LinkButton>
                        </span>
                    </div>
                </div>
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
        <asp:TemplateField HeaderText="标题">
            <ItemTemplate>
               <%#Eval("Subject") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="发件人">
            <ItemTemplate>
                <%#Eval("FromEmail")+"("+Eval("FromName")+")" %>
            </ItemTemplate>
        </asp:TemplateField>
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
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="发送时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a class="option_style" href="MailSend.aspx?EMailID=<%#Eval("ID") %>"><i class="fa fa-eye"></i> 邮件内容</a>
                <a class="option_style" href="MailSendLog.aspx?id=<%#Eval("ID") %>"><i class="fa fa-magic"></i>发送日志</a>
            </ItemTemplate>
        </asp:TemplateField>
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