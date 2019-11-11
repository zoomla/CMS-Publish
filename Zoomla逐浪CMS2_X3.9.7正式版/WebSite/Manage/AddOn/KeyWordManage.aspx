<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="KeyWordManage.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.KeyWordManage" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>关键字集</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb fixed-top w-100">
                <li class="breadcrumb-item"><a href="/admin/I/Main.aspx">工作台</a></li>
                <li class="breadcrumb-item"><a href="ContentManage.aspx">内容管理</a></li>
                <li class="breadcrumb-item"><a href="<%=Request.RawUrl %>">关键字集</a> [<a href="AddKeyWord.aspx">添加关键字</a>]</li>
                <div id="help" class="pull-right text-center"><a href="javascript:;" class="help_btn active" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
                <div id="sel_box">
                    <div class="input-group">
                        <asp:TextBox runat="server" ID="Search_T" CssClass="form-control max20rem" placeholder="请输入关键词" onkeypress="selbox.search();" />
                        <span class="input-group-append">
                            <asp:Button runat="server" CssClass="btn btn-outline-secondary" ID="Search_Btn" Text="搜索" OnClick="Search_Btn_Click" />
                        </span>
                    </div>
                </div>
            </ol>
        </div>
    </div>
	<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-bordered table-striped" id="EGV">
        <tr>
            <td scope="col" class="w1rem"></td>
            <td scope="col" class="">
                <asp:LinkButton runat="server" ID="IDOrder_Btn" CommandName="" CommandArgument="desc" OnClick="ChangeOrder_Click">ID <i class="zi zi_arrowUp"></i></asp:LinkButton></td>
            <td scope="col">
                <asp:LinkButton runat="server" ID="PriOrder_Btn" CommandName="priority" CommandArgument="desc" OnClick="ChangeOrder_Click">权重</asp:LinkButton></td>
            <td>关键字</td>
            <td scope="col">时间</td>
            <td scope="col">查询次数</td>
            <td scope="col">引用次数</td>
            <td scope="col"></td>
        </tr>
        <ZL:ExRepeater runat="server" ID="RPT" OnItemCommand="RPT_ItemCommand" PageSize="10" PagePre="<tr><td><label class='allchk_l'><input type='checkbox' id='AllID_Chk'>全选</label></td><td colspan='8'><div class='text-center'>" PageEnd="</div></td></tr>">
            <ItemTemplate>
                <tr ondblclick="AddKeyWord.aspx?ID=<%#Eval("KeywordID") %>">
                    <td>
                        <input type="checkbox" name="idchk" value='<%#Eval("KeywordID") %>' /></td>
                    <td><%#Eval("KeyWordID")%></td>
                    <td><%#Eval("Priority")%></td>
                    <td class="text-left"><a href="AddKeyWord.aspx?ID=<%#Eval("KeywordID")%>"><%# DataBinder.Eval(Container.DataItem, "KeywordText")%></a></td>
                    <td><%#Eval("LastUseTime","{0:yyyy/MM/dd HH:mm}") %></td>
                    <td><%#Eval("Hits")%></td>
                    <td><%#Eval("QuoteTimes")%></td>
                    <td>
                        <a href='AddKeyWord.aspx?ID=<%# Eval("KeywordID")%>' ><i class="zi zi_pencilalt"></i></a>
                        <asp:LinkButton runat="server" CommandArgument='<%#Eval("KeywordID") %>' CommandName="del2"  OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </table>
	</div>
	</div>
    <div class="sysBtline">
        <asp:Button class="btn btn-outline-danger" ID="BatDel_Btn" runat="server" OnClientClick="return confirm('确定要删除吗');" Text="删除选定关键字" OnClick="BatDel_Btn_Click" />
    </div>
    <div class="clearfix"></div>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        $(function () {
            $("#AllID_Chk").click(function () {//EGV 全选
                selectAllByName(this, "idchk");
            });
        });
    </script>
</asp:Content>