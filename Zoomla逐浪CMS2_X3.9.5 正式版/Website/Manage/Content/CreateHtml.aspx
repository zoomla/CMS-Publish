<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateHtml.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.CreateHtml"  MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<title>发布操作</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
        new Bread("ContentManage.aspx","内容管理"),
        new Bread("CreateHtmlContent.aspx","生成发布"),
        new Bread() {url="", text="发布结果",addon= "" }}
        )
    %>
<div class="list_choice">
<div class="text-left">
    <div class="alert alert-info" style="background: rgba(216, 236, 246, 0.5)">
        <p style="font-size: 1.5em;">
            <i class="zi zi_print"></i>
            面向静态发布提升站点效率!
            <a href="CreateHtmlContent.aspx" class="btn btn-info">&lt;返回生成页</a>
        </p>
        <p style="padding-left: 100px;"></p>
        <p style="line-height: 28px; margin-bottom: 10px; border-bottom: 1px dashed #808080;">
            网站首页的后缀需在<a href="<%=CustomerPageAction.customPath2%>Config/SiteInfo.aspx">[系统设置]</a>-<a href="<%=CustomerPageAction.customPath2%>Config/SiteInfo.aspx">[网站配置]</a>-<a href="<%=CustomerPageAction.customPath2%>Config/SiteOption.aspx">[进阶信息]</a>中进行设置,.aspx为不生成静态页<br />
            对应栏目页需在<a style="color: #428bca;" href="<%=CustomerPageAction.customPath2%>Config/SiteInfo.aspx">[系统设置]</a>-<a style="color: #428bca;" href="<%=CustomerPageAction.customPath2%>Content/Node/NodeManage.aspx">[节点管理]</a>对相应节点生成选项进行设置,.aspx为不生成静态页<br />
            发布内容页，需对内容所在节点的生成选项的中，对内容页扩展名进行设置，.aspx为不生成静态页。
        </p>
        <div style="height:550px;overflow-y:auto;" id="infobody">
            <div id="spindiv" class="text-center"><i class="zi zi_spin zi_spinner zi_2x"></i> 检测生成日志...</div>
        </div>
    </div>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
    $(function () {
        var tlp = '<div class="item">@ResultMsg <a href="@Url" target="_blank">@Url</a></div>';
        var inter = setInterval(function () {
            $.post("", {}, function (data) {
                if (data == "") { return; }
                var list = JSON.parse(data);
                var $items = JsonHelper.FillItem(tlp, list, null);
                $("#spindiv").before($items);
                //if (data.indexOf("生成请求处理完成 ") > -1) { $("#spindiv").remove(); clearInterval(inter); }
            })
        }, 1500);
    })
</script>
</asp:Content>