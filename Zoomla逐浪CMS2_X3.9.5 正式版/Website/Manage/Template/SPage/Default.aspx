<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.SPage.Default" MasterPageFile="~/Manage/I/Index.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>页面列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","可视设计"),						
        new Bread() {url="", text="页面列表<a href='AddPage.aspx'> [添加页面]</a>",addon="" }}
		)
    %>
	<div class="list_choice row p-1">
    <ZL:ExRepeater runat="server" ID="RPT" PageSize="16"
        PagePre="<div class='clearfix'></div><div id='page_div' class='text-center'>" PageEnd="</div>"
        OnItemCommand="RPT_ItemCommand">
        <ItemTemplate>
			
            <div class="col-md-3 col-sm-6 col-12">
                <div class="SPage_list">
                    <div class="SPage_list_t">
                        <a href="/design/spage/Default.aspx?id=<%#Eval("ID") %>" target="_blank" title="<%#Eval("PageName")%>">
                            <div class="SPage_list_tc">
                                <h3><%#Eval("PageName") %></h3>
                                <p><i class="zi zi_clock" zico="时钟"></i><%#Eval("CDate","{0:yyyy年MM月dd日 HH:mm}") %></p>
                                <p>备注：<%#Eval("PageDESC") %></p>
                            </div>
                        </a>
                    </div>
                    <div class="SPage_list_b">
                        <a href="/design/spage/Default.aspx?id=<%#Eval("ID") %>" target="_blank"><i class="zi zi_paintbrush" zico="笔刷"></i> 设计</a>
                        <a href="<%#string.IsNullOrEmpty(Eval("ViewUrl",""))?"/design/spage/preview.aspx?id="+Eval("ID"):Eval("ViewUrl","") %>" target="_blank"><i class="zi zi_eye"></i> 预览</a>
                        <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="copy" OnClientClick="return confirm('确定要复制吗');"><i class="zi zi_copy"></i> 复制</asp:LinkButton>
                        <a href="AddPage.aspx?id=<%#Eval("ID") %>"><i class="zi zi_edit"></i> 修改</a>
                        <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trash"></i> 删除</asp:LinkButton>
                    </div>
                </div>
            </div>
			
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:ExRepeater>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $().ready(function (e) {
            $(".SPage_list_t a").each(function (index, element) {
                $(this).addClass("bgcolor" + (parseInt(Math.random() * 20 + 1)));
            });
            var $div = $("#page_div").parent();
            $div.attr("style","width:100%;margin-top:5px;");
        });
        function ShowColor(obj) {
            if ($(obj).find(".fa-list-ul").length > 0) {
                $(obj).find(".fa-list-ul").removeClass("fa-list-ul").addClass("fa-th-large");
                $(".SPage_list").addClass("SPage_list1").removeClass("SPage_list").parent().removeClass("col-lg-3").addClass("col-lg-12");
            }
            else if ($(obj).find(".fa-th-large").length > 0) {
                $(obj).find(".fa-th-large").removeClass("fa-th-large").addClass("fa-list-ul");
                $(".SPage_list1").addClass("SPage_list").removeClass("SPage_list1").parent().removeClass("col-lg-12").addClass("col-lg-3");
            }
        }
    </script>
</asp:Content>
