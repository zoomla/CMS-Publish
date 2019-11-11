<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BannerAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.AD.BannerAdd" MasterPageFile="~/Manage/I/Index.Master" ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>Banner信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
    new Bread("/{manage}/Plus/AD/Banner.aspx","Banner管理"),
    new Bread() {url=Request.RawUrl, text="Banner信息"}}
	)
%>
<table class="table table-bordered list_choice">
    <tr><td class="td_m">别名</td>
        <td><ZL:TextBox runat="server" ID="Alias_T" class="form-control text_300" AllowEmpty="false"/></td>
    </tr>
    <tr><td>图片</td>
        <td id="app">
            
         <%--   <div id="uploader" class="uploader" style="margin-top:5px;">
                <ul class="filelist"></ul>
            </div>--%>
       <%--     <asp:HiddenField  runat="server" id="Attach_Hid" />--%>
            <table class="table table-bordered table-striped">
                <tr>
                    <td style="width:100px;text-align:center;">图片</td>
                    <td>超链接</td>
                    <td>文本</td>
                    <td>文本2</td>
                    <td>文本3</td>
                    <td style="width:80px;">操作</td>
                </tr>
                <tr v-for="item in list">
                    <td><img v-bind:src="item.image" style="max-width:100px;max-height:100px;" /></td>
                    <td>
                        <input type="text" class="form-control" v-model="item.link" placeholder="页面链接超链接"/>
                    </td>
                    <td>
                        <input type="text" class="form-control" v-model="item.text" placeholder="Banner描述文字,按需填写"/>
                    </td>
                    <td>
                        <input type="text" class="form-control" v-model="item.text2" placeholder="Banner描述文字,按需填写"/>
                    </td>
                    <td>
                        <input type="text" class="form-control" v-model="item.text3" placeholder="Banner描述文字,按需填写"/>
                    </td>
                    <td>
                        <button type="button" class="btn btn-danger btn-sm" v-on:click="del(item);"><i class="zi zi_trash"></i></button>
                    </td>
                </tr>
            </table>
           <div style="margin-top:5px;">
                <input type="button" id="upfile_btn" class="btn btn-info btn-sm" value="上传图片" />
           </div>
            <asp:HiddenField runat="server" ID="Content_Hid" />
        </td>
    </tr>
    <tbody runat="server" id="edit_body" visible="false">
    <tr>
        <td>引用</td>
        <td>
            <asp:TextBox runat="server" ID="Quote_T" class="form-control"/>
        </td>
    </tr>
    </tbody>
    <tr>
        <td></td>
        <td>
            <asp:Button runat="server" ID="Save_Btn" class="btn btn-info" Text="保存信息" OnClick="Save_Btn_Click" OnClientClick="return preSave();" />
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/dist/vue/vue.min.js"></script>
<script>
//(item,index) in list
var app = new Vue({
    el: "#app",
    data: {
        list:[]
    },
    methods: {
        add: function (image) {
            var model = app.newModel();
            model.image = image;
            app.list.push(model);
        },
        del: function (item) {
            var list = app.list;
            for (var i = 0; i < list.length; i++) {
                if (list[i] == item) { list.splice(i, 1); return;}
            }
        },
        //从数据中加载
        init: function () {
            var content = $("#Content_Hid").val();
            if (!content || content == "[]") { return; }
            app.list = JSON.parse(content);
        },
        newModel: function () {
            return {
                index: 0, link: "", image: "", text: "", text2: "", text3: ""
            };
        },
    }
});
</script>
<script>
    $(function () {
        ZL_Webup.config.json.ashx = "action=admin_custom<%=HttpUtility.UrlEncode("&save="+banBll.BannerDir)%>";
        ZL_Webup.config.json.accept = "img";
        $("#upfile_btn").click(ZL_Webup.ShowFileUP);
        //--------------
        app.init();
    })
    function AddAttach(file, ret, pval) {
        app.add(ret._raw);
        //ZL_Webup.attachDiag.CloseModal();
    }
    function preSave() {
        for (var i = 0; i < app.list.length; i++) {
            app.list[i].index = i;
        }
        var json = JSON.stringify(app.list);
        $("#Content_Hid").val(json);
        return true;
    }
</script>
</asp:Content>