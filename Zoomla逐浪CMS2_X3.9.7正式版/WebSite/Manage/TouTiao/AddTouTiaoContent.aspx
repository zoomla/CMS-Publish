<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTouTiaoContent.aspx.cs" Inherits="ZoomLaCMS.Manage.TouTiao.AddTouTiaoContent" ValidateRequest="false" MasterPageFile="~/Manage/I/Default.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>内容投递</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.js"></script>
    <style>#Content_T.edui-default { padding:0;border:0; }</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered" style="margin-bottom:60px;">
        <tr>
            <td class="text-right">文章分类：</td>
            <td>
                <asp:DropDownList ID="Types_DP" runat="server" CssClass="form-control text_300"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td_m text-right">文章标题：</td>
            <td>
                <asp:TextBox ID="Title_T" runat="server" Style="background: url(/Images/bg1.gif) repeat-x;" CssClass="form-control m715-50"></asp:TextBox>
                <input type="button" value="选择内容" class="btn btn-info" onclick="SelContent()" />
                <asp:RequiredFieldValidator ID="Title_Req_V" runat="server" ControlToValidate="Title_T" ForeColor="red" Display="Dynamic" ErrorMessage="文章标题不能为空" /> 
                <asp:RegularExpressionValidator ID="Title_Reg_V" ControlToValidate="Title_T" ValidationExpression="\S{5,30}" Display="Dynamic" runat="server" ForeColor="red" ErrorMessage="标题长度要在5-30之间"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="text-right">发文类型：</td>
            <td>
                <asp:RadioButtonList ID="IsSave_Rad" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="草稿" Value="0" Selected="True" />
                    <asp:ListItem Text="发布" Value="1" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="text-right">文章摘要：</td>
            <td>
                <asp:TextBox ID="Abs_T" runat="server" CssClass="form-control m715-50" Height="100px" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-right">文章内容：</td>
            <td>
                <asp:TextBox ID="Content_T" runat="server" CssClass="form-control m715-50" Height="300" TextMode="MultiLine"></asp:TextBox>
                <%=Call.GetUEditor("Content_T",3) %>
                <asp:RequiredFieldValidator ID="Content_V" runat="server" ControlToValidate="Content_T" ForeColor="red" Display="Dynamic" ErrorMessage="文章内容不能为空" /> 
            </td>
        </tr>
    </table>
        <div class="Conent_fix">
            <asp:Button ID="Add_B" runat="server" CssClass="btn btn-info" Text="发表文章" OnClientClick="SaveContent();" OnClick="Add_B_Click" />
            <button type="reset" class="btn btn-info" onclick="UE.getEditor('Content_T').setContent('');">重置</button>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        function SelContent() {
            ShowComDiag("/Common/Dialog/SelContent.aspx", "选择内容");
        }
        //获取选择的文章内容
        function GetContent(content, title) {
            console.log(content,title);
            UE.getEditor("Content_T").setContent(content);
            $("#Title_T").val(title);
            CloseComDiag();
        }
        function CloseDiag() {
            CloseComDiag();
        }
        function SaveContent() {
            $("#Content_T").val(UE.getEditor("Content_T").getContent());
        }
    </script>
</asp:Content>
