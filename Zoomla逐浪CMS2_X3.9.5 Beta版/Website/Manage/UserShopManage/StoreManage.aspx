<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreManage.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopMannger.StoreManage" ValidateRequest="false" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>店铺审核</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
    <ol class="breadcrumb navbar-fixed-top">
        <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li><a href='../Shop/ProductManage.aspx'>商城管理</a></li>
        <li><a href='StoreManage.aspx'>店铺管理</a> [<a href="StoreUpdate.aspx">添加店铺</a>]</li>
        <div id="help" class="pull-right text-center" style="margin-right: 8px;"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
        <div id="sel_box" runat="server" class="padding5">
            <div class="input-group pull-left" style="width: 300px;">
                <asp:TextBox runat="server" ID="SKey" CssClass="form-control" placeholder="输入店铺名或店铺ID" />
                <span class="input-group-btn">
                    <asp:Button ID="Search_B" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="SearchStore" />
                </span>
            </div>
        </div>
    </ol>
</div>
    <ul class="nav nav-tabs hidden-xs hidden-sm">
	<li class="active"><a href="#tab-1" data-toggle="tab" onclick="ShowTabs(-1)"><%:lang.LF("所有内容") %></a></li>
        <li><a href="#tab2" data-toggle="tab" onclick="ShowTabs(2)"><%:lang.LF("推荐") %></a></li>
	<li><a href="#tab0" data-toggle="tab" onclick="ShowTabs(0)"><%:lang.LF("已审核") %></a></li>
	<li><a href="#tab1" data-toggle="tab" onclick="ShowTabs(1)"><%:lang.LF("未审核") %></a></li>
</ul>
    <div>
        <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="GeneralID" BoxType="dp" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" OnRowDataBound="Egv_RowDataBound"
            IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" title="" value='<%#Eval("GeneralID") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="GeneralID" />
                <asp:TemplateField HeaderText="店铺名称">
                    <ItemTemplate>
                        <a href="StoreView.aspx?id=<%# Eval("GeneralID")%>">
                            <%#Eval("Title")%>
                        </a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="申请人用户名">
                    <ItemTemplate>
                        <a href="javascript:void(0);>" onclick="SelUser(<%#GetUserID(Eval("Inputer").ToString()) %>)"><%#(Eval("Inputer"))%></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IP地址">
                    <ItemTemplate>
                        <%#GetIpLocation(Eval("ComplianceUserList","{0}"))%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="申请时间">
                    <ItemTemplate>
                        <%#Eval("CreateTime","{0:yyyy年MM月dd日 HH:mm}")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="审核">
                    <ItemTemplate>
                        <%#GetState()%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                       <a href="StoreView.aspx?id=<%#Eval("GeneralID")%>" class="option_style"><i class="fa fa-eye" title="后台预览"></i></a>
                        <a href="StoreUpdate.aspx?id=<%#Eval("GeneralID")%>" class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
                        <a target="_blank" href="/Store/StoreIndex?id=<%#Eval("GeneralID") %>" class="option_style"><i class='fa fa-globe' title="浏览"></i>浏览</a>                               
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
        <div>
            <asp:Button ID="Batch" CssClass="btn btn-info" runat="server" CommandName="1" Text="批量审核" OnClick="Button1_Click" />
            <asp:Button ID="Bcancle" CssClass="btn btn-info" runat="server" CommandName="2" Text="取消审核" OnClick="Button1_Click" />
            <asp:Button ID="Button1" class="btn btn-info" runat="server" Text="设为推荐" CommandName="3" OnClick="Button1_Click" />
            <asp:Button ID="Button6" class="btn btn-info" runat="server" Text="取消推荐" CommandName="4" OnClick="Button1_Click" />
            <asp:Button ID="Button3" class="btn btn-info" runat="server" Text="批量删除" CommandName="5" OnClick="Button1_Click" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" />
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        $().ready(function () {
            ShowStatus();
        });
        function ShowStatus() {
            var type = '<%=Request.QueryString["type"] %>';
            if (type != '') {
                $("li a[href='#tab" + type + "']").parent().addClass("active").siblings("li").removeClass("active");
            }
        }
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
        function ShowTabs(ID) {
            location.href = 'StoreManage.aspx?type=' + ID;
        }
        //--------------查看用户信息
        var TemDiag = new ZL_Dialog();
        var SelUser = function (uid) {
            TemDiag.title = "用户信息";
            TemDiag.maxbtn = false;
            TemDiag.url = "../User/UserInfo.aspx?id=" + uid;
            TemDiag.ShowModal();
        }
    </script>
</asp:Content>
