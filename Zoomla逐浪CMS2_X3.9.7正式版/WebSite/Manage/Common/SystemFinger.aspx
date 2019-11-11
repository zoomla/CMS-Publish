<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SystemFinger.aspx.cs" Inherits="ZoomLaCMS.Manage.Common.SystemFinger" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>系统指针</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/DatalistProfile.aspx","扩展功能"),
        new Bread("","开发中心"),
        new Bread() {url="SystemFinger.aspx", text="服务器信息总览",addon="" }},
		Call.GetHelp(72)
		)
    %>
	
    <div id="condiv" class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
        <table class="table table-striped table-bordered table-hover sys_table" id="systb">
            <tr>
                <th scope="col" class="w12rem_lg">CMS系统版本</th>
                <td scope="col">
                    <asp:Label ID="lbUser" name="lbUser" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">页面网址</th>
                <td scope="col">
                    <asp:Label ID="lbServerName" name="lbServerName" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">主程序请求地址</th>
                <td scope="col">
                    <asp:Label ID="lbIp" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">数据库请求地址</th>
                <td scope="col">
                    <asp:Label runat="server" ID="DBIP_L"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">站点域名</th>
                <td scope="col">
                    <asp:Label ID="lbDomain" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">请求端口</th>
                <td scope="col">
                    <asp:Label ID="lbPort" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">服务器IIS版本</th>
                <td scope="col">
                    <asp:Label ID="lbIISVer" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">本文件所在文件夹</th>
                <td scope="col">
                    <asp:Label ID="lbPhPath" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">服务器操作系统</th>
                <td scope="col">
                    <asp:Label ID="lbOperat" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">系统所在文件夹</th>
                <td scope="col">
                    <asp:Label ID="lbSystemPath" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">服务器脚本超时时间</th>
                <td scope="col">
                    <asp:Label ID="lbTimeOut" name="lbTimeOut" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">服务器的语言种类</th>
                <td scope="col">
                    <asp:Label ID="lbLan" name="lbLan" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">.NET Framework 版本</th>
                <td scope="col">
                    <asp:Label ID="lbAspnetVer" name="lbAspnetVer" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">服务器当前时间</th>
                <td scope="col">
                    <asp:Label ID="lbCurrentTime" name="lbCurrentTime" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">服务器IE版本</th>
                <td scope="col">
                    <asp:Label ID="lbIEVer" name="lbIEVer" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">本次开机以来系统连续运行的时间</th>
                <td scope="col">
                    <asp:Label ID="lbServerLastStartToNow" name="lbServerLastStartToNow" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">服务器硬盘分区</th>
                <td scope="col">
                    <asp:Label ID="lbLogicDriver" name="lbLogicDriver" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">CPU 总数</th>
                <td scope="col">
                    <asp:Label ID="lbCpuNum" name="lbCpuNum" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">CPU 类型</th>
                <td scope="col">
                    <asp:Label ID="lbCpuType" name="lbCpuType" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">虚拟内存</th>
                <td scope="col">
                    <asp:Label ID="lbMemory" name="lbMemory" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">当前程序占用内存</th>
                <td scope="col">
                    <asp:Label ID="lbMemoryPro" name="lbMemoryPro" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">Asp.net所占内存</th>
                <td scope="col">
                    <asp:Label ID="lbMemoryNet" name="lbMemoryNet" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">Asp.net所占CPU</th>
                <td scope="col">
                    <asp:Label ID="lbCpuNet" name="lbCpuNet" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">当前Session数量</th>
                <td scope="col">
                    <asp:Label ID="lbSessionNum" name="lbSessionNum" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">当前Session的数量与ID</th>
                <td scope="col">
                    <asp:Label ID="lbSession" name="lbSession" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <th scope="col">操作系统版本</th>
                <td scope="col">
                    <asp:Label ID="SystemVersion_L" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td colspan="2">
                    <input type="button" name="GetExc" value="保存信息为Excel" id="GetExc" class="btn btn-info" onclick="OutToExcel();" />
                    <input type="button" id="back" name="back" value="返回" class="btn btn-outline-info" onclick="javascript: history.back();" />
                </td>
            </tr>
        </table>
		</div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Label/ZLHelper.js"></script>
    <script>
        function OutToExcel() {
            var $html = $(document.getElementById("condiv").outerHTML);
            $html.find("td").css("border", "1px solid #666");
            $html.find("tr:last").remove();
            ZLHelper.OutToExcel($html.html(), "服务器信息总览");
        }
    </script>
</asp:Content>
