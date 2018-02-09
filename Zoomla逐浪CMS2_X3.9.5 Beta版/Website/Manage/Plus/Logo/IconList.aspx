<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IconList.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.Logo.IconList" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>图标列表</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li class="active"><a href='<%=Request.RawUrl %>'>作品列表</a> [<a href='Design.aspx'>创建作品</a>]</li>
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
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="预览图">
            <ItemTemplate>
               <embed src="<%#Eval("VPath") %>" style="width:50px;height:50px;"/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="类型">
            <ItemTemplate>
                <a><%#Eval("ZType") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <asp:LinkButton runat="server" class="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<div>
    <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" class="btn btn-info"/>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>