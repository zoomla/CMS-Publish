﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackupManage.aspx.cs" Inherits="ZoomLaCMS.Manage.FtpFile.BackupManage" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Index.master"%>

<asp:Content runat="server" ContentPlaceHolderID="head">
        <title>备份管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/plus/ADManage.aspx","扩展功能"),	
        new Bread("/{manage}/Content/Video/VideoList.aspx","文件管理"),	
        new Bread() {url="BackupManage.aspx", text="备份管理",addon="" }}
		)
    %>
	<div class="list_choice">
        <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>
                当前目录：<asp:Label ID="LblCurrentDir" runat="server"></asp:Label><asp:HiddenField ID="HdnPath"
                    runat="server" />                
            </td>
            <td align="right">
                <%= string.IsNullOrEmpty(m_ParentDir) ? "<a disabled=\"true\">返回上一级</a>" : "<a href=\"BackupManage.aspx?Dir=" + m_ParentDir + "\">返回上一级</a>"%>
            </td>
        </tr>
    </table>
    <asp:Repeater ID="RptFiles" runat="server" OnItemCommand="RptFiles_ItemCommand">
            <HeaderTemplate>
                <table  class="table table-striped table-bordered table-hover">
                    <tr class="title" align="center">
                        <th scope="col">名称</th>
                        <th scope="col">大小</th>
                        <th scope="col">类型</th>
                        <th scope="col">创建时间</th>
                        <th scope="col">最后修改时间</th>
                        <th scope="col">操作</th>
                    </tr>                    
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td align="left">
                        <%# System.Convert.ToInt32(Eval("type")) == 1 ? "<img src=\"/App_Themes/AdminDefaultTheme/Images/Folder/mfolderclosed.gif\">" : GetShowExtension(Eval("content_type").ToString())%>
                        <%# System.Convert.ToInt32(Eval("type")) == 1 ? "<a href=\"BackupManage.aspx?Dir=" + Server.UrlEncode(CurrentDir + "/" + Eval("Name").ToString()) + "\">" + Eval("Name").ToString() + "</a>" : "<span onmouseover=\"ShowADPreview('" + GetFileContent(Eval("Name").ToString(), Eval("content_type").ToString()) + "')\" onmouseout=\"hideTooltip('dHTMLADPreview')\">" + "<a href='javascript:ReturnUrl(\"" + Request.QueryString["Dir"] + "/" + Eval("Name").ToString() + "\")'>" + Eval("Name").ToString() + "</a></span>"%>
                    </td>
                    <td align="center">
                        <%# GetSize(Eval("size").ToString())%>
                    </td>
                    <td align="center">
                        <%# System.Convert.ToInt32(Eval("type")) == 1 ? "文件夹" : Eval("content_type").ToString() + "文件" %>
                    </td>
                    <td align="center">
                        <%# Eval("createTime")%>
                    </td>
                    <td align="center">
                        <%# Eval("lastWriteTime")%>
                    </td>
                    <td align="center">
                        <asp:LinkButton ID="LinkButton1" CommandName='Down'
                                CommandArgument='<%# Eval("Name")%>'  runat="server">[<i class="zi zi_download" title="下载"></i>下载]</asp:LinkButton>
                        <asp:LinkButton ID="LbtnDelList" CommandName='<%# System.Convert.ToInt32(Eval("type")) == 1 ? "DelDir":"DelFiles" %>'
                            CommandArgument='<%# Eval("Name")%>' OnClientClick="if(!this.disabled) return confirm('确定要删除?');"
                             runat="server">[<i class="zi zi_trashalt" title="删除"></i>删除]</asp:LinkButton></td>
                </tr>                
            </ItemTemplate> 
            <FooterTemplate>
                </table></FooterTemplate>           
        </asp:Repeater>        
        <div id="dHTMLADPreview" style="z-index: 1000; left: 0px; visibility: hidden; width: 10px;
            position: absolute; top: 0px; height: 10px">
        </div>
		</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/Popup.js" ></script>
    <script type="text/javascript">
        function ReturnUrl(url) {

            if (url.substring(0, 1) == "/") {
                url = url.substring(1, url.Length);
            }

            var isMSIE = (navigator.appName == "Microsoft Internet Explorer");
            if (isMSIE) {
                window.returnValue = url;
                window.close();
            }
            else {
                var thumbClientId = '<%= Request.QueryString["ThumbClientId"] %>';
                 if (thumbClientId == '') {
                     var obj = opener.document.getElementById('<%= Request.QueryString["ClientId"] %>');
                var newurl = '下载地址' + (obj.length + 1) + '|' + url;
                obj.options[obj.length] = new Option(newurl, newurl);
                ChangeHiddenFieldValue();
            }
            else {
                var obj = opener.document.getElementById(thumbClientId);
                obj.value = url;
            }
            window.close();
        }
    }

    function ChangeHiddenFieldValue() {
        var obj = opener.document.getElementById('<%= Request.QueryString["HiddenFieldId"] %>');
    var softUrls = opener.document.getElementById('<%= Request.QueryString["ClientId"] %>');
    var value = "";
    for (i = 0; i < softUrls.length; i++) {
        if (value != "") {
            value = value + "$$$";
        }
        value = value + softUrls.options[i].value;
    }
    obj.value = value;
}
    </script>
</asp:Content>