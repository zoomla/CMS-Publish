<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CommentShow.aspx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.CommentShow" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>留言内容</title>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("ContentManage.aspx","内容管理"),
	new Bread("CommentManage.aspx?type=0","评论管理"),
	new Bread() {url=Request.RawUrl, text="评论详情",addon="" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg">ID</th>
            <td class="tdbg">
                <asp:Label ID="ID_L" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>发表人</th>
            <td class="tdbg">
                <asp:Literal ID="CUser_LB" runat="server"></asp:Literal>
            </td>
        </tr>
        <tr>
            <th>所属内容ID</th>
            <td class="tdbg">
                <asp:Label ID="CID_L" runat="server" data-show="onlyread"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>所属内容标题</th>
            <td class="tdbg">
                <asp:Label ID="Title_L" runat="server" data-show="onlyread"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>贴子内容</th>
            <td class="tdbg">
                 <asp:TextBox ID="MsgContent_T" runat="server" TextMode="MultiLine" Style="width: 90%; height: 200px;" />
            </td>
        </tr>
        <tr>
            <th>发表时间</th>
            <td class="tdbg">
                <asp:TextBox ID="CDate_T" runat="server" CssClass="form-control" onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm'});"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>操作</th>
            <td class="tdbg">
                <asp:Button ID="Save_Btn" CssClass="btn btn-outline-info" data-show="edit" runat="server" OnClick="Save_Btn_Click" Text="保存" />
                <a href="CommentManage.aspx" class="btn btn-outline-info">返回</a>
                <input type="button" id="onlyread_btn" onclick="EditFunc('onlyread');" value="取消修改" class="btn btn-primary" style="display:none;" data-show="edit" />
            </td>
        </tr>
    </table>
	</div></div>
    <%=Call.GetUEditor("MsgContent_T", 4) %>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        
        var userdiag = new ZL_Dialog();
        function ShowUserDiag(id) {
            userdiag.url = "../User/UserInfo.aspx?id=" + id;
            userdiag.title = "用户详情";
            userdiag.ShowModal();
        }
    </script>
</asp:Content>

