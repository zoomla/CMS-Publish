<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADZoneManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.ADZoneManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>广告版位管理</title> </asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li class="breadcrumb-item"><a href="ADZoneManage.aspx">扩展功能</a></li>
        <li class="breadcrumb-item"><a href="ADZoneManage.aspx">广告管理</a></li>
        <li class="breadcrumb-item"><a href="ADManage.aspx">版位管理</a> <a href="ADZone.aspx"> [添加版位]</a></li>
        <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
        <div id="sel_box">
            <div class="input-group">
                <asp:TextBox runat="server"  id="skey" class="form-control mvcparam max20rem" placeholder="请输入广告名称或广告ID" onkeypress="selbox.search();" />
                <span class="input-group-append">
                    <asp:LinkButton runat="server" class="btn btn-outline-secondary" ID="Search_Btn" OnClick="BntSearch_Click"><i class="zi zi_search"></i></asp:LinkButton>
                </span>
            </div>
        </div>
    </ol>

    <ul class="nav nav-tabs list_choice">
        <li class="nav-item"><a class="nav-link" href="#tab" onclick="ShowTab('-1');" data-toggle="tab">所有版位</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab7" onclick="ShowTab('7');" data-toggle="tab">静默样式</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab0" onclick="ShowTab('0');" data-toggle="tab">矩形横幅</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab1" onclick="ShowTab('1');" data-toggle="tab">弹出窗口</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab2" onclick="ShowTab('2');" data-toggle="tab">随屏移动</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab3" onclick="ShowTab('3');" data-toggle="tab">固定位置</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab4" onclick="ShowTab('4');" data-toggle="tab">漂浮移动</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab5" onclick="ShowTab('5');" data-toggle="tab">文字代码</a></li>
        <li class="nav-item"><a class="nav-link" href="#tab6" onclick="ShowTab('6');" data-toggle="tab">对联广告</a></li>
    </ul>
	<div class="table-responsive-md">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ZoneID" PageSize="20" 
        OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True"
         CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无版位信息！！">
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("ZoneID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="zoneid" HeaderStyle-CssClass="" />
            <asp:TemplateField HeaderText="版位名称">
                <ItemTemplate>
                    <a href='<%# Eval("ZoneId", "ADManage.aspx?ZoneId={0}") %>' title='<%# Eval("ZoneName")%>'><%# Eval("ZoneName")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="类型" HeaderStyle-CssClass="">
                <ItemTemplate>
                    <a href="ADZoneManage.aspx?type=<%#Eval("ZoneType") %>">
                        <%#getzonetypename(DataBinder.Eval(Container.DataItem, "ZoneType").ToString())%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="显示类型" HeaderStyle-CssClass="">
                <ItemTemplate>
                    <%#getzoneshowtypename(DataBinder.Eval(Container.DataItem, "ShowType").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="尺寸" HeaderStyle-CssClass="">
                <ItemTemplate>
                    <%#Eval("ZoneWidth")%>
                    x
                    <%#Eval("ZoneHeight")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" HeaderStyle-CssClass="">
                <ItemTemplate>
                    <%#GetActive(DataBinder.Eval(Container.DataItem, "Active").ToString())%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
                <ItemTemplate>
                    <a href="Advertisement.aspx?ZoneId=<%# Eval("ZoneID") %>" ><i class="zi zi_plus" title="添加"></i> 发布</a>
                    <a href="ADZone.aspx?ZoneId=<%# Eval("ZoneID") %>"><i class="zi zi_pencilalt" title="修改"></i> 编辑</a>

                    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Copy" CommandArgument='<%# Eval("ZoneID") %>'><i class="zi zi_copy" title="复制"></i> 复制</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton5" runat="server" CommandName="Clear" OnClientClick="return confirm('确定清空此版位？');" CommandArgument='<%# Eval("ZoneID") %>'><i class="zi z01-icon217" title="清空"></i> 清空</asp:LinkButton>
                    <asp:LinkButton ID="LinkButton6" runat="server" CommandName="SetAct" CommandArgument='<%# Eval("ZoneID") %>'><i class="zi zi_pause" aria-hidden="true"></i> <%# GetUnActive(DataBinder.Eval(Container.DataItem, "Active").ToString())%></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Del" OnClientClick="return confirm('确定删除此版位？');" CommandArgument='<%# Eval("ZoneID") %>'><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
					</ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="版位" ItemStyle-CssClass="">
                <ItemTemplate>
                    <a href="PreviewAD.aspx?ZoneID=<%# Eval("ZoneID") %>&Type=Zone">预览</a>
                    <asp:LinkButton runat="server" CommandName="Refresh" CommandArgument='<%# Eval("ZoneID") %>'>刷新</asp:LinkButton>
                    <a href="ShowJSCode.aspx?ZoneID=<%# Eval("ZoneID") %>">获取广告代码</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
    <asp:Button ID="BtnDelete" runat="server" Text="批量删除" OnClientClick="if(!IsSelectedId()){alert('请选择版位');return false;}else{return confirm('确定删除选中版位？')}" OnClick="BtnDelete_Click" class="btn btn-outline-danger" />
    <asp:Button ID="BtnActive" runat="server" Text="激活版位" OnClientClick="if(!IsSelectedId()){alert('请选择版位');return false;}else{return confirm('你确定要激活选中的版位吗？')}" OnClick="BtnActive_Click" class="btn btn-outline-info" />
    <asp:Button ID="BtnPause" runat="server" Text="暂停版位" OnClientClick="if(!IsSelectedId()){alert('请选择版位');return false;}else{return confirm('你确定要暂停选中版位吗？')}" OnClick="BtnPause_Click" class="btn btn-outline-danger" />
    <asp:Button ID="BtnRefurbish" runat="server" Text="刷新版位" OnClick="BtnRefurbish_Click" class="btn btn-outline-info" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript">
    $().ready(function () {
        if (getParam("type")) {
            $("li a[href='#tab" + getParam("type") + "']").parent().find("a").addClass("active").siblings("li").find("a").removeClass("active");
        }else{
			$(".nav.nav-tabs li").eq("0").find("a").addClass("active");
		}
    })
    function IsSelectedId() {
        var checkArr = $("input[type=checkbox][name=idchk]:checked");
        if (checkArr.length > 0)
            return true
        else
            return false;
    }
    function ShowTab(n)
    {
        if (n == "-1")
            location.href = "ADZoneManage.aspx";
        else
            location.href = "ADZoneManage.aspx?type=" + n;
    }
</script>
</asp:Content>
