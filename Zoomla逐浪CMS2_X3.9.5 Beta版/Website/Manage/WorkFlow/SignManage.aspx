<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.SignManage" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>签章管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb navbar-fixed-top">
            <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li><a href='../Config/SiteOption.aspx'>系统设置</a></li>
            <li><a href='OAConfig.aspx'>OA配置</a></li>
            <li class='active'>签章管理<a href='AddSign.aspx'>[添加签章]</a></li>
            <div class="pull-right text-center" style="margin-right: 8px;"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
            <div id="sel_box" runat="server" class="padding5">
                <div class="input-group pull-left">
                    <asp:TextBox runat="server" ID="searchText" class="form-control" placeholder="请输入需要查询的信息" />
                    <span class="input-group-btn">
                        <asp:Button ID="searchBtn" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="searchBtn_Click" />
                    </span>
                </div>
            </div>
        </ol>
    </div>
    <div class="tab3">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" OnRowDataBound="EGV_RowDataBound" DataKeyNames="ID" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="签章名" DataField="SignName" />
                <asp:BoundField HeaderText="绑定用户" DataField="UserName" />
                <asp:TemplateField HeaderText="签章图">
                    <ItemTemplate>
                        <a onmouseout="showdiv(this)" onmouseover="showdiv(this)" class="lightbox" title="<%#Eval("SignName")%>">
                            <img src="<%#Eval("VPath") %>" title="<%#Eval("SignName")%>" alt="" style="width: 60px; height: 60px;" /></a>
                        <div class="imagediv" style="display: none; position: absolute;">
                            <img src="<%#Eval("VPath") %>" alt="" />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="签章密码">
                    <ItemTemplate>
                        <input type="button" class="btn btn-primary" value="查看" onclick="$(this).hide();$(this).siblings('span').show();" />
                        <span style="display:none;"><%#Eval("SignPwd") %></span>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="添加时间" DataField="CreateTime" />
                <asp:TemplateField HeaderText="状态">
                    <ItemTemplate>
                        <%# GetStatus(Eval("Status","{0}")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <a href="AddSign.aspx?ID=<%#Eval("ID") %>" class="option_style"><i class="fa fa-pencil" title="修改"></i></a> 
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除" CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle Height="24px" HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function showdiv(obj)
        {
            imagediv = $(obj).parent().find(".imagediv").toggle();
        }
        $().ready(function () {
            $(":button").addClass("btn btn-primary");
            $(":submit").addClass("btn btn-primary");
            $("#EGV tr:last >td>:text").css("line-height", "normal");
            $("#EGV tr:first >th").css("text-align", "center");
        });
    </script>
</asp:Content>
