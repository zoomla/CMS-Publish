<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileBrower.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.FileBrower" EnableViewState="false" %>
<style type="text/css">
.fb_div{padding-top:0px;position:relative;background-color:#fff;}
#bread_div {padding-left:10px;line-height:30px;border:1px solid #ddd;border-radius:5px;margin-top:15px;margin-bottom:5px;}
#bread_div a{color:#06c;}
#bread_div .spanr {padding:0 4px;color:#aaa;font-size:18px;position:relative;top:2px;}
.colhead {padding:8px;background-color:#f7f7f7;color:#888;border:1px solid #d2d2d2;border-radius:2px;}
.coltr {padding:8px;border-bottom:1px solid #ddd;display:flex;}
.col10 {display:inline-block;width:10%;}
.col20 {display:inline-block;width:20%;}
.col50 {display:inline-block;width:50%;}

.folder .folder_hidden{display:none;}
.file .file_hidden{display:none;}
</style>
<div class="fb_div">
<div id="bread_div"><%=ShowBread() %></div>
<div class="colhead"><span class="col10"></span><span class="col50">文件名</span><span class="col20">大小</span><span class="col20">修改日期</span></div>
<div class="mainlist">
    <asp:Repeater runat="server" ID="RPT" EnableViewState="false">
        <ItemTemplate>
            <div class="coltr">
                <span class="col10"><%#ShowItemOP() %></span>
                <span class="col50"><%#ShowLink()%></span>
                <span class="col20"><%#Eval("ExSize") %></span>
                <span class="col20"><%#Eval("LastWriteTime","{0:yyyy年MM月dd日 HH:mm}") %></span>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
</div>
<script>
    var fileBrower = {

    };
</script>