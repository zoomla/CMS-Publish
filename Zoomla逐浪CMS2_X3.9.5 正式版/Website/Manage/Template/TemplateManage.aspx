<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.TemplateManage"  MasterPageFile="~/Manage/I/Index.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>模板管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("TemplateSet.aspx","模板风格"),				
        new Bread("TemplateManage.aspx","模板列表"),				
        new Bread() {url="TemplateEdit.aspx?filepath="+CurDir, text="<span class='text-danger'>[新建模板]</span>",addon="" }}
		)
    %>
    <div class="container-fluid pr-0">
        <div class="row sysRow list_choice table-responsive-md">
            <table class="table table-bordered">
                <tr><td><asp:Label ID="lblDir" runat="server" /></td></tr>
            </table>
            <table class="table table-striped table-bordered">
                <tr>
                    <th scope="col">操作</th>
                    <th>名称</th>
                    <th scope="col">大小</th>
                    <th scope="col">类型</th>
                    <th scope="col">修改时间</th>
                </tr>
                <asp:Repeater ID="repFile" runat="server" OnItemCommand="repFileReName_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td class="text-center">
                                <div class="option_area dropdown">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=Resources.L.操作 %>
                                        <span class="caret"></span></a>

                                    <ul class="dropdown-menu" role="menu">
                                        <li class="dropdown-item">
                                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%#Eval("type","") == "1" ? "":"DownFiles" %>' Enabled='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false:true %>' Visible='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false : true %>'><i class="zi zi_download" zico="下载"></i> <%=Resources.L.下载 %></asp:LinkButton></li>
                                        <li class="dropdown-item">
                                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%#Eval("type","") == "1" ? "DelDir":"DelFiles" %>' OnClientClick="return confirm('你确认要删除该文件夹或文件吗？')"> <i class="zi zi_trashalt" zico="垃圾箱竖条"></i> 删除</asp:LinkButton></li>
                                        <li class="dropdown-item">
                                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("Name").ToString()%>' CommandName='<%#Eval("type","") == "1" ? "CopyDir":"CopyFiles" %>' Enabled='<%# System.Convert.ToInt32(Eval("type")) == 1 ? false:true %>'> <i class="zi zi_copy" zico="拷贝"></i> 复制</asp:LinkButton></li>
                                    </ul>

                                </div>
                            </td>
                            <td class="text-left">
                                <i class='<%# Eval("type","") == "1" ? "zi zi_folders name_ico_c" :"zi zi_filealt name_ico_c" %>'></i>
                                <a href="javascript:;" onclick="EditFile('<%#Eval("Name") %>','<%#Eval("Type") %>');"><%# Eval("Name") %></a>
                            </td>
                            <td><%# Eval("type","") == "1" ? "" : GetSize(Eval("size",""))%></td>
                            <td><%# Eval("type","") == "1" ? Resources.L.文件夹 : Eval("content_type","") %></td>
                            <td><%#Eval("lastWriteTime")%></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </div>
    <div class="alert alert-light">
    <a href="javascript:;" class="btn btn-outline-info" onclick="ShowDirDiag()"><%=Resources.L.创建目录 %></a>
    <asp:Button ID="BackGrup" class="btn btn-outline-info" runat="server" Text="<%$Resources:L,备份当前方案 %>" OnClick="BackGrup_Click" OnClientClick="if(!this.disabled) return confirm('是否创建备份？(提示：备份同名文件会覆盖！)');" />
<div id="create_dir" style="display:none;">  
  <asp:TextBox ID="txtForderName" class="form-control max20rem" runat="server"></asp:TextBox>
  <asp:Button ID="btnCreateFolder" class="btn btn-primary" runat="server" Text="<%$Resources:L,创建 %>" OnClick="btnCreateFolder_Click" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
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
