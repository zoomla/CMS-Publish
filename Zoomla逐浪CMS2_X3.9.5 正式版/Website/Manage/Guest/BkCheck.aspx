<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BkCheck.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.BkCheck" ValidateRequest="false" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>词条管理</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <ol class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li class="breadcrumb-item"><a href='<%=customPath2 %>Content/ContentManage.aspx'>内容管理</a></li>
        <li class="breadcrumb-item"><a href='WdCheck.aspx'>百科问答</a></li>
        <li class="breadcrumb-item"><a href='<%=Request.RawUrl %>'>百科词条管理</a></li>
        <div id="help" class="pull-right text-center mr-2" ><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server" class="padding5">
			<div class="input-group mb-3">
			  <asp:TextBox runat="server" ID="Key_T" class="form-control max20rem" placeholder="请输入词条名" />
			  <span class="input-group-append">
					<asp:Button ID="Search_B" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="Search_B_Click" />
				</span>
			</div>
        </div>
    </ol>
</div>
<div class="clearfix"></div>
    <div class="borders">
        <ul class="nav nav-tabs list_choice">
            <li class="nav-item"><a class="nav-link active" href="#tab-10" onclick="ShowTabss(-100)" data-toggle="tab">所有词条</a></li>
            <li class="nav-item"><a class="nav-link" href="#tab0" data-toggle="tab" onclick="ShowTabss(0)"><%=lang.LF("待审核")%></a></li>
            <li class="nav-item"><a class="nav-link" href="#tab1" data-toggle="tab" onclick="ShowTabss(1)"><%=lang.LF("已审核")%></a></li>
        </ul>
    </div>
    <div class="panel panel-default">
        <div class="panel panel-body table-responsive-md">
            <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Lnk_Click" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="w1rem">
                        <ItemTemplate>
                            <input type="checkbox" name="idchk" title="" value='<%#Eval("ID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-CssClass="max20rem" />
                    <asp:TemplateField HeaderText="词条">
                        <ItemTemplate>
                            <%#Eval("Tittle")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="版本" DataField="VerStr" HeaderStyle-CssClass=""/>
                    <asp:TemplateField HeaderText="创建人" HeaderStyle-CssClass="max20rem">
                        <ItemTemplate>
                            <%#Eval("UserName")%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="创建时间" HeaderStyle-CssClass="max20rem">
                        <ItemTemplate>
                            <%#Eval("AddTime","{0:yyyy年MM月dd日}")%>
                        </ItemTemplate>
                    </asp:TemplateField>
          <%--          <asp:TemplateField HeaderText="分类" HeaderStyle-CssClass="max20rem">
                        <ItemTemplate>
                            <%#Eval("GradeName") %>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="推荐" HeaderStyle-CssClass="max20rem">
                        <ItemStyle HorizontalAlign="Center" />
                        <ItemTemplate>
                            <%#getElite(Eval("Elite").ToString())%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="状态" HeaderStyle-CssClass="max20rem">
                        <ItemTemplate>
                            <%#getcommend()%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="/Baike/Details?id=<%#Eval("ID") %>" target="_blank" ><i class="zi zi_eye" title="预览"></i></a>
                            <a href="/Baike/BKEditor?id=<%#Eval("ID") %>&mode=admin" target="_blank" ><i class="zi zi_pencil" title="修改"></i></a>
                            <asp:LinkButton ID="LinkButton2" runat="server" OnClientClick="return confirm('确实要删除吗？');" CommandArgument='<%#Eval("ID") %>' CommandName="Del" CausesValidation="false" ><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                            <%--<a href="baikeMerger?tittle=<%#Eval("Tittle").ToString()%><i class="zi zi_columns" title="合并"></i>合并词条</a>--%>
<%--                            <a href="InfoList?id=<%#Eval("ID").ToString()%><i class="zi zi_listalt" title="列表"></i>信息列表</a>--%>
                              <a href="javascript:;" onclick="ShowBKList('<%#Eval("Flow") %>');"><i class="zi zi_list"></i>版本管理</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </ZL:ExGridView>
        </div>
        <div class="sysBtline">
            <asp:Button ID="Button1" runat="server" Text="批量删除" OnClick="BtnSubmit1_Click" UseSubmitBehavior="False" OnClientClick="if(!confirm('确定要批量删除词条吗？')){return false;}" CssClass="btn btn-outline-danger mb-1" />
            <asp:Button ID="Button2" runat="server" Text="批量审核" OnClick="BtnSubmit2_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-info mb-1" />
            <asp:Button ID="Button3" runat="server" Text="取消审核" OnClick="BtnSubmit3_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-danger mb-1" />
            <asp:Button ID="Button4" runat="server" Text="推荐" OnClick="BtnSubmit4_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-info mb-1" />
            <asp:Button ID="Button5" runat="server" Text="取消推荐" OnClick="BtnSubmit5_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-danger mb-1" />
            <asp:Button ID="Button8" runat="server" Text="特色" OnClick="BtnSubmit8_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-info mb-1" />
            <asp:Button ID="Button9" runat="server" Text="取消特色" OnClick="BtnSubmit9_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-danger mb-1" />
            <asp:Button ID="Button6" runat="server" Text="每日图片" OnClick="BtnSubmit6_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-info mb-1" />
            <asp:Button ID="Button7" runat="server" Text="取消每日图片" OnClick="BtnSubmit7_Click" UseSubmitBehavior="False" CssClass="btn btn-outline-danger mb-1" />
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        function ShowTabss(ID) {
            location.href = 'BkCheck.aspx?NodeID=<%=Request.QueryString["NodeID"] %>&id=' + ID + '&type=' + ID;
        }
        $(function () {
            if (getParam("type")) {
                $("li a[href='#tab" + getParam("type") + "']").parent().find("a").addClass("active").parent().siblings("li").find("a").removeClass("active");
            }
        })
        function displayToolbar() {
            $("#toolbar1").toggle("fast");
        }
        function ShowBKList(flow) {
            ShowComDiag("BKList.aspx?Flow=" + flow, "版本浏览");
        }
    </script>
</asp:Content>
