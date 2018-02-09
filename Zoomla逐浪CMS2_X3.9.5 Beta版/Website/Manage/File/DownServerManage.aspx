<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownServerManage.aspx.cs" Inherits="ZoomLaCMS.Manage.FtpFile.DownServerManage" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Default.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>下载服务器管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered" EmptyDataText="当前没有信息!!" 
                OnRowCommand="EGV_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging"  OnRowDataBound="Egv_RowDataBound" >
    
    <Columns>
    <asp:TemplateField ItemStyle-CssClass="td_xs">
      <ItemTemplate>
          <input type="checkbox" name="idchk" value="<%#Eval("ServerID") %>" />
      </ItemTemplate>
    </asp:TemplateField>
    <asp:BoundField DataField="ServerID" HeaderText="ID" ItemStyle-CssClass="td_s" /> 
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
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a href='DownServer.aspx?ID=<%# Eval("ServerID")%>' class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
                <asp:LinkButton runat="server" CommandArgument='<%#Eval("ServerID") %>' CommandName="del2" class="option_style" OnClientClick="return confirm('确定要删除吗');">
                    <i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
  <div class="clearbox"> </div>
 <asp:Button ID="btndelete" class="btn btn-primary" runat="server" OnClientClick="return confirm('你确定要将所有选择项删除吗？');" Text="批量删除" OnClick="btndelete_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>