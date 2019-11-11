<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgEx.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Service.MsgEx"MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>客服聊天记录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ServiceSeat.aspx","客服通"),
        new Bread() {url="/{manage}/User/Service/MsgEx.aspx", text="聊天记录",addon="" }}
		)
    %>
	<div class="list_choice table-responsive-md pr-1">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" PageSize="10" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据！！" OnRowCommand="EGV_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="发送者">
                <ItemTemplate>
                    <a href="Userinfo.aspx?id=<%#Eval("UserID") %>" target="_blank"><%#GetSender() %></a> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="接收者">
                <ItemTemplate>
                    <%#GetReceUser() %>
                </ItemTemplate>
            </asp:TemplateField>
<%--            <asp:TemplateField HeaderText="内容">
                <ItemTemplate>
                    <%#ZoomLa.Common.StringHelper.SubStr(Eval("Content")) %>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField HeaderText="发送时间" DataField="CDate" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="MsgInfo.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton ID="Del" runat="server" CommandName="del" OnClientClick="return confirm('确定删除该记录?')" CommandArgument='<%#Eval("ID") %>'><i class="zi zi_trashalt" zico="垃圾箱竖条"></i></asp:LinkButton>
                    <a href="MsgList.aspx?suid=<%#Eval("UserID") %>&ruid=<%#Eval("ReceUser") %>" title="查看聊天详情" target="_blank" ><i class="zi zi_eye" title="查看"></i>查看详情</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
    <div class="sysBtline">
      <asp:Button ID="DelChats" class="btn btn-outline-danger"  runat="server" OnClientClick="return confirm('确定删除选中记录？')" OnClick="DelChats_Click"  Text="批量删除" />
      <asp:Button ID="DelByWeek" class="btn btn-outline-info" OnClientClick="return confirm('确定删除上一周的记录？')" OnClick="DelByWeek_Click" runat="server" Text="删除上周数据" />
    </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        $().ready(function () {
            $("#EGV tr").dblclick(function () {
                var id = $(this).find("input[name=idchk]").val();
                if (id) {
                    window.location = "MsgInfo.aspx?id=" + id;
                }
            });
        });
        var userDiag = new ZL_Dialog();
        function ShowUInfo(uid) {
            userDiag.title = "用户信息";
            userDiag.reload = true;
            userDiag.url = "Userinfo.aspx?id=" + uid;
            userDiag.ShowModal();
        }
    </script>
</asp:Content>
