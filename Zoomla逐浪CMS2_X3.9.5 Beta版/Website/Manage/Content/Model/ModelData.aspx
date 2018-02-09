<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModelData.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Model.ModelData" MasterPageFile="~/Manage/I/Default.Master" %>
<%@ Import Namespace="System.Data" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>模型数据</title>
<style type="text/css">
.chkwrap{margin-right:5px;display:inline-block;min-width:80px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
    <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
    <li><a href='ModelManage.aspx?ModelType=<%:ModelType %>'>模型管理</a></li>
    <li class="active"><a href='<%=Request.RawUrl %>'>模型数据</a><asp:Label runat="server" ID="ModelName_L" /></li>
    <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="fa fa-search"></i></a></div>
    <div id="sel_box" class="padding5" style="height:80px;">
        <div class="input-group" style="width:738px;">
            <asp:DropDownList runat="server" ID="skey_dp" class="form-control text_md" DataTextField="FieldAlias" DataValueField="FieldName"></asp:DropDownList>
            <input type="text" id="skey" runat="server" class="form-control mvcparam" placeholder="请输入关键词" style="width:500px;" onkeypress="selbox.search();" />
            <span class="input-group-btn">
                <asp:LinkButton runat="server" class="btn btn-default" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="fa fa-search"></i></asp:LinkButton>
            </span>
        </div>
        <div class="margin_t5">
            <asp:Repeater runat="server" ID="Field_RPT">
                <ItemTemplate><label class="chkwrap"><input type="checkbox" name="ignore_chk" value="<%#Eval("FieldName") %>" /><%#Eval("FieldAlias") %></label></ItemTemplate>
            </asp:Repeater>
            <asp:Button runat="server" ID="Ignore_Btn" class="btn btn-info" OnClick="Ignore_Btn_Click" Text="忽略所选字段" />
        </div>
    </div>
</ol>
<table class="table table-bordered table-striped">
    <tr id="head_tr">
        <td class="td_xs"></td>
        <td class="td_s">操作</td>
       <%foreach (DataColumn dc in setting.dt.Columns){
               if (IsIgnoreField(dc.ColumnName)) { continue; }
               %>
     <td> <%:GetFieldAlias(dc.ColumnName)%></td>
        <%} %>

    </tr>
    <ZL:Repeater ID="RPT" runat="server" PageSize="20" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='8' id='page_td'><div class='text-center'>"
        PageEnd="</div></td></tr>" OnItemCommand="RPT_ItemCommand" OnItemDataBound="RPT_ItemDataBound">
        <ItemTemplate>
           <tr>
               <td><input type="checkbox" name="idchk" /></td>
               <td><asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>' class="option_style" OnClientClick="return confirm('确定要删除吗');">
                   <i class="fa fa-trash-o"></i></asp:LinkButton></td>
            <asp:Label runat="server" ID="ItemHtml_L" EnableViewState="false"></asp:Label>
           </tr>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:Repeater>
</table>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    $(function () {
        var ignores = ",<%:Ignores %>,";
        $("input[name='ignore_chk']").each(function () {
            if (ignores.indexOf("," + this.value + ",") > -1) { this.checked = true; }
        });
        $("#page_td").attr("colspan", $("#head_tr td").length - 1);
    })
</script>
</asp:Content>