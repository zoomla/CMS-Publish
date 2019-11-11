<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListDevice.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Printer.ListDevice" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>设备列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ListDevice.aspx","智能硬件"),
        new Bread() {url="", text="设备列表<a href='AddDevice.aspx'>[添加设备]</a>",addon="" }}
		)
    %>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" class="table table-striped table-bordered table-hover list_choice" EmptyDataText="您还没有打印设备"
        PageSize="10" OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-CssClass="" />
            <asp:TemplateField HeaderText="名称">
                <ItemTemplate>
                    <a href="MessageList.aspx?DevID=<%#Eval("ID") %>"><%#Eval("Alias") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ShopName" HeaderText="所属门店" />
            <asp:BoundField DataField="DeviceNo" HeaderText="设备编码" />
            <asp:TemplateField HeaderText="默认设备">
                <ItemTemplate><%#Eval("IsDefault").ToString().Equals("1")?"是":"否" %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Remind" HeaderText="备注" />
            <asp:TemplateField HeaderText="<%$Resources:L, 操作%>">
                <ItemTemplate>
                    <a  href="TestPrint.aspx?DevId=<%#Eval("ID") %>"><i class="zi zi_print" title="打印"></i>打印</a>
                    <a  href="AddDevice.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i>修改</a>
                    <asp:LinkButton ID="SetDef_B" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="setDef" OnClientClick='<%# Eval("IsDefault").ToString().Equals("1") ? "return false;":"return true;" %>' ><span style='<%# Eval("IsDefault").ToString().Equals("1") ? "color:#b1b1b1;":"" %>'><i class="zi zi_check"></i>设为默认</span></asp:LinkButton>
                    <asp:LinkButton ID="Del" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确认删除？')"><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i><%=Resources.L.删除 %></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="sysBtline">
    <asp:Button ID="Dels_Btn" runat="server" CssClass="btn btn-outline-danger" Text="批量删除" OnClientClick="return confirm('确定要删除这些设备吗?');" OnClick="Dels_Btn_Click" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
