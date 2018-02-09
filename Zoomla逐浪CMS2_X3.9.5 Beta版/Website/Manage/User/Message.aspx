<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Message"  MasterPageFile="~/Manage/I/Default.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>信息管理</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb navbar-fixed-top">
    <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li><a href='UserManage.aspx'>用户管理</a></li>
    <li><a href='MessageSend.aspx'>信息发送</a></li>
    <li class="active">短消息列表</li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
    <div id="sel_box" runat="server" class="padding5">
        <div style="display: inline-block; width: 230px;">
            <div class="input-group" style="position: relative; margin-bottom: -12px;">
                <asp:TextBox ID="Skey_T" placeholder="输入短消息主题" runat="server" CssClass="form-control text_md" />
                <span class="input-group-btn">
                    <asp:Button ID="Search_B" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-primary" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </div>
</ol>
<div class="template" id="template" runat="server">
    <ul class="nav nav-tabs hidden-xs hidden-sm">
        <li><a href="#tab_all" data--toggle="tab" onclick="showtabs('all')">全部</a></li>
        <li><a href="#tab_sys" data-toggle="tab" onclick="showtabs('sys')">系统消息</a></li>
        <li><a href="#tab_mb" data-toggle="tab" onclick="showtabs('mb')">手机短信</a></li>
        <li><a href="#tab_code" data-toggle="tab" onclick="showtabs('code')">验证码</a></li>
    </ul>
    <ZL:ExGridView ID="EGV" runat="server" Width="100%"  AutoGenerateColumns="False"  OnRowCommand="Row_Command"  AllowPaging="true"
         EmptyDataText="没有数据" OnPageIndexChanging="EGV_PageIndexChanging" CssClass="table table-striped table-bordered table-hover" onrowdatabound="EGV_RowDataBound">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("MsgID") %>"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate> <a href="MessageRead.aspx?id=<%#Eval("MsgID")%>" title='<%# Eval("Title")%>'> <%# Eval("Title")%></a> </ItemTemplate>
            </asp:TemplateField>
  <%--          <asp:TemplateField HeaderText="类型" ItemStyle-CssClass="td_m">
                <ItemTemplate><%#GetMsgType(Convert.ToInt32(Eval("MsgType")))%></ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="收件人">
                <ItemTemplate>
                    <%#GetUserNames() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发件人" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <%#Eval("UserName","{0}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发送日期" ItemStyle-CssClass="td_l">
                <ItemTemplate> <%# Eval("PostDate","{0:yyyy-MM-dd}")%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
                <ItemTemplate>
                    <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确定删除此信息?');"  CommandArgument='<%# Eval("MsgID")%>' CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                    <a href="MessageRead.aspx?id=<%# Eval("MsgID")%>" class="option_style"><i class="fa fa-eye" title="阅读"></i>阅读</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView> 
</div>
<asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" class="btn btn-info" />
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $().ready(function () {
            $("#EGV tr>th:eq(0)").html("<input type=checkbox id='chkAll' />");
            $("#chkAll").click(function () {
                SelecteAllByName(this, "idChk");
            });
            $("ul.nav li").removeClass("active");
            $("a[href='#tab_<%=view%>']").parent().addClass("active");
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
