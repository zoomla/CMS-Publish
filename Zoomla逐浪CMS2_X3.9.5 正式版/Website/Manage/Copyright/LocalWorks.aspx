<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LocalWorks.aspx.cs" Inherits="ZoomLaCMS.Manage.Copyright.LocalWorks" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>作品镜像</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
        <li class="breadcrumb-item"><a href='../Plus/ADManage.aspx'>扩展功能</a></li>
        <li class="breadcrumb-item"><a href='Config.aspx'>版权中心</a></li>
        <li class="breadcrumb-item">作品列表 [<a href="AddWorks.aspx">添加作品</a>]</li>
        <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server">
            <div>
                <div class="input-group">
                    <asp:TextBox ID="Skey_T" placeholder="作品标题" runat="server" CssClass="form-control max20rem" />
                    <span class="input-group-append">
                        <asp:Button ID="Search_B" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-outline-secondary" OnClick="Search_B_Click" />
                    </span>
                </div>
            </div>
        </div>
    </ol>
	<div class="list_choice table-responsive-md">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False"
        CssClass="table table-striped table-bordered table-hover" EmptyDataText="<%$Resources:L,当前没有信息 %>"
        OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="作品ID">
                <ItemTemplate>
                    <a href="http://www.banquanyin.com/<%#Eval("WorksID")%>" target="_blank"><%#Eval("WorksID")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="标题" DataField="Title" />
            <asp:BoundField HeaderText="作者" DataField="Author" />
            <asp:BoundField HeaderText="类型" DataField="Type" />
            <asp:BoundField HeaderText="转载收费" DataField="RepPrice" DataFormatString="{0:C}" />
            <asp:BoundField HeaderText="素材收费" DataField="MatPrice" DataFormatString="{0:C}" />
            <asp:BoundField HeaderText="添加时间" DataField="CreateDate" />
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate><%#Eval("Status").ToString().Equals("1") ? "添加成功" : "添加失败" %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="<%#Eval("FromUrl") %>" target="_blank"><i class="zi zi_globe"></i>浏览</a>
                    <a  href="AddWorks.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencil" title="修改"></i>修改</a>
                    <asp:LinkButton ID="Del" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确认删除？')" ><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i><%=Resources.L.删除 %></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    $("#sel_btn").click(function (e) {
        if ($("#sel_box").css("display") == "none") {
            $(this).addClass("active");
            $("#sel_box").slideDown(300);
        }
        else {
            $(this).removeClass("active");
            $("#sel_box").slideUp(200);
        }
    });
</script>
</asp:Content>
