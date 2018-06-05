<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="uinfo.aspx.cs" Inherits="ZoomLaCMS.Plat.Common.uinfo"  MasterPageFile="~/Plat/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="Head"><title>用户信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container platcontainer">
    <div class="userinfo">
        <div class="userinfo_tx">
            <img id="uface_img" src="#" runat="server"  onerror="shownoface(this);"  />
        </div>
        <div class="userinfo_zl">
            <div runat="server" id="HoneyName_L" class="urow userinfo_name"></div>
            <div runat="server" id="Post_L" class="urow r_gray"></div>
            <div runat="server" id="CompName_l" class="urow r_gray"></div>
            <div class="urow">
                <a title="发送站内信" href="javascript:;" onclick="openwin('mail');"><i class="zi zi_commentdots"></i></a>
                <a title="查看工作流" href="javascript:;" onclick="openwin('blog');" class="mt-1"><i class="zi zi_thead"></i></a>
            </div>
        </div>
        <hr/>
        <div class="urow">
            <span class="tdl">手机：</span>
            <asp:Label runat="server" ID="Mobile_L"></asp:Label>
        </div>
        <div class="urow">
            <span class="tdl">邮箱：</span>
            <asp:Label runat="server" ID="Mail_L"></asp:Label>
        </div>
        <div class="urow">
            <span class="tdl">工号：</span>
            <asp:Label runat="server" ID="WorkNum_L"></asp:Label>
        </div>
        <div class="urow">
            <span class="tdl">工作地点：</span>
            <asp:Label runat="server" ID="Work_L"></asp:Label>
        </div>
        <div class="urow">
            <span class="tdl">居住地址：</span>
            <asp:Label runat="server" ID="Home_L"></asp:Label>
        </div>
        <div class="urow">
            <span class="tdl">生日：</span>
            <asp:Label runat="server" ID="BirthDay_L"></asp:Label>
        </div>
    </div>
</div>
<asp:HiddenField runat="server" ID="uid_hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
function openwin(type) {
    var uid = $("#uid_hid").val();
    switch (type) {
        case "mail":
            window.open("/Plat/Mail/MessageSend.aspx?uid=" + uid);
            break;
        case "blog":
            window.open("/Plat/Blog/?uids=" + uid);
            break;
    }
}
</script>
</asp:Content>