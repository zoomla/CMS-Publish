<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PubRecycler.aspx.cs" Inherits="ZoomLaCMS.Manage.Pub.PubRecycler" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
    <title><%=Resources.L.存档管理 %> </title>
		<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("/{manage}/Content/ContentManage.aspx","内容管理"),
	new Bread("PubManage.aspx","互动模块管理"),
	new Bread() {url="/{manage}/Pub/PubRecycler.aspx", text="存档管理",addon="" }}
	)
	%>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <div class="panel panel-default pr-2 list_choice">
        <div class="panel panel-body " >
            <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="PubID" PageSize="10" OnRowDataBound="Egv_RowDataBound" 
        OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover"
         EnableTheming="False" EnableModelValidation="True" EmptyDataText="<%$Resources:L,暂无相关信息 %>">
        <Columns>
            <asp:TemplateField HeaderText="<%$Resources:L,选择 %>">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("PubID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="PubID" HeaderStyle-Width="5%" />
            <asp:BoundField HeaderText="<%$Resources:L,模块名称 %>" DataField="Pubname" HeaderStyle-Width="20%" />
            <asp:TemplateField HeaderText="<%$Resources:L,模块类型 %>">
                <ItemStyle Width="10%" />
                <ItemTemplate>
                    <%#PubtypeName(Eval("Pubtype", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,信息类别 %>">
                <ItemStyle Width="10%" />
                <ItemTemplate>
                    <%#GetClassName(Eval("PubClass", "{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,模型表名 %>" DataField="PubTableName" HeaderStyle-Width="10%" />
            <asp:TemplateField HeaderText="<%$Resources:L,调用标签 %>">
                <ItemStyle Width="20%" />
                <ItemTemplate>
                    {Pub.Load_<%#Eval("PubLoadstr")%>/}
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,操作 %>">
                <ItemStyle Width="15%" />
                <ItemTemplate>
                    <a href="pubinfo.aspx?menu=edit&id=<%#Eval("Pubid")%>" ><i class="zi zi_pencilalt" title="<%=Resources.L.修改 %>"></i></a>
                    <a href="pubinfo.aspx?menu=Truedelete&id=<%#Eval("Pubid")%>" onclick="return confirm('确实要彻底删除吗？');" ><i class="zi zi_trash" title="<%=Resources.L.彻底删除 %>"></i></a>
                    <a href="pubinfo.aspx?menu=revert&id=<%#Eval("Pubid")%>" ><i class="zi zi_recycle" title="<%=Resources.L.还原 %>"></i><%=Resources.L.还原 %></a>
                    <a href="Pubsinfo.aspx?Pubid=<%#Eval("Pubid") %>&type=0" ><i class="zi zi_magic" title="<%=Resources.L.管理 %>"></i><%=Resources.L.管理信息 %></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
        </div>
        <div class="panel panel-footer p-1">
            <asp:Button runat="server" ID="Clear_Btn" Text="<%$Resources:L,批量删除 %>" OnClick="Clear_Btn_Click" CssClass="btn btn-outline-danger" OnClientClick="return confirm('确定删除选中项?'); "/>
            <asp:Button runat="server" ID="Recyle_Btn" Text="<%$Resources:L,批量还原 %>" OnClick="Recyle_Btn_Click" CssClass="btn btn-outline-info"  />
            <asp:Button runat="server" ID="DelAll_Btn" Text="<%$Resources:L,清空文档 %>" OnClick="DelAll_Btn_Click" CssClass="btn btn-outline-info" OnClientClick="return confirm('确定清空文档?'); "/>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript">
        function getinfo(id) {
            location.href = "pubinfo.aspx?menu=edit&id=" + id + "";
        }
        //$().ready(function () {
        //    $("#Egv th:eq(0)").html("<input type='checkbox' id='chkAll' onclick='selectAllByName(this,\"idchk\");'>");
        //});
       
    </script>
</asp:Content>
