<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelGroup_User.aspx.cs" Inherits="ZoomLaCMS.Common.Dialog.SelGroup_User"  MasterPageFile="~/Common/Common.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>选择用户</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid selgroup_body_top">
<div class="input-group mt-1">
<input type="text" id="search_t" class="form-control" placeholder="请输入用户名称,按回车搜索" />
<div class="input-group-append">
<span class="btn btn-info"><a id="search_b" href="javascript:;"><i class="fa fa-search"></i></a</span>
</div>
</div>
</div>
<div class="container-fluid selgroup_body">
	<div class="row" style="margin-bottom:5px;border-bottom:1px solid #ddd;">
		<div class="col-md-7">		
			<ul class="nav nav-tabs">
			  <li role="presentation" id="user_tab"  class="nav-item"><a class="nav-link active"  data-toggle="tab" role="tab" href="javascript:;" onclick="B_Users.SearchByList({});">所有人</a></li>
			</ul>
			<div class="selgroup_content" >
				<div class="userlist_div">
					<div class="text-right" id="backgroup_div" style="padding:5px;display:none;">
						<a href="javascript:;" onclick="B_Groups.Show()"><i class="fa fa-users"></i> 返回用户组</a>
					</div>
					<div id="userbody_div"></div>
					<div id="groupbody_div" style="display:none;"></div>
					<div class="">
						<div class="empty_div"></div>
						<div id="load_div" class="text-center"><a href="javascript:;" onclick="B_Users.LoadMore();">加载更多</a></div>
						<div id="wait_div" class="text-center"><i class="fa fa-spinner fa-spin" style="font-size: 40px;"></i></div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-5">
			<div class="nav nav-tabs"><a href="javascript:;" class="nav-link active">已选用户</a></div>
			<div id="seluser_div" class="userlist_div"></div>
<%--			<div class="center_div">
				<span class="fa fa-angle-right"></span>
			</div>--%>
		</div>
	</div>
	<div class="selgroup_foot">
		<button type="button" onclick="SelUser()" class="btn btn-info">确定选择</button>
		<a  class="btn btn-outline-info mr-2" href="javascript:;" onclick="B_Users.RemoveAll();">全部清空</a>
	</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
    //读取传参的初始配置
    var conf_init = { page: 1, psize: 15, skey: "", groupid: 0, char: "", selmode: "<%:Request["selmode"]%>" };
    conf_init = JSON.stringify(conf_init);
    //-----------------------
    var B_Users = {
        conf: JSON.parse(conf_init),
        sellist: [],//已选择用户数组
        //重置conf配置(分页与筛选条件)
        ResetConf:function(){
            var ref = this;
            ref.conf = JSON.parse(conf_init);
            //还原选项卡
            $(".tabs").removeClass('active');
            $("#user_tab").addClass('active');
            $("#backgroup_div").hide();//隐藏返回用户组操作
        },
        ShowWait:function(){//等待效果
            var ref = this;
            $(".empty_div").hide();
            $("#load_div").hide();
            $("#wait_div").show();
        },
        CloseWait: function () {
            var ref = this;
            $("#wait_div").hide();
            $("#load_div").show();
        },
        //加载已选中的用户
        LoadSelList:function(){
            var ref = this;
            $("#seluser_div").html('');
            var html = "<div class=\"userlist_item\" data-uid='@UserID'>"
                    + "<div class=\"item_face pull-left\"><img src=\"@salt\" onerror=\"this.src='/images/userface/noface.png';\"/></div>"
                    + "<div class=\"pull-left item_name\">@UserName</div>"
                    + "<div class=\"pull-right item_add\">移除</div>"
                    + "</div>";
            $("#seluser_div").append(JsonHelper.FillData(html, ref.sellist));
            //绑定事件
            $("#seluser_div .userlist_item").click(function () {//移除事件
                ref.RemoveUser($(this));
            });
        },
        //将用户添加入已选(传入元素控件,或Json格式用户信息)
        SelUser:function($obj){
            var ref = this;
            var user = {};
            if ($obj.data) { user = { UserID: $obj.data('uid'), salt: $obj.find('.item_face img').attr('src'), UserName: $obj.find('.item_name').text() }; }
            else { user = $obj; }
            //----------------------
            if (ref.sellist.GetByID(user.UserID, "UserID")) { return; }//已存在则不添加
            //----------------------
            if (ref.conf.selmode == "single") { ref.sellist = []; }
            ref.sellist.push(user);
            ref.LoadSelList();
        },
        //移除已选中用户操作
        RemoveUser:function($obj){
            var ref = this;
            ref.sellist.RemoveByID($obj.data('uid')+"", "UserID");
            ref.LoadSelList();
        },
        //移除全部已选择用户
        RemoveAll: function () {
            var ref = this;
            ref.sellist = [];
            ref.LoadSelList();
        },
        //搜索操作
        SearchByList: function (option) {
            var ref = this;
            $("#userbody_div").html('');
            ref.ResetConf();
            if (option.groupid) {//用户组查询
                //改变选项卡
                B_Groups.activeTabs();
                $("#backgroup_div").show();//返回用户组按钮
                ref.conf.groupid = option.groupid;
            }
            if (option.skey) {//按用户名搜索
                ref.conf.skey = option.skey;
            }
            if (option.char) {
                ref.conf.char = option.char;
            }
            ref.LoadMore();
        },
        //加载数据
        LoadMore: function () {
            var ref = this;
            $("#groupbody_div").hide();//隐藏用户组列表
            $("#userbody_div").show();//显示用户列表
            var $body = $("#userbody_div");
            ref.ShowWait();
            var url = "UserBody.aspx?";
            url += "config=<%=Request["config"]%>&skey=" + encodeURI(ref.conf.skey) + "&psize=" + ref.conf.psize + "&PIndex=" + ref.conf.page + "&groupid=" + ref.conf.groupid + "&char=" + ref.conf.char;
            $div = $("<div>");
            $div.load(url, {}, function () {
                ref.CloseWait();
                if ($div.find(".userlist_item").length < ref.conf.psize) {//没有更多的数据
                    $(".empty_div").html("<span style='color:#999;'>没有更多用户了!</span>");
                    $(".empty_div").show();
                    $("#load_div").hide();
                }
                //事件绑定
                $div.find('.userlist_item').click(function () {
                    ref.SelUser($(this));
                });
                $body.append($div.children());
                if ($body.find(".userlist_item").length <= 0) {//没有数据
                    $(".empty_div").html("<span style='color:#999;'>暂无数据!</span>");
                    $(".empty_div").show();
                    $("#load_div").hide();
                }
                ref.conf.page++;//翻页
            });
        }
    }
    var B_Groups = {
        Source:"user",
        Show: function () {//显示会员组列表
            var $body = $("#groupbody_div");
            $("#userbody_div").hide();//隐藏用户列表
            $body.show();//显示用户组列表
            $("#backgroup_div").hide();//隐藏返回用户组链接
            $("#load_div").hide();//隐藏加载更多
            $(".empty_div").hide();
        },
        activeTabs:function(){//选中tab操作
            var ref=this;
            //激活选项卡
            $(".tabs").removeClass('active');
            if (ref.Source == "user") { $("#group_tab").addClass('active'); }
            if (ref.Source == "plat") { $("#platgroup_tab").addClass('active'); }
            if (ref.Source == "oa")   { $("#structgroup_tab").addClass('active'); }
        },
        LoadGroups: function () {
            var ref = this;
            var $body = $("#groupbody_div");
            var $div = $("<div>");
            var url = "GroupBody.aspx?source="+ref.Source;
            ref.Show();
            ref.activeTabs();
            $body.html("");
            B_Users.ShowWait();
            $div.load(url, {}, function () {
                B_Users.CloseWait();
                $("#load_div").hide();
                //事件处理
                $div.find(".group_item").dblclick(function () {
                    $("[data-pid='" + $(this).data('gid') + "']").toggle();
                });
                //点击会员组,筛选会员
                $div.find(".gp_view").click(function () {
                    var gid = $(this).closest('.group_item').data('gid');
                    B_Users.SearchByList({ groupid: gid });
                });
                //将会员组全啊添加(注意过滤重复)
                $div.find(".gp_add_all").click(function () {
                    var gid = $(this).closest('.group_item').data('gid');
                    B_Users.ShowWait();
                    $.post("?action=sel", { "gid": gid }, function (data) {
                        try {
                            var list = JSON.parse(data);
                            for (var i = 0; i < list.length; i++) {
                                B_Users.SelUser(list[i]);
                            }
                        } catch (ex) { console.log("api falied", ex.message); }
                        B_Users.CloseWait();
                    });
                        
                });
                $body.append($div.children());
                if ($body.find(".group_item").length <= 0) {//没有数据
                    $(".empty_div").html("<span style='color:#999;'>暂无数据!</span>");
                    $(".empty_div").show();
                }
            })
        }
    };
    $(function () {
        $("form").submit(function () { return false; });//禁用form提交
        //搜索事件
        $("#search_t").keydown(function (e) {//回车绑定
            if (e.keyCode == 13) {
                B_Users.SearchByList({skey:$(this).val()});
            }
        });
        $("#search_b").click(function () {
            B_Users.SearchByList({ skey: $("#search_t").val() });
        });
        //字母筛选
        //$(".filter_list li a").click(function () {
        //    if ($(this).text() == "全部") { B_Users.SearchByList({}); return;}
        //    B_Users.SearchByList({ char: $(this).text() });
        //});
        B_Users.LoadMore();
    });
    //回调父窗体
    function SelUser() {
        var cbname = getParam2();
        if (parent.user.hook[cbname]) {
            parent.user.deal(B_Users.sellist, cbname);
        }
        else if(parent.UserFunc) { parent.UserFunc(B_Users.sellist, cbname); }
    }
</script>
</asp:Content>