<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollectionStart.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.CollectionStart" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>开始采集项目</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="CItem_ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无采集项目！！">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" title="" value='<%#Eval("CItem_ID") %>' />
                </ItemTemplate>
                <HeaderStyle Width="4%" />
                <ItemStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="CItem_ID">
                <HeaderStyle Width="5%" />
                <ItemStyle  HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="项目名称">
                <ItemTemplate>
                    <a href='CollectionStep1.aspx?Action=Modify&ItemID=<%#DataBinder.Eval (Container.DataItem,"CItem_ID")%>'>
                        <%#DataBinder.Eval(Container.DataItem, "ItemName")%></a>
                </ItemTemplate>
                <HeaderStyle Width="30%" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="采集网站名称">
                <ItemTemplate>
                    <a href='<%#DataBinder.Eval(Container.DataItem,"CollUrl") %>' target="_blank">
                        <%#DataBinder.Eval(Container.DataItem, "SiteName")%></a>
                </ItemTemplate>
                <HeaderStyle Width="12%" />
                <ItemStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属栏目">
                <ItemTemplate>
                    <%#GetNode(DataBinder.Eval(Container.DataItem, "NodeID").ToString())%>
                </ItemTemplate>
                <HeaderStyle Width="20%" />
                <ItemStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属模型">
                <ItemTemplate>
                    <%#GetMode(DataBinder.Eval(Container.DataItem, "ModeID").ToString())%>
                </ItemTemplate>
                <HeaderStyle Width="10%" />
                <ItemStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="LastTime" HeaderText="最后采集时间">
            </asp:BoundField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button runat="server" class="btn btn-primary" ID="ClearAndColl_Btn" Text="重新开始采集" OnClick="ClearAndColl_Btn_Click"/>
    <asp:Button runat="server" class="btn btn-primary" ID="btnCollAll" Text="加入采集队列"  OnClick="btnCollAll_Click" />
    <div class="alert alert-danger margin_t5">
        <div>重新开始采集：将清空队列中的采集任务(如果有正在进行的任务),并开始采集</div>
        <div>加入采集队列：将任务添加入队列,等待其完成采集</div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script>
    function IsSelectedId() {
        var checkArr = $("input[type=checkbox][name=idchk]:checked");
        if (checkArr.length > 0)
            return true
        else
            return false;
    }
</script>
</asp:Content>
