<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArriveManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Arrive.ArriveManage" MasterPageFile="~/Manage/I/Index.master" %>

<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
		<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("../ProductManage.aspx","商城管理"),
	new Bread(){url="TotalSale.aspx", text="优惠劵管理<a href='AddArrive.aspx?menu=add'> [新增优惠劵]</a>"}
	}) %>
    <title>优惠劵管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="list_choice">
        <div class="input-group p-2">
			<div class="input-group-prepend">
			<span class="input-group-text">类型</span>
		 	</div>
            <asp:DropDownList runat="server" ID="Type_DP" class="form-control">
                <asp:ListItem Value="-100" Selected="True">全部</asp:ListItem>
                <asp:ListItem Value="0">优惠券</asp:ListItem>
                <asp:ListItem Value="1">现金券</asp:ListItem>
            </asp:DropDownList>
			<div class="input-group-prepend">
			<span class="input-group-text">状态</span>
		 	</div>
            <asp:DropDownList runat="server" ID="State_DP" class="form-control">
                <asp:ListItem Value="-100" Selected="True">全部</asp:ListItem>
                <asp:ListItem Value="10">已使用</asp:ListItem>
                <asp:ListItem Value="1">未使用</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox runat="server" ID="Name_T" class="form-control max20rem" placeholder="优惠劵名" />
            <asp:TextBox runat="server" ID="UserName_T" class="form-control max20rem" placeholder="用户名" />
            <asp:TextBox runat="server" ID="AgainTime_T" class="form-control max20rem" placeholder="有效时间" onclick="WdatePicker({maxDate:'#F{$dp.$D(\'EndTime_T\')}'});" />
            <asp:TextBox runat="server" ID="EndTime_T" class="form-control max20rem" placeholder="过期时间" onclick="WdatePicker({minDate:'#F{$dp.$D(\'AgainTime_T\')}'});" />
            <span class="input-group-btn">
                <asp:Button ID="Skey_Btn" runat="server" Text="搜索" class="btn btn-outline-dark" OnClick="Skey_Btn_Click" />
            </span>
        </div>
    </div>
    <ul class="nav nav-tabs">
        <li class="nav-item b_all active"><asp:LinkButton runat="server" class="nav-link" CommandArgument="all" OnClick="AddonChange_Click" Text="全部" /></li>
        <li class="nav-item b_isbind"><asp:LinkButton runat="server" class="nav-link"  CommandArgument="isbind" OnClick="AddonChange_Click" Text="已颁发" /></li>
        <li class="nav-item b_nobind"><asp:LinkButton runat="server" class="nav-link"  CommandArgument="nobind" OnClick="AddonChange_Click" Text="未颁发" /></li>
        <li class="nav-item b_expired"><asp:LinkButton CommandArgument="expired" class="nav-link"  runat="server" OnClick="AddonChange_Click" Text="已过期" /></li>
    </ul>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" EmptyDataText="当前无数据"
        OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" OnPageIndexChanging="EGV_PageIndexChanging" class="table table-striped table-bordered table-hover">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%# Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="来源">
                <ItemTemplate>
                    <%#GetSource() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
            <asp:BoundField HeaderText="卡别名" DataField="ArriveName" />
            <asp:TemplateField HeaderText="适用店铺">
                <ItemTemplate>
                    <%#GetStoreName() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="编号" DataField="ArriveNO" />
            <asp:TemplateField HeaderText="金额" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <%#Eval("Amount","{0:f2}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="所属用户" DataField="UserName" ItemStyle-CssClass="td_m" />
            <asp:TemplateField HeaderText="生效时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                   <%# Eval("AgainTime","{0:yyyy-MM-dd}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="到期时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <%#Eval("EndTime","{0:yyyy-MM-dd}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <%--                <asp:TemplateField HeaderText="使用时间" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                      <%#Eval("UseTime","{0:yyyy-MM-dd}") %>
                    </ItemTemplate>
                </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="状态" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <%#GetState() %>
                </ItemTemplate>
            </asp:TemplateField>
<%--            <asp:TemplateField HeaderText="类型" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <%# Eval("Type","").Equals("1") ? "现金券":"优惠券" %>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                <ItemTemplate>
                    <a href="AddArrive.aspx?id=<%#Eval("id") %>" class="option_style"><i class="zi zi_pencilalt" title="修改"></i>修改</a>
                    <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗?');"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="alert alert-light">
    <input type="button" class="btn btn-outline-info" value="绑定用户" onclick="SelUser();" />
    <asp:Button runat="server" ID="batActive" OnClick="batActive_Click" Text="批量激活" class="btn btn-outline-info" />
    <asp:Button runat="server" ID="batBtn" OnClick="BtnDelete_Click" Text="批量删除" class="btn btn-outline-danger" OnClientClick="return confirm('确定要删除选中吗');" />
    <asp:HiddenField ID="BindUserID_H" runat="server" />
    <asp:HiddenField ID="IsBind_Hid" runat="server" Value="all" />
    <asp:Button ID="BindUser_B" runat="server" CssClass="d-none" OnClick="BindUser_B_Click" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
function showtab(str) {
    $(".b_" + str).find("a").addClass("active").siblings("li").find("a").removeClass("active");
}
function SelUser() {
    comdiag.maxbtn = false;
    ShowComDiag("/Common/Dialog/SelGroup.aspx?selmode=single", "选择用户");
}
function UserFunc(list, select) {
    $("#BindUserID_H").val(list[0].UserID);
    $("#BindUser_B").click();
    CloseComDiag();
}
</script>
</asp:Content>
