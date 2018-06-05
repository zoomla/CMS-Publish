<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailIdiographList.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.MailIdiographList" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>签名列表</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("SendMailList.aspx","订阅管理"),
        new Bread() {url="", text="签名管理<a href='AddMailIdiograph.aspx'> [添加签名]</a>",addon="" }}
		)
    %>
  <div class="list_choice">
    <ZL:ExGridView ID="EGV" DataKeyNames="ID" Width="100%" runat="server" OnRowCommand="EGV_RowCommand"  class="table table-striped table-bordered table-hover" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
            <asp:TemplateField>
              <ItemTemplate>
                <input  name="idchk" type="checkbox" value='<%#Eval("ID")  %>' />
              </ItemTemplate>
                <ItemStyle CssClass="" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
              <ItemStyle />
              <ItemTemplate>
                <%# Eval("ID") %>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="签名名称">
              <ItemTemplate> <a href='addMailIdiograph.aspx?ID=<%#Eval("ID") %>'><%#Eval( "Name")%></a> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="签名内容">
              <ItemTemplate>
                <%# Eval("Context") %>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="添加时间">
              <ItemTemplate>
               <%# Eval("CDate") %>
              </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton CommandName="Del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('是否确定删除!')" runat="server"><i class="zi zi_trashalt" zico="垃圾箱竖条"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            </Columns>
          </ZL:ExGridView>
  </div>
  <div class="sysBtline">
    <asp:Button ID="Dels_Btn" runat="server" CssClass="btn btn-outline-danger" Text="批量删除" OnClientClick="return confirm('是否确定删除!')" OnClick="Dels_Btn_Click" /></div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript">
    //全选
    $().ready(function () {
       
    });
</script>
</asp:Content>
