<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.AdminManage"MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.管理员管理 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
new Bread("{admin}"),
new Bread(Request.RawUrl,Resources.L.管理员),
new Bread("AddManage.aspx","["+Resources.L.添加管理员 +"]")
},"{search}") %>
<script>var mvcpage = { load: function () { location = "AdminManage.aspx?Skey=" + encodeURI($("#skey").val()); } };</script>
    <ul class="nav nav-tabs list_choice">
        <li class="nav-item" data-tag="-100"><a class="nav-link" href="AdminManage.aspx"><%=Resources.L.全部 %></a></li>
        <li class="nav-item" data-tag="0"><a class="nav-link" href="AdminManage.aspx?islock=0"><%=Resources.L.已审核 %></a></li>
        <li class="nav-item" data-tag="1"><a class="nav-link" href="AdminManage.aspx?islock=1"><%=Resources.L.未审核 %></a></li>
    </ul>
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" PageSize="20" AutoGenerateColumns="False" OnPreRender="EGV_PreRender"
        class="table table-striped table-bordered table-hover" DataKeyNames="AdminID" OnPageIndexChanging="Egv_PageIndexChanging" 
        OnRowCommand="Lnk_Click" OnRowDataBound="Egv_RowDataBound">
        <Columns>
            <asp:TemplateField >
                <ItemTemplate>
                    <input name="idchk" type="checkbox" title="<%=Resources.L.全选 %>" value="<%#Eval("AdminID") %>"  />
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#ShowOrderMethod("adminid")%>' CommandName="order">
                         ID  <%#ShowOrderIcon("adminid") %>
                    </asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <%# Eval("AdminID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,状态 %>" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate><%# ZoomLa.Common.DataConverter.CBool(DataBinder.Eval(Container, "DataItem.IsLock", "{0}")) ? "<span stytle='color:red;'>锁定</span>" : "正常"%> </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,管理员名称 %>">
                <ItemTemplate>
                    <a href="AddManage.aspx?id=<%#Eval("AdminId") %>"><%#Eval("AdminName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,真实姓名 %>" DataField="AdminTrueName" ItemStyle-HorizontalAlign="Center" />
            <asp:TemplateField HeaderText="<%$Resources:L,管理员角色 %>" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="max20rem">
                <ItemTemplate>
                 <%#GetRoleName() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,关联会员 %>" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%#GetUserName() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,最近IP %>">
                <ItemTemplate>
                    <div class="" style="overflow:hidden;"><%#GetIpLocation(Eval("LastLoginIP").ToString()) %></div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,上次修改密码时间 %>" DataField="LastModifyPwdTime" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:yyyy-MM-dd HH:mm}">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#ShowOrderMethod("cdate")%>' CommandName="order">
                         <%=Resources.L.创建时间 %>  <%#ShowOrderIcon("cdate") %>
                    </asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <%#Eval("CDate","{0:yyyy-MM-dd HH:mm}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#ShowOrderMethod("LastLogoutTime")%>' CommandName="order">
                         <%=Resources.L.最近活跃时间 %>  <%#ShowOrderIcon("LastLogoutTime") %>
                    </asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <%#Eval("LastLogoutTime","{0:yyyy-MM-dd HH:mm}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#ShowOrderMethod("LoginTimes")%>' CommandName="order">
                         <%=Resources.L.登录次数 %>  <%#ShowOrderIcon("LoginTimes") %>
                    </asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <%#Eval("LoginTimes") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,操作 %>" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <a href="AddManage.aspx?ID=<%#Eval("AdminID") %>"><i class="zi zi_pencilalt" title="<%=Resources.L.修改 %>"></i></a>
                    <asp:LinkButton runat="server" CommandName="del2" OnClientClick="return confirm('确实删除此管理员?');" CommandArgument='<%# Eval("AdminId")%>'><i class="zi zi_trashalt" zico="垃圾箱竖条"></i></asp:LinkButton>
                    <a href="RegionManage.aspx?guid=<%#Eval("AdminId") %>_<%#Eval("AdminName") %>"><i class="zi zi_key" title="权限"></i><%=Resources.L.区域订单权限 %></a>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="sysBtline">
    <asp:Button ID="Lock_B" runat="server" CssClass="btn btn-outline-info" Text="<%$Resources:L,批量锁定 %>" OnClick="Lock_B_Click" />
    <asp:Button ID="UnLock_B" runat="server" CssClass="btn btn-outline-info" Text="<%$Resources:L,批量解锁 %>" OnClick="UnLock_B_Click" />
    <asp:Button ID="Auit_B" runat="server" CssClass="btn btn-outline-info" Text="<%$Resources:L,审核通过 %>" OnClientClick="return CheckEmail()" OnClick="Auit_B_Click"  />
    <asp:Button ID="Button2" class="btn btn-outline-danger" runat="server" Text="<%$Resources:L,批量删除 %>" OnClick="Button2_Click" OnClientClick="return confirm('确定删除？')" />
    <asp:HiddenField ID="IsEmail_Hid" runat="server" />
	</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
	$(function () {
	    $(".nav-tabs [data-tag='<%=IsLock %>']").find("a").addClass('active');
	    $("#Search_T").keypress(function () {
	        if (event.keyCode == 13)
	            $("#Search_Btn_Hid").click();
	    });
	});
	function selectAllByName(obj, name) {
		var allInput = document.getElementsByName(chkSel);
		var loopTime = allInput.length;
		for (i = 0; i < loopTime; i++) {
			if (allInput[i].type == "checkbox") {
				allInput[i].checked = this.checked;
			}
		}
	}
	function CheckEmail() {
	    if ($("input[name=idchk]:checked").length < 1) { alert("未选择管理员"); return false; }
	    if (confirm("是否同时给选中用户发送通知邮件?")) 
	        $("#IsEmail_Hid").val('1');
	    else
	        $("#IsEmail_Hid").val('0');
	    return true;
	}
	function IsSelectedId() {
	    return $("input:checkbox[name=chkSel]:checked").length > 0;
	}
	$("#sel_btn").click(function(e) { 
		if($("#sel_box").css("display")=="none"){  
			$(this).find("a").addClass("active");
	        $("#sel_box").slideDown(300); 
		}
		else{
			$(this).find("a").removeClass("active");
			$("#sel_box").slideUp(200); 
		}
    });
 
</script>
</asp:Content>