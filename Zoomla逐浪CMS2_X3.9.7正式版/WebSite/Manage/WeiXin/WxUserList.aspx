<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WxUserList.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.WxUserList"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>粉丝管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"> 
<div>
    <ol class="breadcrumb navbar-fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>WeiXin/Home.aspx'>移动微信</a></li>
        <li class="breadcrumb-item"><a href="<%=Request.RawUrl %>">粉丝管理</a> <asp:Label ID="Alias_L" runat="server" /></li>
        <div id="help" class="pull-right text-center mr-2"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server">
            <div class="input-group pull-left">
                <asp:TextBox runat="server" ID="Key_T" class="form-control max20rem" placeholder="请输入用户名称" />
                <span class="input-group-btn">
                    <asp:Button ID="Search_B" CssClass="btn btn-default btn btn-outline-secondary" runat="server" Text="搜索" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </ol>
</div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered" EmptyDataText="当前没有信息!!"  OnPageIndexChanging="EGV_PageIndexChanging" >
        <Columns>
           <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户头像">
                <ItemTemplate>
                    <img class="imgurl img_3rem" src="<%#Eval("HeadImgUrl") %>" onerror="shownoface(this);"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户名">
                <ItemTemplate><span class="name"><%#Eval("Name") %></span></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CMS用户信息">
                <ItemTemplate>
                    <a href="javascript:;" onclick="user.showuinfo('<%#Eval("UserID") %>');"><%#Eval("UserName") %> </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OpenID">
                <ItemTemplate><%#Eval("OpenID") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="性别">
                <ItemTemplate>
                    <%#GetSexIcon() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="标识" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <%#ShowZType() %>
                </ItemTemplate>
            </asp:TemplateField>
<%--            <asp:TemplateField HeaderText="用户组">
                <ItemTemplate>
                    <span class="groupid"><%#GetUserGroup() %></span> 
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="更新时间">
                <ItemTemplate>
                    <span class="cdate"><%#Eval("CDate") %></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="javascript:;" title="更新用户信息" data-oid="<%#Eval("OpenID") %>" class="wxoption"><span class="zi zi_sync"></span>更新用户信息</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div class="margin_t5">
        <asp:Button runat="server" ID="SetManager_Btn" Text="设为管理员" OnClick="SetManager_Btn_Click" CommandArgument="1" class="btn btn-info" />
        <asp:Button runat="server" ID="CancelManager_Btn" Text="取消管理员" OnClick="SetManager_Btn_Click" CommandArgument="0" class="btn btn-info" />
    </div>
</asp:Content> 
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
        $().ready(function () {
            $(".wxoption").click(function () {
                UpdateUser($(this).data('oid'));
            });
        });
        function UpdateUser(openid) {
            $(".wxoption[data-oid='" + openid + "'] span").addClass("fa-spin");
            var $tr = $(".wxoption[data-oid='" + openid + "']").closest('tr');
            $.ajax({
                type: 'POST',
                data: { action: 'update', openid: openid, appid: '<%=AppId %>' },
                success: function (data) {
                    if (data == '-1') {
                        $tr.remove();
                        return;
                    }
                    var obj = JSON.parse(data);
                    $tr.find('.imgurl').attr('src', obj.HeadImgUrl);
                    $tr.find('.name').text(obj.Name);
                    $tr.find('.sex').attr('class', obj.Sex == 1 ? 'zi zi_male' : 'zi zi_female');
                    $tr.find('.groupid').text(GetGroupName(obj.Groupid));
                    $(".wxoption[data-oid='" + openid + "'] span").removeClass("fa-spin");
                }
            });
        }
        //用户组名(暂时静态处理)
        function GetGroupName(groupid) {
            switch (groupid) {
                case 0:
                    return "未分组";
                case 1:
                    return "黑名单";
                case 2:
                    return "星标组";
                default:
                    return "";
            }
        }
    </script>
</asp:Content>

