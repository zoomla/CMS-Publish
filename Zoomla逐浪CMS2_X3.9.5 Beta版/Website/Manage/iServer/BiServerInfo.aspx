<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BiServerInfo.aspx.cs" Inherits="ZoomLaCMS.Manage.iServer.BiServerInfo" ValidateRequest="false" MasterPageFile="~/Manage/I/Default.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>问题详情</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered">
        <tr>
            <td class="td_l">用户</td>
            <td>
                <span id="lblUserName" runat="server"></span>
            </td>
        </tr>
        <tr>
            <td>标题</td>
            <td>
                <asp:TextBox ID="Title_T" runat="server" CssClass="form-control text_405" ReadOnly="true" />
            </td>
        </tr>
        <tr>
            <td>状态</td>
            <td>
                <asp:DropDownList ID="ISState_DP" CssClass="form-control text_405" runat="server" AutoPostBack="False">
                    <asp:ListItem Value="未解决">未解决</asp:ListItem>
                    <asp:ListItem Value="处理中">处理中</asp:ListItem>
                    <asp:ListItem Value="已解决">已解决</asp:ListItem>
                    <asp:ListItem Value="已锁定">已锁定</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>优先级</td>
            <td>
                <asp:RadioButtonList ID="Priority_RBL" runat="server" RepeatDirection="Horizontal" >
                    <asp:ListItem Value="低">低</asp:ListItem>
                    <asp:ListItem Value="中">中</asp:ListItem>
                    <asp:ListItem Value="高">高</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>提交来源</td>
            <td>
                <asp:DropDownList ID="ISRoot_DP" CssClass="form-control text_405" runat="server" AutoPostBack="False">
                    <asp:ListItem Value="电话">电话</asp:ListItem>
                    <asp:ListItem Value="E-mai">E-mail</asp:ListItem>
                    <asp:ListItem Value="网页表单">网页表单</asp:ListItem>
                    <asp:ListItem Value="直接面谈">直接面谈</asp:ListItem>
                    <asp:ListItem Value="其它">其它</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>问题类别</td>
            <td>
                <asp:DropDownList ID="ISType_DP" CssClass="form-control text_405" runat="server" DataTextField="name" DataValueField="name">                    
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>已读次数</td>
            <td>
                <asp:Label ID="lblReadCount" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>提交时间</td>
            <td>
                <asp:Label ID="lblSubTime" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>解决时间</td>
            <td>
                <asp:Label ID="lblSolveTime" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr><td>内容</td><td>
            <asp:Label runat="server" ID="Content_T"></asp:Label>
            </td></tr>
        <tr id="Attch_Tr" visible="false" runat="server">
            <td>附件</td>
            <td class="attch_td">
                <div style="margin-top: 10px;" id="Quest_Attch" class="uploader">
                    <ul class="filelist"></ul>
                </div>
                <asp:HiddenField ID="Quest_Attch_Hid" runat="server" />
            </td>
        </tr>
        <tr>
            <td>管理员备注</td>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" CssClass="form-control" Width="700px" TextMode="MultiLine" Rows="4"></asp:TextBox>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button2" runat="server" Text="保存修改" CssClass="btn btn-primary" OnClick="Button2_Click" />
                <input type="button" class="btn btn-info" value="回复信息" onclick="showEditReply(0);" />
            </td>
        </tr>
    </table>
<div>
<asp:Repeater runat="server" ID="Reply_RPT" OnItemCommand="Reply_RPT_ItemCommand">
        <ItemTemplate>
            <div class="panel panel-info">
                <div class="panel-heading">
                    <span>[<%#ZoomLa.Common.DataConverter.CLng(Eval("AdminID"))==0?"用户":"管理员" %>] </span>
                    <span><i class="fa fa-user"></i> <%#Eval("UserName") %></span>
                    <span><i class="fa fa-clock-o"></i> <%#Eval("ReplyTime","{0:yyyy年MM月dd日 HH:mm}") %></span>
                    <span>
                        <button type="button" class="btn btn-sm btn-info" onclick="showEditReply(<%#Eval("ID") %>);"><i class="fa fa-pencil"></i></button>
                        <asp:LinkButton runat="server" class="btn btn-sm btn-info" CommandName="del" CommandArgument='<%#Eval("Id") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o"></i></asp:LinkButton>
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
