<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollectionManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.CollectionManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=lang.LF("采集分析")%></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("../ContentManage.aspx","内容管理"),
		new Bread("/{manage}/Content/Collect/CollectionManage.aspx","信息采集"),
		new Bread("/{manage}/Content/Collect/CollectionManage.aspx","项目管理"),
        new Bread() {url="CollectionStep1.aspx", text="<span class='text-danger'>[添加采集项目]</span>",addon="" }},
		Call.GetHelp(95)
		)
    %>
	<div class="table-responsive-md">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="CItem_ID" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand"
        IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EmptyDataText="暂无相关项目！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" title="" value='<%#Eval("CItem_ID") %>' />
                </ItemTemplate>
                <HeaderStyle  />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="CItem_ID">
                <HeaderStyle  />
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="项目名称">
                <ItemTemplate>
                    <a href='CollectionStep1.aspx?Action=Modify&ItemID=<%#DataBinder.Eval (Container.DataItem,"CItem_ID")%>'>
                        <%#DataBinder.Eval(Container.DataItem, "ItemName")%></a>
                </ItemTemplate>
                <HeaderStyle  />
                <ItemStyle />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="网站名称">
                <ItemTemplate>
                    <a href='<%#DataBinder.Eval(Container.DataItem,"CollUrl") %>' target="_blank">
                        <%#DataBinder.Eval(Container.DataItem, "SiteName")%></a>
                </ItemTemplate>
                <HeaderStyle />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="入库节点">
                <ItemTemplate>
                    <%#GetNode(DataBinder.Eval(Container.DataItem, "NodeID").ToString())%>
                </ItemTemplate>
                <HeaderStyle  />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属模型">
                <ItemTemplate>
                    <%#GetMode(DataBinder.Eval(Container.DataItem, "ModeID").ToString())%>
                </ItemTemplate>
                <HeaderStyle  />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href='CollectionStep1.aspx?Action=Modify&ItemID=<%#DataBinder.Eval (Container.DataItem,"CItem_ID")%>'><i class="zi zi_pencilalt" title="修改"></i>项目</a> 
                    <a href='CollectionStep2.aspx?Action=Modify&ItemID=<%#DataBinder.Eval (Container.DataItem,"CItem_ID")%>'><i class="zi zi_pencilalt" title="修改"></i>列表</a> 
                    <a href='CollectionStep3.aspx?Action=Modify&ItemID=<%#DataBinder.Eval (Container.DataItem,"CItem_ID")%>'><i class="zi zi_pencilalt" title="修改"></i>字段</a> 
                    <asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%# Eval("CItem_ID") %>' OnClientClick="return confirm('你确定将该数据删除吗？')"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tr>
            <td>
                <asp:Button ID="btnDeleteAll" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="批量删除" OnClick="btnDeleteAll_Click" class="btn btn-outline-danger" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        $("body").ready(function () {
            $("#Egv").find("tr").dblclick(function () {
                var id= $($(this).children()[1]).text();
                window.location = "CollectionStep1.aspx?Action=Modify&ItemID="+id ;
            });
        })
        function IsSelectedId() {
            var checkArr = $("input[type=checkbox][name=idchk]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>
