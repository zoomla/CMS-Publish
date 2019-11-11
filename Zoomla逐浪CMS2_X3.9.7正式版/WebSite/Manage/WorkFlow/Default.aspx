<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.Default" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
                <li class="breadcrumb-item"><a href="/Admin/I/Main.aspx">工作台</a></li>
                <li class="breadcrumb-item"><a href="<%=Request.RawUrl %>">流程管理</a></li>
                <li class="breadcrumb-item">流程列表<a href="WorkFlow.aspx"> [添加流程]</a></li>
            <div class="pull-right mr-2 ml-auto"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
            <div id="sel_box" runat="server">
                <div class="input-group pull-left">
                    <asp:TextBox runat="server" ID="searchText" class="form-control max20rem" placeholder="请输入需要查询的信息" />
                    <span class="input-group-append">
                        <asp:Button ID="searchBtn" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="searchBtn_Click" />
                    </span>
                </div>
            </div>
     </ol>
 <div class="table-responsive-md list_choice pr-1">
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" 
    EnableTheming="False" CssClass="table table-striped table-bordered table-hover" 
    EmptyDataText="当前没有信息!!" OnRowDataBound="EGV_RowDataBound" DataKeyNames="ID" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" HeaderStyle-CssClass="" />
            <asp:TemplateField HeaderText="流程名">
                <ItemTemplate>
                    <a href="WorkFlow.aspx?proID=<%#Eval("ID") %>"><%#Eval("ProcedureName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="项目名称" DataField="SponsorGroup" ItemStyle-CssClass=""/>
            <asp:BoundField HeaderText="模型" DataField="FormInfo" ItemStyle-CssClass=""/>
            <asp:BoundField HeaderText="流程模板" DataField="FlowTlp" ItemStyle-CssClass=""/>
            <asp:BoundField HeaderText="打印模板" DataField="PrintTlp" ItemStyle-CssClass=""/>
            <asp:TemplateField HeaderText="允许附件" ItemStyle-CssClass="">
                <ItemTemplate>
                    <%#GetAllowAttach(Eval("AllowAttach","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态" ItemStyle-CssClass="">
                <ItemTemplate><span class="rd_green">启用</span></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="备注" DataField="Remind" ItemStyle-CssClass="" />
            <asp:TemplateField HeaderText="操作"  ItemStyle-CssClass="max20rem">
                <ItemTemplate>
                    <a href="WorkFlow.aspx?proID=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="编辑"></i></a>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除" ><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                    <a href="AddFlow.aspx?proID=<%#Eval("ID") %>"><i class="zi zi_eye" title="查看"></i>查看步骤</a>
                    <a href="javascript:;" onclick="ShowImgDiag(<%#Eval("ID") %>)" ><i class="zi zi_eye" title="查看"></i>查看流程图</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
<div class="alert alert-light">
<div class="rd_green">提示：流程中Word,签章等操作权限与用户角色绑定</div></div>
<style>
.allchk_l{display: none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript">
    $().ready(function () {
        $(":button").addClass("btn btn-outline-info");
        $(":submit").addClass("btn btn-outline-secondary");
        //$("#EGV tr:last >td>:text").css("line-height", "normal");
        //$("#EGV tr:first >th").css("text-align", "center");
    });
    var diag = new ZL_Dialog();
    function ShowImgDiag(proid) {
        diag.title = "查看流程图";
        diag.url = "/Office/flow/ImgWorkFlow.aspx?proid=" + proid;
        diag.maxbtn = false;
        diag.ShowModal();
    }
</script>
</asp:Content>
