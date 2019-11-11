<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CssManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.CssManage"  MasterPageFile="~/Manage/I/Index.master" ValidateRequest="false"%>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<%@ Register Src="~/Manage/I/ASCX/FileBrower.ascx" TagPrefix="ZL" TagName="FileBrower" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.风格管理 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx",Resources.L.工作台),
        new Bread("TemplateSet.aspx",Resources.L.模板风格),				
        new Bread("CssManage.aspx",Resources.L.风格管理),				
        new Bread() {url=Request.RawUrl.ToString(), text="<a class='text-danger' href='CssEdit.aspx'>["+Resources.L.新建风格 +"]</a>",addon="" }},
		Call.GetHelp(22)
		)
    %>
    <div class="list_choice">
        <ZL:FileBrower runat="server" ID="FileBrower"  />
    </div>
    <div runat="server" id="op_div" visible="false">
        <div class="option_area dropdown {ext} {ftype} text-center">
            <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" >操作<span class="caret"></span></a>
            <ul class="dropdown-menu" role="menu">
                <li class="dropdown-item folder_hidden"><a href="javascript:;" onclick="fb.down('{vpath}');"><i class="zi zi_download" title="下载"></i>下载</a></li>
                <li class="dropdown-item folder_hidden"><a href="javascript:;" onclick="fb.copy('{vpath}');"><i class="zi zi_copy" title="复制"></i>复制</a></li>
                <li class="dropdown-item"><a href="javascript:;" onclick="fb.del('{vpath}');"><i class="zi zi_trashalt" title="删除"></i>删除</a></li>
            </ul>
        </div>
    </div>
    <div class="input-group" style="margin-top:5px;margin-left:50px;">
        <asp:Button ID="btnCSSBackup" class="btn btn-outline-info" runat="server" Text="<%$Resources:L,备份当前风格 %>" OnClientClick="return confirm('是否创建备份?');" OnClick="btnCSSBackup_Click" />
        <span class="input-group-append"><span class="input-group-text"><%=Resources.L.目录名称 %></span></span>
        <asp:TextBox ID="txtForderName" class="form-control max20rem" runat="server" placeholder="<%$Resources:L,请输入目录名称 %>"></asp:TextBox>
        <span class="input-group-append"><asp:Button ID="btnCreateFolder" class="btn btn-outline-info" runat="server" Text="<%$Resources:L,创建目录 %>" OnClick="btnCreateFolder_Click" OnClientClick="return CreateFolderCheck();" /></span>
      <%--  <ZL:SFileUp ID="SFile_Up" runat="server" IsRelName="true" FType="All" />
        <span class="input-group-append"><asp:Button ID="btnTemplateUpLoad" class="btn btn-outline-info" runat="server" Text="上传风格" OnClientClick="return confirm('即将覆盖同名风格，是否继续？');" OnClick="btnTemplateUpLoad_Click" /></span>--%>
    </div>
    <div style="display:none;">
        <asp:HiddenField runat="server" ID="Down_Hid" />
        <asp:Button runat="server" ID="Down_Btn" OnClick="Down_Btn_Click" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Modal/APIResult.js"></script>
<script>
function CreateFolderCheck() {
    var folder = $("#txtForderName").val();
    if (ZL_Regex.isEmpty(folder)) { alert("目录名称不能为空"); return false; }
    return true;
}
var fb = {
    apiUrl:"<%=customPath2+"Template/CSSManage.aspx?action="%>",
    choose: function (vpath) { location = "CssEdit.aspx?filepath=" + encodeURI(vpath); },
    del: function (vpath) {
        var ref = this;
        $.post(ref.apiUrl + "del", { "vpath": vpath }, function (data) {
            if (!confirm("确定要删除吗")) { return false; }
            var model = APIResult.getModel(data);
            if (APIResult.isok(model)) { location = location; }
            else { alert("删除失败:" + model.retmsg); }
        });
    },
    down: function (vpath) {
        var ref = this;
        $("#Down_Hid").val(vpath);
        $("#Down_Btn").click();
    },
    copy: function (vpath) {
        var ref = this;
        $.post(ref.apiUrl + "copy", { "vpath": vpath }, function (data) {
            var model = APIResult.getModel(data);
            if (APIResult.isok(model)) { location = location; }
            else { alert("复制失败:" + model.retmsg); }
        });
    }
};
</script>
</asp:Content>
