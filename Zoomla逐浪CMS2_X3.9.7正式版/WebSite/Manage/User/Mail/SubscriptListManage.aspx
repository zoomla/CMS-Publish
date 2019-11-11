<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubscriptListManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.SubscriptListManage"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件订阅</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("SubscriptListManage.aspx?menu=all","订阅管理"),
	new Bread() {url="", text="邮件订阅",addon= "" }}
	)
%>

<ul class="nav nav-tabs list_choice" role="tablist">
    <li class="nav-item" id="tab-10" role="presentation"><a class="nav-link" href="SubscriptlistManage.aspx" role="tab">全部</a></li>
    <li class="nav-item" id="tab1" role="presentation"><a class="nav-link" href="SubscriptlistManage.aspx?audit=1"  role="tab">正常</a></li>
    <li class="nav-item" id="tab-1" role="presentation"><a class="nav-link" href="SubscriptlistManage.aspx?audit=-1" role="tab">退订</a></li>
    <li class="nav-item" id="tab0" role="presentation"><a class="nav-link" href="SubscriptlistManage.aspx?audit=0" role="tab">停用</a></li>
</ul>
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" OnRowCommand="EGV_RowCommand"  EnableTheming="False"  
    CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
    OnPageIndexChanging="EGV_PageIndexChanging"> 
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
            <ItemStyle CssClass="td_s" />
        </asp:TemplateField>
        <asp:BoundField DataField="EMail" HeaderText="EMail" />
        <asp:TemplateField HeaderText="用户名">
            <ItemTemplate>
                <%#GetUserName() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Source" HeaderText="来源网站" />
        <asp:BoundField DataField="browser" HeaderText="浏览器" />
        <asp:BoundField DataField="IP" HeaderText="来源IP" />
        <asp:TemplateField HeaderText="状态">
            <ItemTemplate>
                <%#GetStatus() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作">
            <ItemTemplate>
                <asp:LinkButton runat="server" CommandName="Del" OnClientClick="return confirm('是否确定删除!')" CommandArgument='<%#Eval("ID") %>'><i class="zi zi_trashalt" zico="垃圾箱竖条"></i>删除</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<div class="alert alert-light">
<asp:Button runat="server" ID="BatRe_Btn" class="btn btn-outline-info mb-1" Text="恢复正常" OnClick="BatOperation_Btn_Click" CommandName="normal"/>
<asp:Button runat="server" ID="BatBack_Btn" class="btn btn-outline-info mb-1" Text="批量退订" OnClick="BatOperation_Btn_Click" CommandName="back"/>
<asp:Button runat="server" ID="BatStop_Btn" class="btn btn-outline-info mb-1" Text="批量停用" OnClick="BatOperation_Btn_Click" CommandName="stop" />
<asp:Button ID="Dels_Btn" runat="server" CssClass="btn btn-outline-danger mb-1" Text="批量删除" OnClick="Dels_Btn_Click" OnClientClick="return confirm('是否确定删除选定项!')" />
</div>
<div class="alert alert-info">
    1,在需要订阅邮件功能的页面上引用此(<%:"<script src='/JS/ICMS/ZL_Subscript.js'></script>" %>)代码<br />
    2,用户在填完邮箱并点击订阅后会向用户发送确认邮件，未确认订阅邮件的状态为"停用",已确认订阅邮件的状态为"正常"
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $(function () {
            if (window.top != window.self) {//选择模式

            }
        });
        function ShowTab(id) {
            $(".nav-tabs li").find("a").removeClass('active');
            $("#tab" + id).find("a").addClass('active');
        }
    </script>
</asp:Content>
