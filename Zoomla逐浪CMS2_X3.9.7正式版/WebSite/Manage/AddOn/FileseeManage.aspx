<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileseeManage.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.FileseeManage" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>在线文件管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/plus/ADManage.aspx","扩展功能"),
        new Bread("","其他功能"),
        new Bread() {url="FileseeManage.aspx", text="比较所有文件",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg">
            <td  align="left">
                <b>说明：</b>
            </td>
        </tr>
        <tr class="tdbg">
            <td scope="col" class="tdbg">文件比较功能是为了防止木马和一些不法分子使用服务器漏洞上传非法文件的有效手段，可以让您使用此功能扫描该文件是否和官方文件是否相同，如果经过了更改；文件名颜色标识为红色，否者为绿色！并且有中文提示!<br />
                本功能完全采用加密手段方式检查，依靠网络与官方服务器连接，可以完全检查出文件是否被更改！是目前网络最安全、最科学、最可靠的检查工具!
           　　<br />
                <br />
                <asp:Button Text="开始比较文件" runat="server" ID="bj" OnClick="bj_Click" class="btn btn-outline-info" /><br />
                <br />
            </td>
        </tr>
    </table>
	</div></div>
    <div style="overflow-y: auto; overflow-x: hidden; height: 800px">
        <table class="table table-striped table-bordered table-hover">
            <tr class="tdbg">
                <td scope="col" class="title" align="center" >序号
                </td>
                <td scope="col" class="title" align="center" >文件名(相对路径)
                </td>
                <td scope="col" class="title" align="center" >文件大小(KB)
                </td>
                <td scope="col" class="title" align="center" >结果
                </td>
            </tr>
            <div id="seestr" runat="server"></div>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>