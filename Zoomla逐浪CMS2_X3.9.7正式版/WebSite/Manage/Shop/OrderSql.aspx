<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSql.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.OrderSql"  MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.账单申请 %></title>
		<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/Main.aspx",Resources.L.工作台),
	new Bread("ProductManage.aspx",Resources.L.商城管理),
	new Bread("OrderList.aspx",Resources.L.订单管理),
	new Bread(){url="", text=Resources.L.账单管理}
}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<div class="table-responsive-md list_choice">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" CssClass="table table-striped table-bordered table-hover" 
        EmptyDataText="<%$Resources:L,当前没有信息 %>" OnPageIndexChanging="EGV_PageIndexChanging" OnRowDataBound="EGV_RowDataBound" OnRowCommand="EGV_RowCommand">
        <Columns>
            <asp:TemplateField >
                <ItemTemplate>
                    <input type="checkbox" value="<%#Eval("id") %>" name="idchk" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,账单类型 %>">
                <ItemTemplate>
                    <a href="OrderSql.aspx?Type=<%#Eval("OrderType")%>"><%#getOrderType(Eval("OrderType","{0}"))%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,会员名 %>">
                <ItemTemplate><%#getUserName(Convert.ToInt32(Eval("UserName")))%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,提交金额 %>">
                <ItemTemplate><%#Eval("money","{0:N2}")%></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,返分会员名 %>">
                <ItemTemplate><%#getUserName(Convert.ToInt32(Eval("PuserID")))%> </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,备注 %>" DataField="remark" />
            <asp:TemplateField HeaderText="<%$Resources:L,状态 %>">
                <ItemTemplate>
                    <%#getStatus(Eval("status","{0}"))%> | <%#getPayStatus(Eval("PayState","{0}"))%> | <%#getRunStatus(Eval("SqlState","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,执行次数 %>" DataField="RunNum" />
            <asp:BoundField HeaderText="<%$Resources:L,提交时间 %>" DataField="AddTime" />
            <asp:TemplateField HeaderText="<%$Resources:L,操作 %>">
                <ItemTemplate>
                <%--    <a href="EditOrderSql.aspx?ID=<%#Eval("id") %>" ><i class="zi zi_eye" title="<%=Resources.L.查看 %>"></i></a>--%>
              <%--      <asp:LinkButton ID="StatBtn"  runat="server" Text='<%#getStabtn(Eval("status","{0}"))%>' ><span class="text-danger"></span></asp:LinkButton>
                    <asp:LinkButton ID="PayBtn" runat="server" Text='<%#getPaybtn(Eval("PayState","{0}"))%>' CommandName="pay" CommandArgument='<%#Eval("ID") %>'></asp:LinkButton>--%>
                    <asp:LinkButton ID="Del_btn" runat="server" CommandName='Del' Text='<%$Resources:L,删除 %>' CommandArgument='<%#Eval("ID") %>' ><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i></asp:LinkButton>
                   <%-- <asp:LinkButton ID="runBtn" runat="server" Text='执行' CommandName="Run" CommandArgument='<%#Eval("ID") %>'><i class="zi zi_cubes" title="<%=Resources.L.批处理 %>"></i> <%=Resources.L.执行批处理 %> </asp:LinkButton>--%>
                    <asp:LinkButton ID="LinkButton1" runat="server" Text='<%$Resources:L,生成 %>' CommandName="save" CommandArgument='<%#Eval("ID") %>' ><i class="zi zi_spinner" title="<%=Resources.L.生成 %>"></i><%=Resources.L.生成脚本文件 %></asp:LinkButton>
                    <asp:LinkButton ID="save_btn" runat="server" Text='<%$Resources:L,下载 %>' CommandName="download" CommandArgument='<%#Eval("ID") %>' ><i class="zi zi_download" title="<%=Resources.L.下载 %>"></i><%=Resources.L.下载数据库脚本 %></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
    <div class="clear"></div>
	<div class="alert alert-light list_choice">
    <asp:Button runat="server" ID="BatAudit_Btn" Text="<%$Resources:L,批量审核 %>" OnClick="BatAudit_Btn_Click" CssClass="btn btn-outline-info"/>
    <asp:Button runat="server" ID="BatUnAudit_Btn" Text="<%$Resources:L,取消审核 %>" OnClick="BatUnAudit_Btn_Click" CssClass="btn btn-outline-danger"/>
    <asp:Button runat="server" ID="BatPay_Btn" Text="<%$Resources:L,批量支付 %>" OnClick="BatPay_Btn_Click" CssClass="btn btn-outline-info" />
	</div>
    <div id="RunOK" runat="server"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>



