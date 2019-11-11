<%@ Page Language="C#"  MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="StructList.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.StructList" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>组织结构</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server"	>
    <div class="table-responsive-md pr-1">
            <div style="margin-bottom:5px;">
                <a href="javascript:;" onclick="node.add(0);" class="btn btn-info">添加组织</a>
            </div>
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
                <Columns>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>
                            <input type="checkbox" name="idchk" value="<%#Eval("ID") %>"/><asp:Label ID="Lbl" runat="server" Text='<%#Eval("ID") %>' Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="ID" DataField="ID"/>
                    <asp:TemplateField HeaderText="名称">
                        <ItemTemplate>
                            <a href="javascript:;" onclick="node.edit(<%#Eval("ID") %>);"> <%#Eval("Name") %></a>
                        </ItemTemplate>
                    </asp:TemplateField>
      <%--              <asp:TemplateField HeaderText="创建人">
                        <ItemTemplate>
                            <%#getName(Eval("UserID").ToString()) %>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                    <asp:TemplateField HeaderText="创建时间">
                        <ItemTemplate>
                        <%#Eval("AddTime") %>
                        </ItemTemplate>
                    </asp:TemplateField>
                       <asp:TemplateField HeaderText="开放">
                        <ItemTemplate>
                            <%#getOpen(Eval("Opens").ToString()) %> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="成员数量">
                        <ItemTemplate>
                            <%#Eval("UserIDS","").Split(",".ToCharArray(),StringSplitOptions.RemoveEmptyEntries).Length %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="javascript:node.add(<%#Eval("ID") %>);"><i class="zi zi_plus"></i></a>
                            <a href="javascript:node.edit(<%#Eval("ID") %>);" title="修改"><i class="zi zi_pencilalt"></i></a>
                            <a href="StructMember.aspx?id=<%#Eval("ID") %>" title="成员管理"><i class="zi zi_useralt"></i></a>
                            <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class='zi zi_trashalt'></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </ZL:ExGridView>
        <div class="sysBtline">
            <asp:Button ID="BatDel_Btn" class="btn btn-outline-danger" Text="批量删除" runat="server" OnClientClick="return confirm('确定要批量删除吗');" OnClick="BatDel_Btn_Click" />
            <a href="StructChart.aspx"  class="btn btn-outline-info" >组织结构图</a>
        </div>

    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
    #navHolder{display:none;}
</style>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    var node = {};
    node.add = function (id) { ShowComDiag("AddStruct.aspx?pid="+id,"添加信息"); }
    node.edit = function (id) { ShowComDiag("AddStruct.aspx?id="+id,"修改信息"); }
</script>
</asp:Content>