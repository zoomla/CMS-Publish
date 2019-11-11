<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BiServerInfo.aspx.cs" Inherits="ZoomLaCMS.Manage.iServer.BiServerInfo" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问题详情</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/I/Main.aspx","工作台"),
new Bread("BiServer.aspx","有问必答"),
new Bread(){url="", text="问题详情"}
}) %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered sys_table">
        <tr>
            <th class="w12rem_lg">用户</th>
            <td>
                <span id="lblUserName" runat="server"></span>
            </td>
        </tr>
        <tr>
            <th>标题</th>
            <td>
                <asp:TextBox ID="Title_T" runat="server" CssClass="form-control max20rem" ReadOnly="true" />
            </td>
        </tr>
        <tr>
            <th>状态</th>
            <td>
                <asp:DropDownList ID="ISState_DP" CssClass="form-control max20rem" runat="server" AutoPostBack="False">
                    <asp:ListItem Value="未解决">未解决</asp:ListItem>
                    <asp:ListItem Value="处理中">处理中</asp:ListItem>
                    <asp:ListItem Value="已解决">已解决</asp:ListItem>
                    <asp:ListItem Value="已锁定">已锁定</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>优先级</th>
            <td>
                <asp:RadioButtonList ID="Priority_RBL" runat="server" RepeatDirection="Horizontal" >
                    <asp:ListItem Value="低">低</asp:ListItem>
                    <asp:ListItem Value="中">中</asp:ListItem>
                    <asp:ListItem Value="高">高</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th>提交来源</th>
            <td>
                <asp:DropDownList ID="ISRoot_DP" CssClass="form-control max20rem" runat="server" AutoPostBack="False">
                    <asp:ListItem Value="电话">电话</asp:ListItem>
                    <asp:ListItem Value="E-mai">E-mail</asp:ListItem>
                    <asp:ListItem Value="网页表单">网页表单</asp:ListItem>
                    <asp:ListItem Value="直接面谈">直接面谈</asp:ListItem>
                    <asp:ListItem Value="其它">其它</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>问题类别</th>
            <td>
                <asp:DropDownList ID="ISType_DP" CssClass="form-control max20rem" runat="server" DataTextField="name" DataValueField="name">                    
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>已读次数</th>
            <td>
                <asp:Label ID="lblReadCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <th>提交时间</th>
            <td>
                <asp:Label ID="lblSubTime" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <th>解决时间</th>
            <td>
                <asp:Label ID="lblSolveTime" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr><th>内容</th><td>
            <asp:Label runat="server" ID="Content_T"></asp:Label>
            </td></tr>
        <tr id="Attch_Tr" visible="false" runat="server">
            <th>附件</th>
            <td class="attch_td">
                <div id="Quest_Attch" class="uploader mt-2">
                    <ul class="filelist"></ul>
                </div>
                <asp:HiddenField ID="Quest_Attch_Hid" runat="server" />
            </td>
        </tr>
        <tr>
            <th>管理员备注</th>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" CssClass="form-control m50rem_50"  TextMode="MultiLine" Rows="4"></asp:TextBox>
        </tr>
        <tr>
            <th></th>
            <td>
                <asp:Button ID="Button2" runat="server" Text="保存修改" CssClass="btn btn-outline-info" OnClick="Button2_Click" />
                <input type="button" class="btn btn-outline-info" value="回复信息" onclick="showEditReply(0);" />
            </td>
        </tr>
    </table>
	</div></div>
<div>
<asp:Repeater runat="server" ID="Reply_RPT" OnItemCommand="Reply_RPT_ItemCommand">
        <ItemTemplate>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span>[<%#ZoomLa.Common.DataConverter.CLng(Eval("AdminID"))==0?"用户":"管理员" %>] </span>
                    <span><i class="zi zi_user"></i> <%#Eval("UserName") %></span>
                    <span><i class="zi zi_clock"></i> <%#Eval("ReplyTime","{0:yyyy年MM月dd日 HH:mm}") %></span>
                    <span>
                        <button type="button" class="btn btn-sm btn-info" onclick="showEditReply(<%#Eval("ID") %>);"><i class="zi zi_pencilalt"></i></button>
                        <asp:LinkButton runat="server" class="btn btn-sm btn-info" CommandName="del" CommandArgument='<%#Eval("Id") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt"></i></asp:LinkButton>
                    </span>
                </div>
                <div class="panel-body">
                  <%#Eval("Content") %>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
<div runat="server" id="Reply_Empty" class="alert alert-info">
暂无回复数据
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/js/zh-CN/attachment.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script>
$(function () {
    ZL_Webup.config.json.accept = 'img';
    $("#upfile_btn").click(ZL_Webup.ShowFileUP);
    $(".attch_td").each(function () {
        var attchpre = new MFileUP({ id: $(this).find(".uploader").attr('id'), hid: $(this).find("input[type='hidden']").attr('id') });
        attchpre.AddReadOnlyLi($(this).find("input[type='hidden']").val());
    });
});
function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
function showEditReply(id) {
    ShowComDiag("ISReplyAdd.aspx?Qid=<%:Mid%>&ID="+id,"回复信息");
}
function showuinfo(uid) {
    var url = siteconf.path + "User/UserInfo.aspx?id=" + uid
    comdiag.maxbtn = false;
    comdiag.ShowModal(url, "会员信息");
}
</script>
</asp:Content>
