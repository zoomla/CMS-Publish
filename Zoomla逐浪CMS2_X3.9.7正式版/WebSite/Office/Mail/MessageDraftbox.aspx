<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageDraftbox.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Mail.MessageDraftbox"  MasterPageFile="~/Office/OAMain.master"  ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>草稿箱</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript">
    $().ready(function () {
        $("#EGV tr:last >td>:text").css("line-height", "normal");
        $("#EGV tr:first >th").css("text-align", "center");
        $("#<%=EGV.ClientID%>  tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
        $("#chkAll").click(function () { selectAllByName(this, "idChk"); });
    });
    $().ready(function () {
        $("tr:gt(1)").addClass("tdbg");
        $("tr:gt(1)").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
        $("tr:gt(1)").dblclick(function () { v = $(this).find("[name='idChk']").val(); location = "MessageRead.aspx?read=1&id=" + v; });
        $("tr:last").unbind("mouseover").unbind("dblclick");
    });
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="mainDiv"> 
        <div class="us_seta mt-1">
            <div id="site_main">
			<div class="table-responsive-md pl-1 pr-1">
            <div class="input-group max20rem mb-1">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control" />
            <span class="input-group-append">
            <asp:Button runat="server" CssClass="btn btn-outline-secondary" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" />
            </span>
            </div> 
                    <ZL:ExGridView runat="server" ID="EGV"  AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" GridLines="None" CellPadding="2" CellSpacing="1"  CssClass="table table-striped table-bordered table-hover w-100" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="选择"  ItemStyle-HorizontalAlign="center">
                                <ItemTemplate>
                                    <input type="checkbox" name="idChk" value='<%#Eval("msgID")%>' />
                                </ItemTemplate>
                                <HeaderStyle ></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="主题">
                                <HeaderStyle  />
                                <ItemTemplate>
                                    <%# Eval("Title", "{0}")%>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="left" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="收件人"  ItemStyle-HorizontalAlign="center">
                                <ItemTemplate>
                                    <%#GetUserName(Eval("Incept","{0}")) %>
                                </ItemTemplate>
                                <HeaderStyle ></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="发件人">
                                <ItemTemplate>
                                    <%# GetUserName(Eval("Sender","{0}")) %>
                                </ItemTemplate>
                                <HeaderStyle ></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PostDate" HeaderText="发送日期" 
                                ItemStyle-HorizontalAlign="center">
                                <HeaderStyle ></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="操作"  ItemStyle-HorizontalAlign="center">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实要删除此信息到垃圾箱吗？');"
                                        CommandArgument='<%# Eval("MsgID")%>' Text="删除"></asp:LinkButton>
                                    <asp:LinkButton ID="lbRead" runat="server" CommandName="ReadMsg" CommandArgument='<%# Eval("MsgID")%>'>阅读信息</asp:LinkButton>
                                    <asp:LinkButton ID="lbEdite" runat="server" CommandName="EditeMsg" CommandArgument='<%# Eval("MsgID")%>'>编辑</asp:LinkButton>
                                </ItemTemplate>
                                <HeaderStyle></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                        <PagerStyle HorizontalAlign="Center" />
                        <RowStyle  HorizontalAlign="Center" />
                    </ZL:ExGridView>
                </div>
            </div>
			<div class="sysBtline">
            <asp:Button ID="Button3" runat="server"  Text="批量删除" OnClick="Button2_Click" OnClientClick="return confirm('确定要删除吗,草稿箱删除的邮件不会进入回收站!!');" class="btn btn-outline-danger" />
			</div>
        </div>
    </div>
</asp:Content>