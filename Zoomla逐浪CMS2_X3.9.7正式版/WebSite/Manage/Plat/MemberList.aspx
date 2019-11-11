<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberList.aspx.cs" Inherits="ZoomLaCMS.Manage.Plat.MemberList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>成员列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li class="breadcrumb-item"><a href='CompList.aspx'>能力中心</a></li>
    <li class="breadcrumb-item">
        <a href="<%=Request.RawUrl %>">成员列表</a>
        <a href="javascript:;" onclick="user.sel('User', 'user', 'noplat|1')" class="btn btn-sm btn-info"><i class="zi zi_userplus"></i>添加成员</a>
    </li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
    <div id="sel_box" runat="server">
        <div>
            <div class="input-group">
                <asp:TextBox ID="Skey_T" placeholder="请输入用户名" runat="server" CssClass="form-control max20rem" />
                <span class="input-group-append">
                    <asp:Button ID="Search_B" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-outline-secondary" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </div>
</ol>
<div class="list_choice table-responsive-md pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate><input type="checkbox" name="idchk" value="<%#Eval("UserID") %>" /></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="UserID" ItemStyle-CssClass=""/>
            <asp:TemplateField HeaderText="头像">
                <ItemTemplate>
                    <img src="<%#Eval("UserFace") %>" class="img_3rem" onerror="shownoface(this);" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="部门" DataField="GroupName" />
            <asp:BoundField HeaderText="用户名" DataField="UserName" />
            <asp:BoundField HeaderText="昵称" DataField="TrueName" />
            <asp:BoundField HeaderText="职位"   DataField="Post"/>
            <asp:BoundField HeaderText="手机"   DataField="Mobile" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="VideoInfo.aspx?id=<%#Eval("UserID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("UserID") %>' OnClientClick="return confirm('确定从该企业移除吗？');"><i class="zi zi_trashalt" title="移除"></i>移除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
    <asp:HiddenField runat="server" ID="UserIDS_Hid" />
    <asp:Button runat="server" style="display:none;" ID="BatAdd_Btn" OnClick="BatAdd_Btn_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    user.hook["User"] = function (list, select) {
        $("#UserIDS_Hid").val(user.getids(list));
        $("#BatAdd_Btn").click();
    }
    $("#sel_btn").click(function (e) {
        if ($("#sel_box").css("display") == "none") {
            $(this).addClass("active");
            $("#sel_box").slideDown(300);
            $("#EGV").css("margin-top","44px");
        }
        else {
            $(this).removeClass("active");
            $("#sel_box").slideUp(200);
            $("#EGV").css("margin-top", "0px");
        }
    });
</script>
</asp:Content>