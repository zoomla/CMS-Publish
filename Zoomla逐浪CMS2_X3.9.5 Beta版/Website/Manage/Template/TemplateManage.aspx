<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.TemplateManage"  MasterPageFile="~/Manage/I/Default.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title><%=Resources.L.模板管理 %></title>
<style>.diag_width {width:400px;}</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
    <table class="table table-bordered">
        <tr>
            <td align="left"><asp:Label ID="lblDir" runat="server" ></asp:Label></td>
            <td align="right">
                <asp:Literal ID="LitParentDirLink" runat="server"></asp:Literal>
            </td>
        </tr>
    </table>
    <table class="table table-striped table-bordered">
        <tr>
            <td class="td_m">操作</td>
            <td>名称</td>
            <td class="td_m"><%=Resources.L.大小 %></td>
            <td class="td_m"><%=Resources.L.类型 %></td>
            <td class="td_l"><%=Resources.L.修改时间 %></td>
        </tr>
        <asp:Repeater ID="repFile" runat="server" OnItemCommand="repFileReName_ItemCommand">
            <ItemTemplate>
                <tr>
                    <td class="text-center">
                        <div class="option_area dropdown">
                            <a class="option_style" href="javascript:;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bars"></i><%=Resources.L.操作 %><span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><asp:LinkButton CssClass="option_style" runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%#Eval("type","") == "1" ? "":"DownFiles" %>' Enabled='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false:true %>' Visible='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false : true %>'><i class="fa  fa-download"></i><%=Resources.L.下载 %></asp:LinkButton></li>
                                <li><asp:LinkButton CssClass="option_style" runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%#Eval("type") == "1" ? "DelDir":"DelFiles" %>' OnClientClick="return confirm('你确认要删除该文件夹或文件吗？')"><i class="fa fa-trash-o"></i><%=Resources.L.删除 %></asp:LinkButton></li>
                                <li><asp:LinkButton CssClass="option_style" runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%#Eval("type") == "1" ? "CopyDir":"CopyFiles" %>' Enabled='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false:true %>'><i class="fa fa-copy"></i><%=Resources.L.复制 %></asp:LinkButton></li>
                            </ul>
                        </div>
                    </td>
                    <td class="text-left">
                        <i style='color: #4586BD;' class='<%# Eval("type","") == "1" ? "fa fa-folder" :"fa fa-file-text" %>'></i>
                        <a href="javascript:;" onclick="EditFile('<%#Eval("Name") %>','<%#Eval("Type") %>');"><%# Eval("Name") %></a>
                    </td>
                    <td><%# Eval("type") == "1" ? "" : GetSize(Eval("size",""))%></td>
                    <td><%# Eval("type","") == "1" ? Resources.L.文件夹 : Eval("content_type","") %></td>
                    <td><%#Eval("lastWriteTime")%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <div class="clearfix"></div>
    <a href="javascript:;" class="btn btn-info" onclick="ShowDirDiag()"><%=Resources.L.创建目录 %></a>
  <%--  <a href="javascript:;" class="btn btn-info" onclick="SelTempFile()"><%=Resources.L.上传模板 %></a>--%>
    <asp:Button ID="BackGrup" class="btn btn-info" runat="server" Text="<%$Resources:L,备份当前方案 %>" OnClick="BackGrup_Click" OnClientClick="if(!this.disabled) return confirm('是否创建备份？(提示：备份同名文件会覆盖！)');" />
<div id="create_dir" style="display:none;">  
  <asp:TextBox ID="txtForderName" class="form-control text_md" runat="server"></asp:TextBox>
  <asp:Button ID="btnCreateFolder" class="btn btn-primary" runat="server" Text="<%$Resources:L,创建 %>" OnClick="btnCreateFolder_Click" />
</div>
<div style="height:20px;"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
	var diag = new ZL_Dialog();
	function ShowDirDiag() {
	    diag.title = "<%=Resources.L.创建目录 %>";
	    diag.width = "diag_width";
	    diag.content = "create_dir";
	    diag.ShowModal();
	}
    function EditFile(fname, ftype) {
        var dir = "<%:HttpUtility.UrlEncode(string.IsNullOrEmpty(CurDir)?"":CurDir.TrimEnd('/')+"/")%>";
        //文件夹
        if (ftype == "1") {
            var url = "TemplateManage.aspx?setTemplate=<%:HttpUtility.UrlEncode(TemplateDir)%>&dir=" + dir + encodeURI(fname);
            location = url;
        }
        else
        {
            if (fname.indexOf(".") < 0) { return; }
            var exname = GetExName(fname).toLowerCase();
            switch (exname)
            {
                case "txt":
                case "html":
                case "shtml":
                case "htm":
                    var url = "TemplateEdit.aspx?setTemplate=<%:HttpUtility.UrlEncode(TemplateDir)%>&filepath=" + dir + encodeURI(fname);
                    location = url;
                    break;
                case "jpg":
                case "png":
                    break;
                case "gif":
                    break;
            }
        }
    }
</script>
</asp:Content>
