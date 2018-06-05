<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceSeat.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Service.ServiceSeat" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>客服信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("","后台管理"),
        new Bread("","客服通"),
        new Bread() {url="/{manage}/User/Service/ServiceSeat.aspx", text="客服列表<a href='AddSeat.aspx'> [添加席位]</a>",addon="" }},
		Call.GetHelp(51)
		)
    %>
    <div class="table-responsive-md list_choice pr-1">
         <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False" OnRowDataBound="Egv_RowDataBound" 
               OnPageIndexChanging="Egv_PageIndexChanging" CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" DataKeyNames="S_ID" >
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="td_s">
                    <ItemTemplate><input type="checkbox" name="idchk" value="<%#Eval("S_ID") %>" /></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="客服名称" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "S_Name")%> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="头像" ItemStyle-CssClass="td_m">
                    <ItemTemplate><img class="img_50" src="<%#Eval("S_FaceImg") %>" onerror="shownopic(this);" /></ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="用户名" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="26px" HeaderStyle-Height="26px">
                    <ItemTemplate><%#Eval("S_Remrk")%> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="显示位置" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate><%#DataBinder.Eval(Container.DataItem, "S_Index")%> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="默认客服" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate><%#(DataBinder.Eval(Container.DataItem, "S_Default","{0}") == "1") ? "是" : "否"%> </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" HeaderStyle-Width="200px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtEdit" runat="server" OnClick="lbtEdit_Click" CssClass="option_style"><i class="zi zi_pencilalt" zico="笔黑"></i></asp:LinkButton>
                        <asp:LinkButton ID="lbtDel" runat="server" OnClick="lbtDel_Click" OnClientClick="javascript:return confirm('你确定要删除这个客服席位吗？')" CssClass="option_style"><i class="zi zi_trashalt" zico="垃圾箱竖条"></i></asp:LinkButton>
                        <a href="MsgEx.aspx?Uids=<%#Eval("S_AdminID") %>" title="查看该客服的聊天记录" class="option_style"><i class="zi zi_eye" title="查看"></i>聊天记录</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
		<div class="sysBtline">
        <asp:Button runat="server" ID="BatDel_Btn" CssClass="btn btn-outline-danger" Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗?');"/>
        <a href="/common/chat/cs_server.aspx" target="_blank" class="btn btn-outline-info">客服端聊天</a></div>
    </div>
    
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function getinfo(id) {
            location.href = "AddSeat.aspx?id=" + 1;
        }
    </script>
</asp:Content>
