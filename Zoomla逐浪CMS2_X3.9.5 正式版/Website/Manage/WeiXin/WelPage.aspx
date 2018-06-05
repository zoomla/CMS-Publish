<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelPage.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.WelPage"  MasterPageFile="~/Manage/I/Index.master" ValidateRequest="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>欢迎语</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("WxAppManage.aspx","公众号管理"),		
        new Bread() {url="", text="欢迎语 [公众号:fwe]",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-bordered table-striped sys_table">
        <tr><th class="w12rem_lg">标题</th><td><asp:TextBox runat="server" ID="Title_T" CssClass="form-control m50rem_50" />
            <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="Title_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="标题不能为空!" />
                       </td></tr>
        <tr><th>内容</th><td>
            <asp:TextBox runat="server" TextMode="MultiLine" ID="Content_T" CssClass="form-control m50rem_50" style="height:120px;" placeholder="请输入内容" />
            <asp:RequiredFieldValidator ID="p2" runat="server" ControlToValidate="Content_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="内容不能为空!" />
                       </td></tr>
        <tr>
            <th>图片</th>
            <td>
				<div class="input-group ">
			  <asp:TextBox runat="server" ID="PicUrl_T" CssClass="form-control m50rem_50" placeholder="http://demo.z01.com/pic.jpg" />
			  <div id="port_btns" class="input-group-append">
				  <input type="button" class="btn btn-info" value="上传图片" onclick="pic.sel('PicUrl_T');" />
                <input type="file" id="pic_up" class="hidden d-none" onchange="pic.upload();" />
			  </div>
			</div>
				
				<small class="text-muted">图片链接,支持JPG、PNG格式，较好的效果为大图360*200，小图</small>
				<small class="text-muted">如未上传图片,则以文本格式返回信息(文本格式可支持超链接)</small>
            </td>
        </tr>
        <tr><th>链接</th><td><asp:TextBox runat="server" ID="Url_T" CssClass="form-control m50rem_50"  placeholder="请输入链接"/>
			<small class="text-muted">点击图文消息跳转链接</small>
			</td></tr>
        <tr><td></td><td><asp:Button runat="server" ID="Save_Btn"  CssClass="btn btn-outline-info" Text="确定" OnClick="Save_Btn_Click"/></td></tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Webup.js"></script>
    <script>
        var pic = { id: "pic_up", txtid: null };
        pic.sel = function (id) { $("#" + pic.id).val(""); $("#" + pic.id).click(); pic.txtid = id; }
        pic.upload = function () {
            var fname = $("#" + pic.id).val();
            if (!SFileUP.isWebImg(fname)) { alert("请选择图片文件"); return false; }
            SFileUP.AjaxUpFile(pic.id, function (data) {
                var url = "<%:ZoomLa.Components.SiteConfig.SiteInfo.SiteUrl%>";
                $("#" + pic.txtid).val(url + data);
            });
        }
    </script>
</asp:Content>