<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BiServer.aspx.cs" Inherits="ZoomLaCMS.Manage.iServer.BiServer" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=lang.LF("有问必答")%></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("BiServer.aspx","有问必答"),
        new Bread() {url="AddQuestionRecord.aspx", text="[添加问题记录]",addon="" }},
		Call.GetHelp(49)
		)
    %>
	<div class="list_choice pr-1">
	<div class="input-group mb-3">
	  <asp:TextBox ID="TextBox1" runat="server" Text="" class="form-control input-control max20rem" placeholder="请输入标题"></asp:TextBox>
	  <div class="input-group-append">
		<button class="btn btn-default" type="submit" onserverclick="Button1_Click" runat="server"><span class="zi zi_search"></span></button>
	  </div>
	</div>
	
    <div class="table-responsive">
        <table class="table table-striped table-bordered">
            <tr>
                <td colspan="2" class="title" align="center"><%=lang.LF("有问必答")%></td>
            </tr>
            <tr align="left" ondblclick="javascript:window.location.href='BselectiServer.aspx'">
                <td class="td_m" align="right"><a href="BselectiServer.aspx"><%=lang.LF("总数")%></a>：</td>
                <td>
                    <asp:Label ID="lblAllNum" runat="server" Text="0" onclick="jump(this,-1)"></asp:Label>
                </td>
            </tr>
            <tr align="left" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=1'">
                <td class="TitleTD" align="right">
                    <a href="BselectiServer.aspx?num=1"><font color="red"><%=lang.LF("未解决")%></font></a>：
                </td>
                <td>
                    <asp:Label ID="lblnum_w" runat="server" onclick="jump(this,1)"></asp:Label>
                </td>
            </tr>
            <tr align="left" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=2'">
                <td class="TitleTD" align="right">
                    <a href="BselectiServer.aspx?num=2"><font color="brown"><%=lang.LF("处理中")%></font></a>：
                </td>
                <td>
                    <asp:Label ID="lblNum_ch" runat="server" Text="" onmouseover="onUP(this)" onmouseout="onDown(this)" onclick="jump(this,2)"></asp:Label>
                </td>
            </tr>
            <tr align="left" ondblclick="javascript:window.location.href='BselectiServer.aspx?num=3'">
                <td class="TitleTD" align="right">
                    <a href="BselectiServer.aspx?num=3"><font color="green"><%=lang.LF("已解决")%></font></a>：
                </td>
                <td>
                    <asp:Label ID="lblnum_y" runat="server" Text="" onmouseover="onUP(this)" onmouseout="onDown(this)" onclick="jump(this,3)"></asp:Label>
                </td>
            </tr>
        </table>
        <div class="alert alert-info">
            <a href="BiServer.aspx?num=<%=StateNum %>" class="btn btn-default">全部</a>
            <asp:Repeater runat="server" ID="Type_RPT">
                <ItemTemplate>
                    <a class="btn btn-default" href="BiServer.aspx?num=<%#StateNum %>&type=<%# isBll.GetTypeIndex(Eval("Type","")) %>"><%#Eval("Type") %></a>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <ul class="nav nav-tabs" role="tablist" id="stateTabs">
            <li class="nav-item" data-tab="-100"><a class="nav-link" href="javascript:;" onclick="showState(this);">所有问题</a></li>
            <li class="nav-item" data-tab="1"><a class="nav-link" href="javascript:;" onclick="showState(this);">待解决</a></li>
            <li class="nav-item" data-tab="2"><a class="nav-link" href="javascript:;" onclick="showState(this);">处理中</a></li>
            <li class="nav-item" data-tab="3"><a class="nav-link" href="javascript:;" onclick="showState(this);">已解决</a></li>
            <li class="nav-item" data-tab="-1"><a class="nav-link" href="javascript:;" onclick="showState(this);">已关闭</a></li>
        </ul>
        <br />
        <table class="table table-striped table-bordered" id="EGV">
            <tr align="center">
                <th class="title"><%=lang.LF("编号")%></th>
                <th class="title"><%=lang.LF("标题")%></th>
                <th class="title">提交者</th>
                <th class="title"><%=lang.LF("优先级")%></th>
                <th class="title"><%=lang.LF("问题类型")%></th>
                <th class="title"><%=lang.LF("已读次数")%></th>
                <th class="title"><%=lang.LF("提交时间")%></th>
                <th class="title"><%=lang.LF("状态")%></th>
                <th class="title"><%=lang.LF("操作")%></th>
            </tr>
            <ZL:Repeater OnItemCommand="RPT_ItemCommand" ID="RPT" runat="server" PageSize="10"
                PagePre="<tr><td><label class='allchk_l' style='display: none;'><input type='checkbox' id='chkAll'/>全选</label></td><td colspan='8'><div class='text-center'>"
                PageEnd="</div></td></tr>">
                <ItemTemplate>
                    <tr class="text-center" ondblclick="javascript:location='BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>'">
                        <td>
                            <%# Eval("QuestionId")%>
                        </td>
                        <td>
                            <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>">
                                <%# Eval("Title", "{0}")%></a>
                        </td>
                        <td>
                            <a onclick="user.showuinfo(<%#Eval("UserId") %>)" href="javascript:;" title="查看会员"><%#GetUserName(Eval("UserId","{0}"))%></a>
                        </td>
                        <td><%# Eval("Priority")%></td>
                        <td><a href='BselectiServer.aspx?type=<%# returnType(Eval("type")) %>' target="_self"><%# Eval("type") %></a></td>
                        <td><%# Eval("ReadCount")%></td>
                        <td><%# Eval("SubTime")%></td>
                        <td>
                           <%#Eval("State") %>
                        </td>
                        <td>
                            <a href="BiServerInfo.aspx?QuestionId=<%#Eval("QuestionId")%>"><i class="zi zi_pencilalt" title="编辑"></i></a> 
                            <asp:LinkButton runat="server" CommandName="Del" CommandArgument='<%#Eval("QuestionId") %>' OnClientClick="return confirm('确认要删除此项?')" CssClass="option_style"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </ZL:Repeater>
        </table>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/JS/Dialog.js"></script>
    <script  type="text/javascript">
        if (getParam("num")) {
            $("li a[href='#tab" + getParam("num") + "']").parent().find("a").addClass("active").parent().siblings("li").find("a").removeClass("active");;
        };
        $(function () {
            $(".nav li[data-tab=<%=StateNum%>]").find("a").addClass("active");
        });
        $(function () {
            var num = $("#typeList").find("a[name='type']").length;
            if (parseInt(num) == 0)
                $("#typeList").hide();
        });
        function opentitle(url, title) {
            $("#title").text(title);
            $("#user_ifr").attr("src", url);
        };
        function checkAll() {
            xstatus = document.getElementById("cbAll").checked;
            var checkBoxs = document.getElementsByName("Btchk");
            for (i = 0; i < checkBoxs.length; i++) {
                checkBoxs[i].checked = xstatus;
            }

        };
        function isAnyOneChecked() {
            var checkBoxs = document.getElementsByName("Btchk");
            for (i = 0; i < checkBoxs.length; i++) {
                if (checkBoxs[i].checked) return true;
            }
        };
        function jump(obj, num) {
            var name = $(obj).text();
            if (parseInt(name) > 0) {
                if (num > 0)
                    window.location.href = "BselectiServer.aspx?num=" + num;
                else
                    window.location.href = "BselectiServer.aspx";
            }
        };
        function onUP(obj) {
            var name = $(obj).text();
            if (parseInt(name) > 0)
                $(obj).css({ "color": "#428bca", "cursor": "pointer", "text-decoration": "underline" });
            else
                $(obj).css({ "cursor": "default" });
        }
        function onDown(obj) {
            $(obj).css({ "color": "#000", "cursor": "default", "text-decoration": "none" });
        }
        function showState(a) {
            $tab = $(a).closest("li");
            var num = $tab.data("tab");
            var url = "BiServer.aspx?num=" + num;
            location = url;
        }
    </script>
</asp:Content>
