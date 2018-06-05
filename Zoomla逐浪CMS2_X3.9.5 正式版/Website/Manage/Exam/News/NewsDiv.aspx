<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NewsDiv.aspx.cs" Inherits="ZoomLaCMS.Manage.Exam.News.NewsDiv"  MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>版面管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<asp:Label runat="server" ID="Bread_L"></asp:Label>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False"
        CssClass="table table-striped table-bordered table-hover list_choice" EmptyDataText="还没为该报纸设置版面!!"
        OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="版面名">
                <ItemTemplate>
                    <a href="Publish.aspx?Pid=<%#Eval("Pid")+"&ID="+Eval("ID") %>"> <%#Eval("Title") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="图片">
                <ItemTemplate>
                    <img class="mini_img img_3rem" src="<%#Eval("ImgPath") %>" />
                    <img class="mid_img" id="mid_img" src="#" style="display:none;position:absolute;"/> 
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="高清附件">
                <ItemTemplate>
                    <a href="<%#Eval("AttachFile") %>" title="点击下载" target="_blank"><%#System.IO.Path.GetFileName(Eval("AttachFile") as string) %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="/Rss/ViewPublish?Pid=<%#Eval("Pid") %>&ID=<%#Eval("ID") %>" target="_blank" title="前台浏览"><i class="zi zi_globe" title="浏览"></i></a><span class="sperspan"></span>
                    <a href="Publish.aspx?Pid=<%#Eval("Pid") %>&ID=<%#Eval("ID") %>" target="_parent"><i class="zi zi_pencilalt" title="修改"></i></a><span class="sperspan"></span>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Del2" OnClientClick="return confirm('确定要删除该版面?');" ><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $().ready(function () {
            $(".mini_img").mouseover(function () {
                console.log("123");
                $(".mid_img").hide();
                $(this).siblings("#mid_img").attr("src", $(this).attr("src")).show();
            }).mouseout(function () { $(this).siblings("#mid_img").hide(); });
        });
    </script>
</asp:Content>