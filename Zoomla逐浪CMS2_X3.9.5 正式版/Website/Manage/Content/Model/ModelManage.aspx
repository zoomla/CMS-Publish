<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="ModelManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.ModelManage" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title><%=Resources.L.模型管理 %></title>
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ModelManage.aspx?ModelType="+ModelType,"模型管理"),
        new Bread() {url="ModelManage.aspx?ModelType="+ModelType, text=bll.GetModelType(ModelType)+ "管理 <a href='AddEditModel.aspx?ModelType="+ ModelType+"'>[添加模型]</a>",addon="" }},
		Call.GetHelp(10)
		)
%>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div class="container-fluid pr-0 table-responsive-md">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="ModelID" PageSize="20" OnRowDataBound="Egv_RowDataBound" 
        OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" 
        AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered sysRow list_choice mb_8rem" 
        EnableTheming="False" EnableModelValidation="True" EmptyDataText="<%$Resources:L,暂无模型信息 %>">
        <Columns>
            <asp:TemplateField HeaderText="操作" >
                <ItemTemplate>
					<div class="btn-group">
						<a class="dropdown-toggle" href="javascript:;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><%=Resources.L.操作 %><span class="caret"></span></a>
					  <div class="dropdown-menu">
						<a href="ModelField.aspx?ModelID=<%#Eval("ModelID") %>&ModelType=<%:ModelType %>" class="dropdown-item"><i class="zi zi_columns"></i> 字段</a>
						<a href="AddEditModel.aspx?ModelID=<%#Eval("ModelID") %>&ModelType=<%:ModelType %>" class=" dropdown-item"><i class="zi zi_pencilalt"></i> <%=Resources.L.编辑 %></a>
						<asp:LinkButton runat="server" class="dropdown-item" CommandName="Copy" CommandArgument='<%# Eval("ModelID")%>' Enabled='<%#GetEnabled(Eval("SysModel").ToString()) %>'><i class="zi zi_paste"></i> <%=Resources.L.复制 %></asp:LinkButton>
						<asp:LinkButton runat="server" class="dropdown-item" CommandName="Del2" CommandArgument='<%# Eval("ModelID") %>' OnClientClick="return confirm('确实要删除此模型吗？');"><i class="zi zi_trashalt"></i> <%=Resources.L.删除 %></asp:LinkButton>
						<a href="ModelData.aspx?ID=<%#Eval("ModelID") %>" class="dropdown-item"><i class="zi zi_database"></i> 数据</a>
					  </div>
					</div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID" >
                <ItemTemplate>
                    <strong><%# Eval("ModelID") %></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,模型名称 %>">
                <ItemTemplate>
                    <%#GetModelIcon() %>
                    <strong><%# Eval("ModelName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,表名 %>" >
                <ItemTemplate>
                    <strong><%# Eval("TableName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,项目名称 %>" >
                <ItemTemplate>
                    <strong><%# Eval("ItemName")%></strong>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,模型描述 %>" DataField="Description"  />           
        </Columns>
    </ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

<link href="/Plugins/Third/alert/sweetalert.css" rel="stylesheet" />
<style>
.allchk_l{display: none;}
</style>
<script src="/Plugins/Third/alert/sweetalert.min.js?v=1"></script>
<script>
function getinfo(id) {
	location.href = "AddEditModel.aspx?ModelID=" + id + '&ModelType=<%=ModelType %>';
}
$(".btn-group .aspNetDisabled").addClass("dropdown-item")
//$(".dropdown-menu").css('top','140px')
//function confirmDel() {
//    swal({
//        title: "删除模型", "text": '<input type="button" />  <span style="color:red;"></span>', html: true,
//        type: "info",
//        showCancelButton: true,
//        confirmButtonColor: "#DD6B55",
//        confirmButtonText: "确定",
//        closeOnConfirm: false
//    }, function () { $("#Refund_Btn").click(); });
//}
HideColumn("1,4,5");
</script>
</asp:Content>