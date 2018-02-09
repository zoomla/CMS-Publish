<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BindWechat.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Addon.BindWechat" MasterPageFile="~/Manage/I/Default.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>绑定微信用户</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="input-group" style="margin-bottom:5px;">
    <asp:TextBox runat="server" ID="Key_T" class="form-control" />
    <span class="input-group-btn">
        <asp:Button runat="server" ID="Key_Btn" class="btn btn-info" Text="搜索" OnClick="Key_Btn_Click"/>
    </span>
</div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
                class="table table-striped table-bordered" EmptyDataText="当前没有信息!!"  OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="用户头像">
                <ItemTemplate>
                    <img class="imgurl" src="<%#Eval("HeadImgUrl") %>" style="width:30px;height:30px;"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户名">
                <ItemTemplate><span class="name"><%#Eval("Name") %></span></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="CMS用户信息">
                <ItemTemplate>
                    <a href="javascript:;" onclick="user.showuinfo('<%#Eval("UserID") %>');"><%#Eval("UserName") %> </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="OpenID">
                <ItemTemplate><%#Eval("OpenID") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="更新时间">
                <ItemTemplate>
                    <span class="cdate"><%#Eval("CDate") %></span>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                  <asp:LinkButton runat="server" class="btn btn-sm btn-info" CommandName="bind" CommandArgument='<%#Eval("ID") %>'
                       OnClientClick="return confirm('确定要将该微信账号与用户绑定吗');">
                      <i class="fa fa-link"></i> 绑定用户</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content> 
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
#navHolder{display:none;}
.allchk_l{display:none;}
</style>
<script>

</script>
</asp:Content>