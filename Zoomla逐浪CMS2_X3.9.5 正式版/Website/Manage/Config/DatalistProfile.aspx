<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DatalistProfile.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DatalistProfile" MasterPageFile="~/Manage/I/Safe.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>系统全库概况</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb fixed-top w-100">
        <li class="breadcrumb-item"><a href="<%=CustomerPageAction.customPath2 %>Main.aspx">工作台</a></li>
        <li class="breadcrumb-item"><a href="DatalistProfile.aspx">扩展功能</a></li>
        <li class="breadcrumb-item">开发中心</li>
        <li class="breadcrumb-item"><a href='DatalistProfile.aspx'>系统全库概况</a>
            <asp:LinkButton ID="Link2" OnClientClick='return confirm("本操作将从云台获取默认数据库标注信息且会覆盖您的个性定义，是否确定？")' Visible="false" OnClick="Link2_Click1" runat="server" Style="color: #1e860b;">[更新ZL_DataList表]</asp:LinkButton>
            <%--[<asp:LinkButton ID="LinkButton5" OnClick="Link2_Click" runat="server">运行库概况</asp:LinkButton>]--%>
            <%--[<span class="line"><a href="ViewList.aspx" class="text-danger">视图概况</a></span>]--%>
        </li>
		<div class="pull-right">
            <div id="help"><a href="javascript:;" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a><a onclick="help_show('68')" title="帮助" class="help_btn"><i class="zi zi_questioncircle"></i></a></div>
            <div id="sel_box">
                <div class="input-group">
                    <asp:TextBox runat="server" ID="Search_T" class="form-control" placeholder="请输入表名/说明" />
                    <span class="input-group-append">
                        <asp:LinkButton runat="server" CssClass="btn btn-outline-secondary" ID="Search_Btn" OnClick="Search_Btn_Click">搜索</asp:LinkButton>
                        <asp:Button runat="server" ID="Search_Btn_Hid" OnClick="Search_Btn_Click" Style="display: none;" />
                    </span>
                </div>
            </div>
		</div>
    </ol>
    <div id="Empty_Div" runat="server" visible="false" class="alert alert-info" style="margin-top:55px;">
        当前数据库中没有数据库标注信息，可从云台获取脚本初始化数据库标注数据，点击
        <asp:LinkButton ID="DownData_B" runat="server"  OnClick="DownData_B_Click"><i class="zi zi_download"></i>下载</asp:LinkButton>
    </div>
	<div class="table-responsive-md list_choice">
   <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False"
            CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
            OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
            <Columns>
                <asp:BoundField HeaderText="序号" DataField="ID">
                    <ItemStyle CssClass="" HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="数据表名">
                    <ItemTemplate>
                        <%# Eval("TableName")%>
                    </ItemTemplate>
                    <ItemStyle  HorizontalAlign="left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类型">
                    <HeaderStyle  />
                    <ItemTemplate>
                        <a href="DatalistProfile.aspx?type=<%#Eval("Type")%>"><%#GetType(Eval("Type","{0}"))%> </a>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="说明">
                    <HeaderStyle />
                    <ItemTemplate>
                        <%# Eval("Explain")%>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
                    <ItemTemplate>
                        <a href="EditDataList.aspx?ID=<%#Eval("ID") %>" ><i class="zi zi_pencilalt" title="修改"></i></a>
                        <a href="DBTools/Default.aspx" ><i class="zi zi_table" title="表结构"></i>表结构</a>
                        <a href="DataListView.aspx?ID=<%#Eval("ID") %>" ><i class="zi zi_dtabase" title="表数据"></i>表数据</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
		</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $(function () {
            $("#Search_T").keypress(function () {
                if (event.keyCode == 13)
                    $("#Search_Btn_Hid").click();
            });
            $("#sel_btn").click(function (e) {
                if ($("#sel_box").css("display") == "none") {
                    $(this).addClass("active");
                    $("#sel_box").slideDown(300);
                }
                else {
                    $(this).removeClass("active");
                    $("#sel_box").slideUp(200);
                }
            });
        })
    </script>
</asp:Content>

