<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TopicList.aspx.cs" Inherits="ZoomLaCMS.Manage.Plat.TopicList" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>话题管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li class="breadcrumb-item"><a href='CompList.aspx'>能力中心</a></li>
    <li class="breadcrumb-item"><a href='TopicList.aspx'>话题管理</a></li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
    <div id="sel_box" runat="server">
        <div>
            <div class="input-group">
                <asp:TextBox ID="Skey_T" placeholder="请输入话题名称" runat="server" CssClass="form-control max20rem" />
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
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" />
            <asp:TemplateField HeaderText="话题">
                <ItemTemplate>
                    <a href="PlatInfoManage.aspx?topic=<%#HttpUtility.UrlEncode(Eval("TName","")) %>" title="浏览话题"><%#Eval("TName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="最新信息">
                <ItemTemplate>
                    [<%#Eval("CUName") %>]<%#GetMsgContgent() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="热度" DataField="Count" />
            <asp:TemplateField HeaderText="星标话题" >
                <ItemTemplate><%#GetStatus(Eval("IsStar")) %></ItemTemplate>
            </asp:TemplateField>
           <%-- <asp:TemplateField HeaderText="系统话题"><ItemTemplate><%#GetStatus(Eval("IsSystem")) %></ItemTemplate></asp:TemplateField>--%>
            <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                   <%-- <a  href="VideoInfo.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencil" title="修改"></i></a>--%>
                    <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
	<div class="sysBtline">
<asp:Button runat="server" CssClass="btn btn-outline-info" ID="SetToStar_Btn" Text="设为星标" OnClick="SetToStar_Btn_Click" OnClientClick="return subchk();"/>
<asp:Button runat="server" CssClass="btn btn-outline-danger" ID="CancelStar_Btn" Text="取消星标" OnClick="CancelStar_Btn_Click" OnClientClick="return subchk();"/>
<%--<asp:Button runat="server" CssClass="btn btn-outline-info" ID="SetToSystem_Btn" Text="设为系统话题" OnClick="SetToSystem_Btn_Click" OnClientClick="return subchk();"/>
<asp:Button runat="server" CssClass="btn btn-outline-danger" ID="CancelSystem_Btn" Text="取消系统话题" OnClick="CancelSystem_Btn_Click" OnClientClick="return subchk();"/>--%>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    function subchk() {
        if ($("input[name='idchk']:checked").length < 1) { alert("未选择需要操作的数据!"); return false; }
        if (!confirm("确定要进行该操作吗?")) { return false; }
        return true;
    }
    $("#sel_btn").click(function (e) {
        if ($("#sel_box").css("display") == "none") {
            $(this).addClass("active");
            $("#sel_box").slideDown(300);
            $("#EGV").css("margin-top", "44px");
        }
        else {
            $(this).removeClass("active");
            $("#sel_box").slideUp(200);
            $("#EGV").css("margin-top", "0px");
        }
    });
</script>
</asp:Content>