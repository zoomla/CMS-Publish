<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MNBakList.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Addon.MNBakList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.节点备份 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb fixed-top w-100">
                <li class="breadcrumb-item"><a href="/Admin/Main.aspx"><%=Resources.L.工作台 %></a></li>
                <li class="breadcrumb-item"><a href="/Admin/Config/DatalistProfile.aspx"><%=Resources.L.扩展功能 %></a></li>
                <li class="breadcrumb-item"><%=Resources.L.开发中心 %></li>
                <li class="breadcrumb-item"><%=Resources.L.备份列表 %>
                    <asp:LinkButton runat="server" ID="CreateBak_Btn" class="ml-2" OnClientClick="return confirm('确定要创建当前备份吗?');" OnClick="CreateBak_Btn_Click">[ <%=Resources.L.创建备份 %> ]</asp:LinkButton></li>
            </ol>
        </div>
    </div>
	<div class="table-responsive list_choice pr-1">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" PageSize="10" IsHoldState="false"
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="<%$Resources:L,没有备份数据 %>">
        <Columns>
            <%--  <asp:TemplateField>
                <ItemTemplate>
              <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="<%$Resources:L,文件名称 %>">
                <ItemTemplate>
                    <%#Eval("Name") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,文件类型 %>">
                <ItemTemplate>
                    <%#System.IO.Path.GetExtension(Eval("Name","")).ToLower().Equals(".config")?Resources.L.备份文件 :Eval("Type") %>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="<%$Resources:L,文件大小 %>">
                <ItemTemplate>
                    <%#GetFileSize() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,创建时间 %>" DataField="CreateTime" DataFormatString="{0:yyyy/MM/dd HH:mm}" />
            <asp:TemplateField HeaderText="<%$Resources:L,下载 %>">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("name") %>' CommandName="download"  ToolTip="<%$Resources:L,下载 %>"><i class="zi zi_clouddownload"> </i></asp:LinkButton>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("name") %>' CommandName="restore"  OnClientClick="return confirm('[确定恢复该备份吗?]改为[系统将还原所有节点模型数据(此操作不可逆),是否继续?] 恢复前清空数据');"><i class="zi zi_recycle"> <%=Resources.L.数据恢复 %></i></asp:LinkButton>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("name") %>' CommandName="del2"  OnClientClick="return confirm('确定要删除该备份吗?');"><i class="zi zi_trash"> <%=Resources.L.删除备份 %></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
    <div class="alert alert-info mb-1">
        <ol>
            <li><%=Resources.L.节点备份_notice1 %></li>
            <li><%=Resources.L.节点备份_notice2 %></li>
        </ol>
    </div>
    <div class="alert alert-danger">
        <ol>
            <li><span class="w-100"><%=Resources.L.节点备份_notice3 %></span></li>
            <li><%=Resources.L.节点备份_notice4 %> <a href="../../Config/BackupRestore.aspx"> <%=Resources.L.节点备份_notice5 %></a></li>
        </ol>
    
	</div>
<style>
.allchk_l{display: none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
