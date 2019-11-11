<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarAuthSet.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.BarAuthSet" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>权限设置</title><style>.allchk_l{display:none;}</style></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li class="breadcrumb-item"><a href='GuestCateMana.aspx'>栏目列表</a></li>
    <li class="breadcrumb-item"><a href='" + Request.RawUrl + "'>权限设置</a></li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
    <div id="sel_box" runat="server">
        <div>
            <div class="input-group">
                <asp:TextBox ID="Search_T" placeholder="用户名" runat="server" CssClass="form-control max20rem" />
                <span class="input-group-append">
                    <asp:Button ID="Search_B" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-outline-secondary" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </div>
</ol>
<div class="template mt-2 table-responsive-md " id="template" runat="server">
    <ul class="nav nav-tabs hidden-xs hidden-sm list_choice">
        <li class="nav-item"><a class="nav-link active" href="#tab_all" data-toggle="tab" onclick="ShowTabs('all')">全部</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab_leastone" data-toggle="tab" onclick="ShowTabs('leastone')">有权限</a></li>
    </ul>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate >
                    <input type="checkbox" onclick="RowChk(this);" />
                    <asp:HiddenField runat="server" ID="Uid_Hid" Value='<%#Eval("UserID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="用户名" DataField="UserName" />
            <asp:TemplateField HeaderText="访问">
                <HeaderTemplate>
                    <label><input type="checkbox"  onclick="ColChk('Look');" />访问</label>
                </HeaderTemplate>
                <ItemTemplate>
                    <input type="checkbox" data-auth="Look" runat="server" ID="Look"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField >
                <HeaderTemplate>
                    <label><input type="checkbox" onclick="ColChk('Send');" />发贴</label>
                </HeaderTemplate>
                <ItemTemplate>
                    <input type="checkbox" runat="server" data-auth="Send" ID="Send" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <label><input type="checkbox" onclick="ColChk('Reply');" />回贴</label>
                </HeaderTemplate>
                <ItemTemplate>
                     <input type="checkbox" runat="server" data-auth="Reply" ID="Reply" />
                </ItemTemplate>
            </asp:TemplateField>
 <%--           <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddShop.aspx?ID=<%#Eval("ID") %>" title="修改">修改</a>
                    <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">
                                删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>--%>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        
    </ZL:ExGridView>
	<div class="alert alert-light">
    <asp:Button runat="server" ID="Save_Btn" Text="保存" CssClass="btn btn-info" OnClick="Save_Btn_Click" />
    <a href="GuestCateMana.aspx?Type=1" class="btn btn-outline-info">返回</a></div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $(function () {
            showtab('<%=View %>');
        })
        function RowChk(obj) {
            $(obj).closest("tr").find(":checkbox").each(function () { this.checked = obj.checked; });
        }
        function ColChk(name) {
            obj = event.srcElement;
            $(":checkbox[data-auth=" + name + "]").each(function () { this.checked = obj.checked; });
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
        function ShowTabs(type) {
            location.href = 'BarAuthSet.aspx?ID=<%=BarID %>&view=' + type;
        }
        function showtab(type) {
            $("ul.nav li").find("a").removeClass('active');
            $("a[href='#tab_" + type + "']").addClass("active");
        }
        function showuser(id) { ShowComDiag("../../User/Userinfo.aspx?id=" + id, "查看用户") }
    </script>
</asp:Content>