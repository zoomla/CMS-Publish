<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Message"  MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>信息管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li class="breadcrumb-item"><a href='UserManage.aspx'>用户管理</a></li>
    <li class="breadcrumb-item"><a href='MessageSend.aspx'>信息发送</a></li>
    <li class="breadcrumb-item">短消息列表</li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
    <div id="sel_box" runat="server">
        <div>
			<div class="input-group">
			 <asp:TextBox ID="Skey_T" placeholder="输入短消息主题" runat="server" CssClass="form-control max20rem" />
			<div  class="input-group-append">
				<asp:Button ID="Search_B" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-outline-secondary" OnClick="Search_B_Click" />
			</div>
			</div>
        </div>
    </div>
</ol>
<div class="template list_choice" id="template" runat="server">
    <ul class="nav nav-tabs hidden-xs hidden-sm">
        <li class="nav-item"><a class="nav-link" href="#tab_all" data--toggle="tab" onclick="showtabs('all')">全部</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab_sys" data-toggle="tab" onclick="showtabs('sys')">系统消息</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab_mb" data-toggle="tab" onclick="showtabs('mb')">手机短信</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab_code" data-toggle="tab" onclick="showtabs('code')">验证码</a></li>
    </ul>
    <ZL:ExGridView ID="EGV" runat="server" Width="100%"  AutoGenerateColumns="False"  OnRowCommand="Row_Command"  AllowPaging="true"
         EmptyDataText="没有数据" OnPageIndexChanging="EGV_PageIndexChanging" CssClass="table table-striped table-bordered table-hover" onrowdatabound="EGV_RowDataBound">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="max20rem">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("MsgID") %>"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate> <a href="MessageRead.aspx?id=<%#Eval("MsgID")%>" title='<%# Eval("Title")%>'> <%# Eval("Title")%></a> </ItemTemplate>
            </asp:TemplateField>
  <%--          <asp:TemplateField HeaderText="类型" ItemStyle-CssClass="max20rem">
                <ItemTemplate><%#GetMsgType(Convert.ToInt32(Eval("MsgType")))%></ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="收件人">
                <ItemTemplate>
                    <%#GetUserNames() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发件人" ItemStyle-CssClass="max20rem">
                <ItemTemplate>
                    <%#Eval("UserName","{0}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发送日期" ItemStyle-CssClass="max20rem">
                <ItemTemplate> <%# Eval("PostDate","{0:yyyy-MM-dd}")%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="max20rem">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确定删除此信息?');"  CommandArgument='<%# Eval("MsgID")%>' ><i class="zi zi_trashalt" zico="垃圾箱竖条"></i></asp:LinkButton>
                    <a href="MessageRead.aspx?id=<%# Eval("MsgID")%>"><i class="zi zi_eye" title="阅读"></i>阅读</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView> 
</div>
<div class="sysBtline">
<asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" class="btn btn-outline-danger" />
</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $().ready(function () {
            $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll' />");
            $("#chkAll").click(function () {
                SelecteAllByName(this, "idChk");
            });
            $("ul.nav li").find("a").removeClass("active");
            $("a[href='#tab_<%=view%>']").parent().find("a").addClass("active");
        });
        function SelecteAllByName(obj,name) {
            var input = document.getElementsByName("idChk");
            var len = input.length;
            for (var i = 0; i < len; i++) {
                if(input[i].type=="checkbox"){
                    input[i].checked = obj.checked;
                }
            }
        }
        $("#sel_btn").click(function (e) {
            if ($("#sel_box").css("display") == "none") {
                $(this).addClass("active");
                $("#sel_box").slideDown(300);
                $(".template").css("margin-top", "44px");
            }
            else {
                $(this).removeClass("active");
                $("#sel_box").slideUp(200);
                $(".template").css("margin-top", "0px");
            }
        });
        function showtabs(view) {
            location.href = "Message.aspx?view=" + view;
        }
    </script>
</asp:Content>
