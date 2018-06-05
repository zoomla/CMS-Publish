<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoInfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Video.VideoInfo" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>视频信息</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Content/ContentManage.aspx","内容管理"),
	new Bread("","视频列表"),
	new Bread() {url="", text="视频信息",addon="" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg">ID</th>
            <td>
                <asp:Label ID="ID_L" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>视频名称</th>
            <td>
                <asp:TextBox ID="VName_T" CssClass="form-control max20rem" runat="server" autofocus="true"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>视频路径</th>
            <td>
                <asp:TextBox ID="VPath_T" CssClass="form-control max20rem" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>视频大小</th>
            <td>
                <asp:TextBox ID="VSize_T" CssClass="form-control max20rem" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>视频长度</th>
            <td>
                <asp:TextBox ID="VTime_T" CssClass="form-control max20rem" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>缩略图</th>
            <td class="upload_wrap">
                <img src="#" onerror="shownopic(this);" runat="server" id="Thum_Img" />
                <button type="button" onclick="SelFile()" class="btn btn-info">选择缩略图</button>
                <asp:HiddenField ID="Thum_Hid" runat="server" />
            </td>
        </tr>
        <tr>
            <th>上传者</th>
            <td>
                <asp:Label ID="UserName_L" runat="server"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>备注</th>
            <td>
                <asp:TextBox ID="Desc_T" CssClass="form-control max20rem" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-center" colspan="2">
                <asp:Button ID="SaveInfo_B" runat="server" Text="保存" CssClass="btn btn-info" OnClick="SaveInfo_B_Click" />
                <a href="VideoList.aspx" class="btn btn-outline-info">返回</a>
            </td>
        </tr>
    </table>
	</div></div>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var diag = new ZL_Dialog();
        function SelFile() {
            diag.title = "选择在线图片";
            diag.url = "/Common/SelFiles.aspx";
            diag.maxbtn = false;
            diag.ShowModal();
        }
        function PageCallBack(action, url, pval) {
            $("#Thum_Img").attr('src', url.split('|')[0]);
            $("#Thum_Hid").val(url.split('|')[0]);
            diag.CloseModal();
        }
    </script>
</asp:Content>

