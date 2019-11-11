<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownServerManage.aspx.cs" Inherits="ZoomLaCMS.Manage.FtpFile.DownServerManage" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>下载服务器管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/plus/ADManage.aspx","扩展功能"),	
        new Bread("","文件管理"),	
        new Bread() {url="DownServerManage.aspx", text="下载服务器<a href='DownServer.aspx'>[添加下载服务器]</a>",addon="" }}
		)
    %>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered list_choice" EmptyDataText="当前没有信息!!" 
                OnRowCommand="EGV_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging"  OnRowDataBound="Egv_RowDataBound" >
    
    <Columns>
    <asp:TemplateField ItemStyle-CssClass="">
      <ItemTemplate>
          <input type="checkbox" name="idchk" value="<%#Eval("ServerID") %>" />
      </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="ServerID" HeaderText="ID" ItemStyle-CssClass="" /> 
    <asp:TemplateField HeaderText="服务器名">
      <ItemTemplate> <%# DataBinder.Eval(Container.DataItem, "ServerName")%> </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="服务器LOGO">
      <ItemTemplate> <%#Getico(Eval("ServerLogo","{0}"))%> </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="显示方式">
      <ItemTemplate> <%#Convert.ToInt32(Eval("ShowType"))==0?"显示名称":"显示LOGo"%> </ItemTemplate>
    </asp:TemplateField>
    <asp:TemplateField HeaderText="服务器地址">
      <ItemTemplate> <%#Eval("ServerUrl")%> </ItemTemplate>
    </asp:TemplateField>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
            <ItemTemplate>
                <a href='DownServer.aspx?ID=<%# Eval("ServerID")%>' ><i class="zi zi_pencilalt" title="修改"></i></a>
                <asp:LinkButton runat="server" CommandArgument='<%#Eval("ServerID") %>' CommandName="del2"  OnClientClick="return confirm('确定要删除吗');">
                    <i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<div class="alert alert-light">
 <asp:Button ID="btndelete" class="btn btn-outline-danger" runat="server" OnClientClick="return confirm('你确定要将所有选择项删除吗？');" Text="批量删除" OnClick="btndelete_Click" />
 </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>