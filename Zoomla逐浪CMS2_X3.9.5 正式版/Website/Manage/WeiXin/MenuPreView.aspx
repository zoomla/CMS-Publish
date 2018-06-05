<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MenuPreView.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.MenuPreView"  MasterPageFile="~/Common/Common.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>微信菜单预览</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div style="background: url(/App_Themes/User/bg_mobile.png) no-repeat 0 0; width: 327px; height: 695px;">
        <div style="height: 150px;"></div>
        <div style="height: 382px;"></div>
        <div style="height: 152px;">
            <ul class="menuul"></ul>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        var menuMod = {
            //"menu": {
            //    "button": [
            //    { "name": "菜单一", "sub_button": [{ "type": "click", "name": "子菜一", "key": "menu_0_btn_0", "sub_button": [] }] },
            //    { "name": "菜单二", "sub_button": [{ "type": "click", "name": "子菜", "key": "menu_1_btn_0", "sub_button": [] }] },
            //    { "name": "菜单三", "sub_button": [{ "type": "click", "name": "子菜三", "key": "menu_2_btn_0", "sub_button": [] }] }]
            //}
        };
        $(function () {
            menuMod = JSON.parse($(parent.document).find("#<%:Request.QueryString["Cid"]%>").val());
            CreateMenu();
            $(".item_a").click(function () {
                var $cbody = $(this).closest("li").find(".cbody");
                var flag = $cbody.is(":hidden"); $(".cbody").hide();
                if (flag) { $cbody.show(); } else { $cbody.hide(); }
            });
        })
        /*----------------------------------------------------*/
        function CreateMenu() {
            var btnlist = menuMod.menu.button;
            var itemtlp = '<li><div class="cbody"><div></div></div><a href="javascript:;" class="item_a">@name</a></li>';
            for (var i = 0; i < btnlist.length; i++) {
                var btn = btnlist[i];
                var $li = $(itemtlp.replace("@name", btn.name));
                $(".menuul").append($li);
                CreateChild($li, btn);
            }
        }
        //创建子菜单
        function CreateChild($li, btn) {
            var $cbody = $li.find(".cbody");
            var citemtlp = '<div class="citem">@name</div>';
            for (var i = 0; i < btn.sub_button.length; i++) {
                $cbody.append(citemtlp.replace("@name", btn.sub_button[i].name));
            }
        }
    </script>
</asp:Content>