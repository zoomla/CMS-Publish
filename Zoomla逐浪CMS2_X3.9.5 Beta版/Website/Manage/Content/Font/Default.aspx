<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Font.Default" MasterPageFile="~/Manage/I/Default.Master"%>
<%@ Import Namespace="ZoomLa.Common" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>字库列表</title>
    <script>
        location = "/webfont/write/WordPanelIfr.aspx";
    </script>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li><a href='../ContentManage.aspx'>内容管理</a></li>
                <li class="active"><a href='UserManage.aspx'>字体列表</a></li>
                <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="fa fa-search"></i></a></div>
                <div id="sel_box" class="padding5">
                    <div class="input-group">
                        <input type="text" id="skey" runat="server" class="form-control mvcparam" placeholder="请输入关键词" onkeypress="selbox.search();" />
                        <span class="input-group-btn">
                            <asp:LinkButton runat="server" class="btn btn-default" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="fa fa-search"></i></asp:LinkButton>
                        </span>
                    </div>
                </div>
            </ol>
        </div>
    </div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" BoxType="dp"
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="字体名称">
            <ItemTemplate>
                <%#Eval("FontName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="作者">
            <ItemTemplate>
                <a onclick="user.showuinfo('<%#Eval("UserID") %>');"><%#Eval("UserName") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <asp:LinkButton runat="server" class="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                <a style="<%#ShowDownLoad() %>" href="<%#wrBll.Dir+"down.aspx?id="+Eval("ID") %>" target="_blank" class="option_style"><i class="fa fa-download"></i>下载</a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script runat="server">
    public string ShowDownLoad()
    {
        int uid = DataConverter.CLng(Eval("UserID"));
        int wid = DataConverter.CLng(Eval("ID"));
        string dir = wrBll.Dir + "upload/write/" + uid + "/" + wid + "/";
        if (!System.IO.File.Exists(function.VToP(dir) + "font.zip")) { return "display:none;"; }
        else { return ""; }
    }
</script>
</asp:Content>