<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADAdbuy.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.ADAdbuy" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>广告申请</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Plus/ADManage.aspx","广告管理"),
        new Bread() {url="ADAdbuy.aspx", text="广告申请",addon="" }},
		Call.GetHelp(31)
		)
    %>
   <div style="height:55px;"></div>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
        PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false"
        AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True"
        EmptyDataText="暂无相关数据！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="序号" DataField="ID">
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="申请人">
                <ItemTemplate>
                    <a href="../User/UserInfo.aspx?ID=<%# Eval("UID") %>" title="<%# SetName(Eval("UID", "{0}"))%>"><%# SetName(Eval("UID", "{0}"))%></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="版位名称">
                <HeaderStyle />
                <ItemTemplate>
                    <%#Eval("ZoneName")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="权重">
                <HeaderStyle />
                <ItemTemplate>
                    <asp:HyperLink ID="LnkSales" runat="server"><%# Eval("Scale")%></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="投放时间">
                <ItemTemplate>
                    <asp:HyperLink ID="LnkPtime" runat="server"><%# Eval("Ptime")%></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="申请天数">
                <HeaderStyle />
                <ItemTemplate>
                    <asp:HyperLink ID="LnkShowTime" ToolTip='<%# Eval("ShowTime")%>' runat="server"><%# Eval("ShowTime")%></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="广告内容">
                <HeaderStyle />
                <ItemTemplate>
                    <asp:HyperLink ID="LnkContent" runat="server"><%# Eval("Content", "{0}")%></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="False" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="附件">
                <HeaderStyle />
                <ItemTemplate><%#Eval("Files")%> </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="申请时间">
                <ItemTemplate>
                    <asp:HyperLink ID="LnkTime" runat="server"><%# Eval("Time")%></asp:HyperLink>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" Wrap="True" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <%#Eval("State","")=="0"?"<span style='color:green;'>正常</span>":"<span style='color:red;'>用户已取消</span>" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="已审核">
                <ItemTemplate><%# (bool)Eval("Audit") == false ?ComRE.Icon_Error:ComRE.Icon_OK%> </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div style="margin-top: 5px;">
        <asp:Button ID="BtnDelete" runat="server" Text="批量删除" OnClientClick="return confirm('你确定要删除选中条目吗？');" OnClick="BtnDelete_Click" class="btn btn-outline-danger" />
        <asp:Button ID="BtnAudit" runat="server" Text="批量审核" OnClick="BtnAudit_Click" class="btn btn-outline-info" />
        <asp:Button ID="BtnAuditCancel" runat="server" Text="取消审核" OnClick="BtnAuditCancel_Click" class="btn btn-outline-info" />
    </div>
   
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            if (getParam("type")) {
                $("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
            }
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=chkSel]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>
