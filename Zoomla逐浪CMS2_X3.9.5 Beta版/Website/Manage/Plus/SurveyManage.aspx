<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.SurveyManage" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>问卷投票管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href="<%:customPath2+"I/Main.aspx" %>">工作台</a></li>
                <li class="active"><a href="SurveyManage.aspx">问卷投票管理</a><a href="Survey.aspx">[添加问卷投票]</a></li>
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
    <ZL:ExGridView ID="EGV"  CssClass="table table-striped table-bordered margin_t10" GridLines="None" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="10"
         OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" OnPageIndexChanging="EGV_PageIndexChanging">
        <EmptyDataTemplate>无相关数据</EmptyDataTemplate>
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-CssClass="td_s" />
            <asp:TemplateField HeaderText="问卷名称">
                <ItemTemplate>
                    <a href="Survey.aspx?ID=<%#Eval("ID") %>"><%#Eval("Title") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类别" ItemStyle-CssClass="td_m">
                <ItemTemplate><%#GetZTypeStr()%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="启用" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <%#Eval("ZStatus","").Equals("99")?ComRE.Icon_OK:ComRE.Icon_Error %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-Width="350">
                <ItemTemplate>
                    <a href="/Vote/Index?id=<%#Eval("ID") %>" target="_blank" class="option_style"><i class="fa fa-eye"></i>查看</a>
                    <a href="SurveyItemList.aspx?Sid=<%#Eval("ID") %>" class="option_style"><i class="fa fa-list-alt"></i>问题列表</a>
                    <a href="SurveyResult.aspx?id=<%#Eval("ID") %>" class="option_style"><i class="fa fa-pie-chart" title="分析"></i>结果分析</a>
                    <a href="SurveyResultList.aspx?ID=<%#Eval("ID") %>" class="option_style"><i class="fa fa-list"></i>结果列表</a>
                    <a href="Survey.aspx?ID=<%# Eval("ID") %>" class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
                    <asp:LinkButton ID="lbtnDel" runat="server" CommandName="Del" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('确实要删除吗？');" CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div>
        <asp:Button runat="server" ID="BatStop_Btn" Text="批量停用" OnClick="BatCmd_Btn_Click" CommandName="stop" class="btn btn-info"/>
        <asp:Button runat="server" ID="BatStart_Btn" Text="批量启用" OnClick="BatCmd_Btn_Click" CommandName="start" class="btn btn-info"/>
        <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatCmd_Btn_Click" CommandName="del" class="btn btn-danger" OnClientClick="return confirm('确定要删除吗');" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
