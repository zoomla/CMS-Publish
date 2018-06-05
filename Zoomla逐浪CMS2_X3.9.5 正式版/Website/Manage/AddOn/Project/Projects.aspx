<%@ Page Language="C#"  MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.Project.Projects" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title><%=lang.LF("查看项目")%></title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread() {url="", text="项目管理<a href='AddProjects.aspx'> [新增项目]</a>",addon="" }},
		Call.GetHelp(42)
		)
    %>
    <div class="list_choice">
      
        <div class="input-group d-flex flex-row" style="margin-bottom:5px;">
            <asp:DropDownList ID="SkeyType_DP" CssClass="form-control max20rem inputgp" runat="server">
                <asp:ListItem Value="1" Selected="True">项目名称</asp:ListItem>
                <asp:ListItem Value="2">项目经理</asp:ListItem>
                <asp:ListItem Value="3">技术负责人</asp:ListItem>
            </asp:DropDownList>
            <asp:TextBox ID="Skey_T" runat="server" class="form-control max20rem inputgp" placeholder="关键字" />
            <asp:TextBox runat="server" ID="STime_T" class="form-control max20rem inputgp" onclick="WdatePicker();" type="text" placeholder="开始时间" />
            <asp:TextBox runat="server" ID="ETime_T" class="form-control max20rem" onclick="WdatePicker();" type="text" placeholder="结束时间" />
            <span class="input-group-append">
                <asp:Button ID="BntSearch" runat="server" Text="查询" OnClick="BntSearch_Click" class="btn btn-outline-secondary" />
            </span>
        </div>

        <ul class="nav nav-tabs">
            <li class="nav-item" id="tab0"><a class="nav-link" href="Projects.aspx"><%=lang.LF("所有")%></a></li>
            <li class="nav-item" id="tab1"><a class="nav-link" onclick="ShowTabss(1,0)"><%=lang.LF("未审核")%></a></li>
            <li class="nav-item" id="tab2"><a class="nav-link" onclick="ShowTabss(2,0)"><%=lang.LF("已审核")%></a></li>
            <li class="nav-item" id="tab3"><a class="nav-link" onclick="ShowTabss(3,0)"><%=lang.LF("未启动")%></a></li>
            <li class="nav-item" id="tab4"><a class="nav-link" onclick="ShowTabss(4,0)"><%=lang.LF("已启动")%></a></li>
            <li class="nav-item" id="tab5"><a class="nav-link" onclick="ShowTabss(5,0)"><%=lang.LF("已完成")%></a></li>
            <li class="nav-item" id="tab6"><a class="nav-link" onclick="ShowTabss(6,0)"><%=lang.LF("存档")%></a></li>
        </ul>
        <div class="table-responsive">
            <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" OnRowDataBound="EGV_RowDataBound"
                OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" DataKeyNames="ID"
                CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关信息！">
                <Columns>
                    <asp:TemplateField ItemStyle-CssClass="td_xs">
                        <ItemTemplate>
                            <input type="checkbox" name="idchk" value="<%# Eval("ID") %>" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ID" HeaderText="ID" />
                    <asp:TemplateField HeaderText="项目名称">
                        <ItemTemplate>
                            <a href="ProjectsDetail.aspx?ProjectID=<%# Eval("ID","{0}")%>">
                                <%# Eval("ProName")%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="项目类型">
                        <ItemTemplate>
                            <a href="Projects.aspx?type=<%#Eval("ZType") %>&skey=<%:Skey%>&mystatus=<%:Status %>">
                                <%# GetProType(Eval("ZType","{0}")) %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="状态">
                        <ItemTemplate>
                            <%#Eval("ZStatus", "{0}") == "0" ? "<span style='color:green;'>已审核</span>" : "<span style='color:red;'>未审核</span>"%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="项目价格">
                        <ItemTemplate>
                            <i class="zi zi_yensign"></i><%#Eval("ProPrice", "{0:F2}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="项目经理">
                        <ItemTemplate>
                            <%#GetManageer(Eval("ProManageer","{0}"))%></a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="审核">
                        <ItemTemplate>
                            <%# GetAudit(Eval("ZStatus","{0}"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
             <%--       <asp:TemplateField HeaderText="项目管理">
                        <ItemTemplate>
                            <%# GetProStatus(Eval("ZStatus", "{0}"))%>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="当前进度">
                        <ItemTemplate>
                            <a href='<%#Eval("ID","ProjectsProcesses.aspx?ID={0}") %>'>
                                <div style="width: 90%; border: solid 1px green; height: 5px">
                                    <div id="line" runat="server" style="background-color: #bddb52; height: 5px; float: left">
                                    </div>
                                </div>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="申请时间">
                        <ItemTemplate>
                            <%#Eval("CDate","{0:yyyy年MM月dd日 HH:mm}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_m">
                        <ItemTemplate>
                            <a href="AddProjects.aspx?ID=<%#Eval("ID") %>"><i class="zi zi_squareCorrect" title="修改"></i></a>
                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="del" OnClientClick="return confirm('确实要删除吗？');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="Comments"><i class="zi zi_commentdots" title="评论"></i></asp:LinkButton>
<%--                            <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="Run"><i class="zi zi_toggleon"></i><%#Eval("ZStatus", "{0}") != "0"&& Eval("ZStatus", "{0}") != "1" ? "启动" : "停止"%></asp:LinkButton>--%>
<%--                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("ID")%>'
                                CommandName="Audit"></asp:LinkButton>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </ZL:ExGridView>
        </div>
        <asp:Button runat="server" ID="BatDel_Btn" CssClass="btn btn-outline-danger" Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除所选内容吗?');" /> 
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script>
        $(function () {
            $("#tab<%:MyStatus%>").find("a").addClass("active");
        })
        function getinfo(id) {
            location.href = "ProjectsDetail.aspx?ProjectID=" + id + "";
        }
        function fun(SkeyType_DP, Skey_T) {
            location.href = "Projects.aspx?SkeyType_DP=" + SkeyType_DP + "&Skey_T=" + Skey_T;
        }
        function ShowTabss(status, orderby) {
            location = "Projects.aspx?type=<%:SkeyType_DP.SelectedValue%>&skey=<%:Skey%>&mystatus=" + status;
        }

        HideColumn("6,7,8,9,10");
    </script>
</asp:Content>
