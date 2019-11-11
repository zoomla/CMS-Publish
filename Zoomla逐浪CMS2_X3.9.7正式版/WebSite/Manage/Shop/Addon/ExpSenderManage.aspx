<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpSenderManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ExpSenderManage" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.发件信息 %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb fixed-top">
<li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
<li class="breadcrumb-item"><a href='../ProductManage.aspx'><%=Resources.L.商城管理 %></a></li> 
<li class="breadcrumb-item"><a href='Exp/DeliverType.aspx'><%=Resources.L.商城设置 %></a></li>
<li class='breadcrumb-item'><%=Resources.L.发件信息 %><a href='AddExpSender.aspx'> [<%=Resources.L.添加发件信息 %>]</a></li>
        <div id="help" class="pull-right text-center mr-2"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server" class="padding5">
            <span class="pull-left" style="line-height: 40px;"><%=Resources.L.收件人 %> ：</span>
            <div class="input-group pull-left max20rem">
                <asp:TextBox runat="server" ID="Skey_T" class="form-control" placeholder="<%$Resources:L,请输入需要搜索的内容 %>" />
                <span class="input-group-btn">
                    <asp:LinkButton runat="server" CssClass="btn btn-outline-dar" ID="souchok" OnClick="souchok_Click"><span class="zi zi_search"></span></asp:LinkButton>
                </span>
            </div>
        </div>
    </ol>
	<div class="table-responsive-md list_choice"></div>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="<%$Resources:L,无相关数据 %>">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:BoundField DataField="Name" HeaderText="<%$Resources:L,发件人 %>" />
            <asp:BoundField DataField="CompName" HeaderText="<%$Resources:L,公司名称 %>" />
            <asp:BoundField DataField="Address" HeaderText="<%$Resources:L,发件地址 %>" />
            <asp:BoundField DataField="Mobile" HeaderText="<%$Resources:L,发件人手机 %>" />
            <asp:TemplateField HeaderText="<%$Resources:L,默认 %>">
                <ItemTemplate><%#GetIsDefault() %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CDate" HeaderText="<%$Resources:L,创建时间 %>" DataFormatString="{0:yyyy:MM:dd}" />
            <asp:BoundField DataField="Remind" HeaderText="<%$Resources:L,备注 %>" />
            <asp:TemplateField HeaderText="<%$Resources:L,操作 %>">
                <ItemTemplate>
                    <a href="AddExpSender.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt"></i><%=Resources.L.修改 %></a>
                    <span class="<%#Eval("IsDefault","")=="1" ? "enabled" : "" %>">
                        <asp:LinkButton runat="server" CommandName="setdef" Enabled='<%#Eval("IsDefault","")!="1" %>' CommandArgument='<%#Eval("ID") %>'><i class="zi zi_check"></i><%=Resources.L.设为默认 %></asp:LinkButton></span>
                    <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定将该数据删除吗？');"><i class="zi zi_trashalt"></i><%=Resources.L.删除 %></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
