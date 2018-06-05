<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestCateMana.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.GuestCateMana" ValidateRequest="false" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title>栏目管理</title></asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Guest/GuestCateMana.aspx","栏目管理"),
        new Bread() {url="", text="<a href='javascript:;' onclick='ShowCate(0,0);' id='showDiv'>[添加版面目]</a> <a href='javascript:ShowOrder(0);'> [排序管理]</a>",addon="" }},
		Call.GetHelp(92)
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow table_box table-responsive-md">
    <asp:Repeater runat="server" ID="RPT">
        <HeaderTemplate>
            <table id="EGV"  class="table table-bordered table-hover list_choice listEGV">
             <tr><th class="w1rem"><input type="checkbox" id="ALLID_Chk"/></th><th>ID</th><th>图片</th><th>栏目名称</th><th>栏目状态</th><th>访问权限</th><th>计数(昨日/今日/总计)</th><th>操作</th></tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr data-layer="1" data-id="<%#Eval("CateID") %>" data-pid="0"  onclick="ShowChild(this,<%#Eval("CateID") %>);" ondblclick="ToggleChild(this);">
                <td><input name="idchk" type="checkbox" value='<%#Eval("CateID")%>' /></td>
                <td><%#Eval("CateID") %></td>
                <td class='img_td'>
                    <img class="img_3rem" src='<%#Eval("BarImage") %>' onerror="shownopic(this);" />
                    <img class="catebigimg" src='<%#Eval("BarImage") %>' onerror="shownopic(this);" />
                </td>
                <td><a href="TieList.aspx?CateID=<%#Eval("CateID") %>" title="浏览栏目内容"><span data-type="icon" class="<%#Convert.ToInt32(Eval("ChildCount"))>0?"zi zi_folders rep_tree_icon":"zi zi_file rep_tree_icon" %>" /></span></a>  <%#GetCateName()%></td>
                <td><span class="text-primary"><%#GetBarStatus(Eval("BarInfo").ToString()) %></span></td>
                <td><%#GetNeedLog(Eval("NeedLog").ToString()) %></td>
                <td><%#GetCount(Eval("CateID").ToString()) %></td>
                <td class='optd'>
                    <a href="javascript:;" onclick="ShowCate(<%#Eval("CateID") %>,0);"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <a href="javascript:;" onclick="ShowCate(0,<%#Eval("CateID")%>);"><i class='zi zi_plus' title='添加'></i>版面</a>
                    <a href='BarAuthSet.aspx?ID=<%#Eval("CateID")%>'><i class='zi zi_key' title='权限'></i>权限</a>
                    <%#Convert.ToInt32(Eval("ChildCount"))>0?"<a href=\"javascript:ShowOrder('"+Eval("Cateid")+"');\"><i class='zi zi_listol' title='排序'></i>排序</a>":"" %>
                    <a href="javascript:;" onclick="DelConfirm(<%#Eval("CateID") %>,1)"><i class="zi zi_filealt" title="清空"></i>清空本版数据</a>
                    <a href="javascript:;" onclick='DelConfirm(<%#Eval("CateID") %>,0);'><i class="zi zi_trashalt" title="删除"></i>删除</a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
	</div>
	</div>
    <script type="text/javascript">
        // /Images/TreeLineImages/plus.gif
        // /Images/TreeLineImages/tree_line4.gif
        // /Images/TreeLineImages/t.gif
        //整理为JS插件,方便子父级显示的开发
        //动态加载tr,替换模板中值,后台返回json
        //后台返回的Json中必须包含Layer,
        var childTlp = "<tr data-layer='@Layer' data-id='@Cateid' data-pid='@CatePid' onclick='ShowChild(this,@Cateid);' ondblclick='ToggleChild(this);'>"
        + "<td><input name='idchk' type='checkbox' value='@Cateid'></td>"
        + "<td>@Cateid</td>"
         + "<td class='img_td'><img class='img_3rem' src='@BarImage' onerror='shownopic(this);'><img class='catebigimg' src='@BarImage' onerror='shownopic(this);' /></td>"
        + "<td >@LayerHtml<img src='/Images/TreeLineImages/t.gif'><a href='TieList.aspx?CateID=@Cateid' title='浏览栏目内容'><span data-type='icon' class='@hasChImg'></span></a>  <a href='javascript:;' onclick='ShowCate(@Cateid,0)'>@Catename</a></td>"
        + "<td><span class='text-primary'><span class='text-primary'>@BarInfo</span></span></td><td>@NeedLogStr</td><td>@CountStr</td>"
        + "<td class='optd'><a href='javascript:;' onclick='ShowCate(@Cateid,0);'><i class='zi zi_pencilalt' title='修改'></i></a>"
        + "<a href='javascript:;' onclick='ShowCate(0,@Cateid);'><i class='zi zi_plus' title='添加'></i>版面</a>"
        + "<a href='BarAuthSet.aspx?ID=@Cateid'><i class='zi zi_key' title='权限'></i>权限</a>@hasChOrder"
        + "<a href='javascript:;' onclick='DelConfirm(@Cateid,0);'><i class='zi zi_trashalt' title='删除'></i>删除</a></td></tr>";
        var layerTlp = "<img src='/Images/TreeLineImages/tree_line4.gif' />";
        function ShowChild(obj, id) {
            $.ajax({
                type: "Post",
                //url: "Guest",
                data: { action: "GetChild", value: id },
                success: function (data) {
                    if (data != "" && data != "[]") {
                        data = JSON.parse(data);
                        var html = ReplaceTlp(childTlp, $(obj).data("layer"), data);
                        obj.onclick = "";
                        $(obj).after(html);
                        BindEvent();
                        $(obj).find("[data-type=icon]").attr("class", "zi zi_folderOpen rep_tree_icon");
                    }
                }
            });
        }
        //遍历Json数组,使用其替换模板中的值,后台需要将一些判断做好
        function ReplaceTlp(tlp, layer, data) {
            var html = "", layerhtml = "";
            //替换层级
            for (var i = 1; i < layer; i++) {
                layerhtml += layerTlp;
            }
            tlp = tlp.replace("@LayerHtml", layerhtml).replace("@Layer", ++layer);
            //替换模板
            for (i = 0; i < data.length; i++) {
                html += tlp.replace(/@Cateid/g, data[i].Cateid).replace(/@Catename/g, data[i].Catename).replace(/@CatePid/, data[i].ParentID)
                    .replace(/@BarInfo/, data[i].BarInfo).replace(/@NeedLogStr/, data[i].NLogStr).replace(/@CountStr/, data[i].CountStr)
                    .replace(/@BarImage/g, data[i].BarImage).replace(/@hasChImg/, parseInt(data[i].ChildCount) > 0 ? "zi zi_folders" : "zi zi_file")
                    .replace(/@hasChOrder/, parseInt(data[i].ChildCount) > 0 ? "<a href=\"javascript:open_page('SetCateOrder.aspx?id=" + data[i].Cateid + "');\"><i class='zi zi_listol' title='排序'></i>排序</a>" : "");
            }
            return html;
        }
        //确定是要显示还是隐藏
        function ToggleChild(obj) {
            var id = $(obj).data("id");
            $trs = $("#EGV tr[data-pid=" + id + "]");
            if ($trs.length < 1) return;
            var flag = $trs.is(":visible");
            if (flag){ 
                HideByPid(id);
                $(obj).find("[data-type=icon]").attr("class", "zi zi_folders");
            }//隐藏的话递归  
            else {
                $trs.show();
                $(obj).find("[data-type=icon]").attr("class", "zi zi_folderOpen");
            }
                
        }
        //true隐藏,false显示 
        function HideByPid(pid) {
            $trs = $("#EGV tr[data-pid=" + pid + "]");
            if (!$trs || $trs.length < 1) return;//不存在,或下再无子级时跳出递归
            for (var i = 0; i < $trs.length; i++) {
                HideByPid($($trs[i]).data("id"));
            }
            $("#EGV tr[data-pid=" + pid + "]").hide();
        }
    </script>
    <table  class="TableWrap"  border="0" width="100%" id="sleall">
	<tr>
		<td>
            <asp:Button ID="Dels_Btn" runat="server" CssClass="btn btn-outline-danger" Text="批量删除" OnClientClick="return confirm('是否确认删除选中栏目?')" OnClick="Dels_Btn_Click" />                 
            <asp:Button ID="BtnSetRecomPosation" runat="server" CssClass="btn btn-info" Text="批量推荐" OnClick="BtnSetRecomPosation_Click" />
            <asp:Button ID="BtnSetChanlnePosation" runat="server" CssClass="btn btn-outline-danger" Text="取消推荐" OnClick="BtnSetChanlnePosation_Click" />
		</td>
	</tr>                
</table>
<div id="footer" style="display:none;">
<input type="button" id="addbtn" class="btn btn-primary" value="添加" onclick="SaveTie()" />
<input type="button" data-dismiss="modal" value="关闭" class="btn btn-primary" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $("#ALLID_Chk").click(function () { selectAllByName(this, "idchk"); });
            BindEvent();
        });
        function BindEvent() {
            //$(".img_td").hover(function () { ShowImg(this); }, function () { $(".catebigimg").hide(); });
        }
        function ShowImg(obj) {
            $(obj).find(".catebigimg").show();
        }
        function DelConfirm(id,type) {
            if (type == 0 && confirm("确实要删除吗？当系统无栏目数据时，则不能发表留言!"))
            {
                location = "GuestCateMana.aspx?Type=" + gtype + "&Del=" + id;
            }
            if (type==1&&confirm("确实要清空本版数据吗？")) {
                location = "TieList.aspx?CateID=" + id + "&type=del";
            }
        }
        function ShowDesk() {
            var ifr = $("#cate_ifr")[0];
            window.location = ifr.contentWindow.location;
        }
        function ShowDesk2() {
            var ifr = $("#order_ifr")[0];
            window.location = ifr.contentWindow.location;
        }
        var gtype = "<%:GType%>";
        var diag = new ZL_Dialog();
        var diag2 = new ZL_Dialog();
        function ShowCate(id, pid) {
            //diag.width = 1024;
           // diag.height = 520;
            location.href="BarConfig.aspx?ID=" + id + "&GType=" + gtype + "&PID=" + pid;
            //if (id > 0) {
            //    diag.title = "修改栏目";
            //    $("#addbtn").val("修改");
            //}
            //else {
            //    diag.title = "添加栏目";
            //    $("#addbtn").val("添加");
            //}
            //diag.foot = $("#footer").html();
            //diag.ShowModal();
        }
        function ShowOrder(id) {
            
            //diag2.width = 800;
            //diag2.height = 400;
            diag2.title = "栏目排序";
            diag2.url = "SetCateOrder.aspx?id=" + id;
            diag2.ShowModal();
        }
    </script>
</asp:Content>
