<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditWxMenu.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.EditWxMenu"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>自定义菜单</title>
<style type="text/css">
.pull-left{float:left;}
.pull-right{float:right;}
#menu_ul .zi{padding-right:5px;padding-top:5px;}
.citem:hover{cursor:pointer;background-color:#e9e9e9;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:Label runat="server" ID="Bread_L"></asp:Label>
<div id="app">
    <div class="container-fluid pr-0">
        <div class="row sysRow list_choice table-responsive-md">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-header">
                        菜单管理 
                            <div class="pull-right menu_option">
                                <a href="javascript:;" v-on:click="showAdd(null)"><span class="zi zi_plus"></span></a>
                                <a href="javascript:;" v-on:click="save"><span class="zi zi_floppyDisk"></span></a>
                            </div>
                    </div>
                    <div>
                        <ul class="list-group" id="menu_ul">
                            <li class="list-group-item" v-for="menu in menus">
                                <div class="input-group">
                                    <div class="input-group-prepend">
                                        <i class="zi zi_textbook"></i>
                                    </div>
                                    <input type='text' v-model="menu.name" class='form-control' style="max-width:150px;" maxlength="6" placeholder="请输入菜单名"/>
                                    <input type="text" v-model="menu.url"  class="form-control" placeholder="菜单链接,添加子菜单后失效,示例:https://www.xxx.com/" v-bind:disbaled="menu.sub_button.length>0"/>
                                    <div class="input-group-append">
                                        <a class="btn btn-light" href='javascript:;' v-on:click='showLink(menu)'><i class='zi zi_link'></i></a>
                                        <a class="btn btn-light" href='javascript:;' v-on:click='showAdd(menu)'><i class='zi zi_plus'></i></a>
                                        <a class="btn btn-light" href='javascript:;' v-on:click='del(menu)'><i class='zi zi_trashalt'></i></a>
                                    </div>
                                </div>
                                <div v-for="btn in menu.sub_button" class="input-group" style="padding-left:30px;margin-top:5px;">
                                    <div class="input-group-prepend">
                                        <i class="zi zi_fileNew"></i>
                                    </div>
                                    <input type='text' v-model="btn.name" class='form-control' placeholder="子菜单名" style="max-width:150px;" maxlength="6"/>
                                    <input type="text" v-model="btn.url"  class="form-control" placeholder="子菜单链接"/>
                                    <div class="input-group-append">
                                        <a class="btn btn-light" href='javascript:;' v-on:click='showLink(btn)'><i class='zi zi_link'></i></a>
                                        <a class="btn btn-light" href='javascript:;' v-on:click="delBtn(menu,btn)"><i class='zi zi_trashalt'></i></a>
                                    </div>
                                </div>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-header">预览 </div>
                    <div class="card-body">
                        <div style="background: url(/App_Themes/User/bg_mobile.png) no-repeat 0 0; width: 327px; height: 695px;margin:0 auto;">
                            <div style="height: 150px;"></div>
                            <div style="height: 380px;"></div>
                            <div style="height: 152px;">
                                <ul class="menuul">
                                    <li v-for="menu in menus">
                                        <div class="cbody" style="margin-bottom:16px;">
                                            <div class="citem" v-for="sub in menu.sub_button">
                                                <a style="display:block;text-decoration:none;" v-if="sub.url==''">{{sub.name}}</a>
                                                <a v-bind:href="sub.url" target="_blank" style="display:block;text-decoration:none;" v-else>{{sub.name}}</a>
                                            </div>
                                        </div>
                                        <a href="javascript:;" class="item_a" v-bind:href="menu.url" target="_blank" v-if="menu.sub_button.length<1&&menu.url!=''">{{menu.name}}</a>
                                        <a href="javascript:;" class="item_a" v-on:click="viewBtns" v-else>{{menu.name}}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	        </div>
	</div>
    
    <input type="hidden" id="preview_hid" />
    <div class="Conent_fix text-center">
        <button type="button" class="btn btn-info" v-on:click="save()"><i class="zi zi_upload"></i> 保存菜单至服务器</button>
    </div>
    <div class="modal fade" id="AddMenu">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
				    <h4 class="modal-title">添加菜单</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                </div>
                <div class="text-center p-2">
                    <input type="text" id="menuname_t" class="form-control" placeholder="输入菜单按钮名称" /><br />
                    <div class="m-1">
                        <button type="button" class="btn btn-info mt-2" v-on:click="add">确定</button>
                        <button type="button" onclick="CloseModal()" class="btn btn-outline-info mt-2">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="SetLink">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
					    <h4 class="modal-title">设置链接</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group">
                        <select class="form-control" style="max-width:80px;" id="link_dp">
                            <option value="内容">内容</option>
                            <option value="商品">商品</option>
                            <option value="问券">问券</option>
                        </select>
                        <input type="text" id="link_t" class="form-control" placeholder="请输入内容/商品/问券的ID"/>
                    </div>
                    </div>
                    <div class="modal-footer" style="border-top:1px solid #ddd;">
                        <button type="button" class="btn btn-info mt-2" v-on:click="setLink">确定</button>
                        <button type="button" onclick="CloseModal();" class="btn btn-outline-info mt-2">关闭</button>
                    </div>
                </div>
            </div>
        </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/dist/vue/vue.js"></script>
<script>
    var app = new Vue({
        el: "#app",
        methods: {
            init: function () {
                $.post("EditWxMenu.aspx?action=get&appid=<%:AppId%>", {}, function (data) {
                    console.log(data);
                    var model = APIResult.getModel(data);
                    if (APIResult.isok(model) && model.result.menu) {
                        app.menus = model.result.menu.button;
                    }
                    else {
                        var ret = JSON.parse(model.retmsg);
                        alert(model.retmsg);
                    }
                })

            },
            edit: function (item) { },
            del: function (menu) {
                var ref = this;
                for (i = 0; i < ref.menus.length; i++) {
                    if (ref.menus[i] == menu) { ref.menus.splice(i, 1); break; }
                }
            },
            //删除菜单下btn
            delBtn: function (menu, btn) {
                for (i = 0; i < menu.sub_button.length; i++) {
                    if (menu.sub_button[i] == btn) { menu.sub_button.splice(i, 1); break; }
                }

            },
            //添加最上一级的主菜单,最多只可放四个
            showAdd: function (item) {
                var ref = this;
                ref.parent = item;
                if (!item && ref.menus.length >= 3) {
                    alert("一级菜单数量最多为3个!"); return;
                }
                if (item && item.sub_button.length >= 5) {
                    alert("二级菜单数量最多为5个"); return;
                }
                $("#AddMenu").modal({});
                $("#menuname_t").val('');
            },
            showLink: function (item) {
                var ref = this;
                ref.current = item;
                $("#SetLink").modal({});
                $("#menuname_t").val('');
            },
            setLink: function () {
                var ref = this;
                var id = $("#link_t").val();
                if (!id) { id = "0";}
                var siteUrl = "<%=ZoomLa.Components.SiteConfig.SiteInfo.SiteUrl%>";
                switch ($("#link_dp").val()) {
                    case "内容":
                        siteUrl += "/Item/" + id + ".aspx";
                        break;
                    case "商品":
                        siteUrl += "/Shop/" + id + ".aspx";
                        break;
                    case "问券":
                        siteUrl += "/Vote/Index?id="+id;
                        break;
                }
                ref.current.url = siteUrl;
                CloseModal();
            },
            add: function () {
                var ref = this;
                var parent = ref.parent;

                if (!parent || parent == null) {
                    var newModel = { name: $("#menuname_t").val(), url: "", key: '', sub_button: [] };
                    ref.menus.push(newModel);
                }
                else {
                    var newModel = { name: $("#menuname_t").val(), url: "", key: ''};
                    parent.sub_button.push(newModel);
                }
                CloseModal();
            },
            save: function () {
                var ref = this;
                if (ref.menus.length < 1) { alert("请先添加菜单"); return; }
                //检测数据(不完整数据如:缺少type字段等将使用默认值代替)
                function CheckData() {
                    for (var i = 0; i < ref.menus.length; i++) {
						ref.menus[i].type="view";
						ref.menus[i].key = "button_" + i;
                        if (!ref.menus[i].sub_button||ref.menus[i].sub_button.length<1) {
							//没有子菜单的情况下默认将它设为按钮类型
                            //ref.menus[i].type = "click";
                        }   
                        if (ref.menus[i].sub_button) {//遍历子菜单
                            for (var j = 0; j < ref.menus[i].sub_button.length; j++) {
                                ref.menus[i].sub_button[j].type = "view";
                                ref.menus[i].sub_button[j].key = "menu_" + i + "_btn_" + j;
                            }
                        }
                    }
                }
                CheckData();
				console.log(ref.menus);
                $.post("EditWxMenu.aspx?action=create&appid=<%:AppId%>", { "menus": JSON.stringify(ref.menus) }, function (data) {
                     var model = APIResult.getModel(data);
                     if (APIResult.isok(model)) { alert('保存成功!'); }
                     else {
                         var ret = JSON.parse(model.retmsg);
                         if (ret.errmsg == "ok") { alert('保存成功!'); } else { alert("保存出错!") }
                     }
                 })
            },
            //-------------------------------
            viewBtns: function (e) {
                var $cbody = $(e.target).closest("li").find(".cbody");
                var flag = $cbody.is(":hidden"); $(".cbody").hide();
                if (flag) { $cbody.show(); } else { $cbody.hide(); }
            },
        },
        data: {
            menus: [],
            parent: null,//当前处理添加状态的父元素
            current:null,//当前操作的元素
        }
    });
    function CloseModal() {
        $("#AddMenu").modal("hide");
        $("#SetLink").modal("hide");
    }
    app.init();
</script>
</asp:Content>