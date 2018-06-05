<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CssManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.CssManage"  MasterPageFile="~/Manage/I/Index.master" ValidateRequest="false"%>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.风格管理 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("TemplateSet.aspx","模板风格"),				
        new Bread("CssManage.aspx","风格管理"),				
        new Bread() {url=Request.RawUrl.ToString(), text="<a class='text-danger' href='CssEdit.aspx'>[新建风格]</a>",addon="" }},
		Call.GetHelp(22)
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-bordered">
        <tr>
            <td>
                <asp:Label ID="lblDir" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    <div class="panel panel-default w-100">
            <table class="table table-striped table-bordered table-hover" style="border-top: none;">
                <tr class="gridtitle" align="center">
                    <td ><%=Resources.L.操作 %></td>
                    <td><%=Resources.L.名称 %></td>
                    <td><%=Resources.L.大小 %></td>
                    <td><%=Resources.L.类型 %></td>
                    <td><%=Resources.L.修改时间 %></td>
                </tr>
                <asp:Repeater ID="repFile" runat="server" OnItemCommand="repFileReName_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td align="center">
                                <div class="option_area dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="zi zi_bars"></i><%=Resources.L.操作 %><span class="caret"></span></a>
                                    <ul class="dropdown-menu" role="menu">
                                        <li class="dropdown-item">
                                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Name").ToString()%>'
                                                CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "":"DownFiles" %>'
                                                Enabled='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false:true %>' Visible='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false : true %>' ><i class="zi zi_download" title="<%=Resources.L.下载 %>"></i><%=Resources.L.下载 %></asp:LinkButton>
                                        <li class="dropdown-item">
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "CopyDir":"CopyFiles" %>'
                                                CommandArgument='<%# Eval("Name").ToString()%>' ><i class="zi zi_copy" title="<%=Resources.L.复制 %>"></i><%=Resources.L.复制 %></asp:LinkButton>
                                        <li class="dropdown-item">
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Name").ToString()%>'
                                                CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>'
                                                OnClientClick="return confirm('你确认要删除该文件夹或文件吗？')" ><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i><%=Resources.L.删除 %></asp:LinkButton>
                                    </ul>
                                </div>
                            </td>
                            <td align="left">
                                <i style='color:#4586BD;' class='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "zi zi_folders" :"zi zi_filealt" %>'></i>
                                <%# System.Convert.ToInt32(Eval("type")) != 1&&(Eval("content_type").ToString()=="jpg"||Eval("content_type").ToString()=="gif"||Eval("content_type").ToString()=="jpge"||Eval("content_type").ToString()=="png")?"<span onmouseover=\"ShowADPreview('" + GetFileContent(Eval("Name").ToString(), Eval("content_type").ToString()) + "')\" onmouseout=\"hideTooltip('dHTMLADPreview')\">":"<span>"%>
                                <a href="<%#isvideo(Eval("content_type").ToString())?""+TemplateDir+"/"+Eval("Name")+"\" rel=\"vidbox":(isimg(Eval("content_type").ToString())?"javascript:void(0);": (System.Convert.ToInt32(Eval("type")) == 1 ?  "CssManage.aspx?Dir=" + Server.UrlEncode(Request.QueryString["Dir"] +"/"+ Eval("Name").ToString()):"CssEdit.aspx?filepath="+ Server.UrlEncode(Request.QueryString["Dir"] +"/"+ Eval("Name").ToString()))) %>">
                                    <%# Eval("Name") %></a></span>
                            </td>
                            <td align="center">
                                <%# GetSize(Eval("size").ToString()) %>
                            </td>
                            <td align="center">
                                <asp:HiddenField ID="HdnFileType" Value='<%#Eval("type") %>' runat="server" />
                                <%# System.Convert.ToInt32(Eval("type")) == 1 ? Resources.L.文件夹 : Eval("content_type").ToString() + Resources.L.文件 %>
                            </td>
                            <td align="center">
                                <%#Eval("lastWriteTime")%>
                            </td>

                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        <div class="panel panel-footer ml-2">
            <div class="d-flex flex-wrap">
                <asp:Button ID="btnCSSBackup" class="btn btn-outline-info" runat="server" Text="<%$Resources:L,备份当前风格 %>" OnClientClick="return confirm('是否创建备份？(提示：备份同名文件会覆盖！）');" OnClick="btnCSSBackup_Click" />
                目录名称：
                <asp:TextBox ID="txtForderName" class="form-control max20rem" runat="server"></asp:TextBox>
                <asp:Button ID="btnCreateFolder" class="btn btn-outline-info" runat="server" Text="创建目录" OnClick="btnCreateFolder_Click" OnClientClick="return CreateFolderCheck();" />
                <ZL:SFileUp ID="SFile_Up" runat="server" IsRelName="true" FType="All" />
                <asp:Button ID="btnTemplateUpLoad" class="btn btn-outline-info" runat="server" Text="<%$Resources:L,上传风格 %>" OnClientClick="return confirm('即将覆盖同名风格，是否继续？');" OnClick="btnTemplateUpLoad_Click" />
            </div>
        </div>
    </div>
    <div id="dHTMLADPreview" style="z-index: 1000; left: 0px; visibility: hidden; width: 10px; position: absolute; top: 0px; height: 10px"></div>
    <div class="clearbox"></div>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Popup.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
function CreateFolderCheck() {
    var folder = $("#txtForderName").val();
    if (ZL_Regex.isEmpty(folder)) { alert("目录名称不能为空"); return false; }
    return true;
}
</script>
</asp:Content>
