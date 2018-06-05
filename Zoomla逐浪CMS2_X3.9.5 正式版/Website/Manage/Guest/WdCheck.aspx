<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WdCheck.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.WdCheck" ValidateRequest="false" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title>问答管理</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div class="list_choice">
    <ol class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li class="breadcrumb-item"><a href='<%=customPath2 %>Content/ContentManage.aspx'>内容管理</a></li>
        <li class="breadcrumb-item">问答管理</li>
        <div id="help" class="pull-right text-center mr-2"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server">
            <div class="input-group pull-left max20rem">
                <asp:TextBox runat="server" ID="Key_T" class="form-control" placeholder="请输入问题内容" />
                <span class="input-group-append">
                    <asp:Button ID="Search_B" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </ol>
</div>
    <div class="clearfix"></div>
    <div class="borders">
        <ul class="nav nav-tabs">
            <li class="nav-item" data-index="-100"><a class="nav-link" onclick="ShowTabss(-100)">所有问答</a></li>
            <li class="nav-item" data-index="0"><a class="nav-link" onclick="ShowTabss(0)"><%=lang.LF("待审核")%></a></li>
            <li class="nav-item" data-index="1"><a class="nav-link" onclick="ShowTabss(1)"><%=lang.LF("已审核")%></a></li>
            <li class="nav-item" data-index="2"><a class="nav-link" onclick="ShowTabss(2)">新版本待审</a></li>
        </ul>
    </div>
    <div class="claerfix"></div>
    <div class="panel panel-default" >
        <div class="panel panel-body">
            <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" 
                OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Lnk_Click" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True">
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="td_xs">
                        <ItemTemplate>
                            <input type="checkbox" name="idchk" value='<%#Eval("ID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ID" ItemStyle-CssClass="td_s">
                        <ItemTemplate>
                            <%#Eval("ID")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="问题内容">
                        <ItemTemplate>
                            <a href="Asklist.aspx?ID=<%# Eval("ID") %>"><%#GetContent(Eval("Qcontent") as string) %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="问题类型" ItemStyle-CssClass="td_m">
                        <ItemTemplate>
                            <a href="WdCheck.aspx?QueType=<%#Eval("QueType") %>"><%#gettype(Eval("QueType").ToString())%></a>
                        </ItemTemplate>
                        <HeaderStyle Width="12%"></HeaderStyle>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="提交人" ItemStyle-CssClass="td_m">
                        <ItemTemplate>
                            <a href="javascript:;" onclick="user.showuinfo('<%#Eval("UserId") %>');"><%#Eval("UserName")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="提交时间" ItemStyle-CssClass="td_l">
                        <ItemTemplate>
                            <%#Eval("AddTime")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="推荐" ItemStyle-CssClass="td_m">
                        <ItemTemplate>
                            <%#gettj(Eval("Elite").ToString())%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核" ItemStyle-CssClass="td_m">
                        <ItemTemplate>
                            <%#getcommend(Eval("status"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" HeaderStyle-Width="240">
                        <ItemTemplate>
                            <a href="/Ask/SearchDetails?soure=manager&ID=<%#Eval("ID") %>" target="_blank"><i class="zi zi_eye" title="预览"></i></a>
                            <a href="WdAlter.aspx?ID=<%#Eval("ID")%>" target="_self"><i class="zi zi_pencilalt" title="修改"></i></a>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确实要删除吗？');" CommandArgument='<%#Eval("ID") %>'
                                CommandName="Del" CausesValidation="false"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                            <a href="Asklist.aspx?ID=<%#Eval("ID")%>"><i class="zi zi_comments" title="留言"></i>留言</a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Audit" CausesValidation="false" ><i class="zi zi_gavel" title="审核"></i>审核</asp:LinkButton>
                            <a href="javascript:;" onclick="SelUser(<%#Eval("ID") %>)"><i class="zi zi_fly" title="推送"></i>推送</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
        <div class="panel panel-footer">
            <asp:Button ID="Button1" runat="server" Text="批量删除" OnClick="BtnSubmit1_Click" UseSubmitBehavior="False" OnClientClick="if(!confirm('确定要批量删除吗？')){return false;}" CssClass="btn btn-outline-danger" />
            <asp:Button ID="Button2" runat="server" Text="审核通过" OnClick="BtnSubmit2_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button3" runat="server" Text="取消审核" OnClick="BtnSubmit3_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-danger" />
            <asp:Button ID="Button4" runat="server" Text="批量推荐" OnClick="BtnSubmit4_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button5" runat="server" Text="取消推荐" OnClick="BtnSubmit5_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-danger" />
            <button type="button" class="btn btn-info" onclick="SelUser(0)">批量推送</button>
            <asp:Button ID="BtnQuest" runat="server" Style="display: none;" OnClick="BtnQuest_Click" />
            <asp:Button ID="SetLike_B" runat="server" Style="display: none;" OnClick="SetLike_B_Click" />

        </div>
    </div>
    <asp:HiddenField ID="CurUser_Hid" runat="server" />
    <asp:HiddenField ID="QuesId_Hid" runat="server" />
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        function ShowTabss(status) {
            location = 'WdCheck.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&status=' + status;
        }
        $(function () {
            var status = getParam("status");
            if (ZL_Regex.isEmpty(status) || status == "-100") { $(".nav li:first").find("a").addClass("active"); }
            else { $(".nav li[data-index="+status+"]").find("a").addClass("active"); }
            $("#Egv tr").dblclick(function () {
                var id = $(this).find(".wdid").text();
                if (id) {
                    location = "WdAlter.aspx?ID=" + id;
                }
            });
        })
        var diag = new ZL_Dialog();
        function SelUser(qid) {
            $("#QuesId_Hid").val(qid);
            diag.title = "选择推送用户";
            diag.maxbtn = false;
            diag.url = "/Office/Mail/SelGroup.aspx?Type=AllInfo";
            diag.ShowModal();
        }
        function UserFunc(data) {
            if (data[0].UserName != "undefined") {
                $("#CurUser_Hid").val(JSON.stringify(data));
                if ($("#QuesId_Hid").val() == "0") {//如果当前问题id为0，则视为批量推送
                    $("#BtnQuest").click();
                } else
                    $("#SetLike_B").click();
            }
            diag.CloseModal();
        }
    </script>
</asp:Content>
