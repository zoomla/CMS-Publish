<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlow.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.AddFlow" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程设计</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb  fixed-top">
        <li class="breadcrumb-item"><a href="/Admin/Main.aspx">工作台</a></li>
        <li class="breadcrumb-item"><a href="Default.aspx">流程列表</a></li>
        <li class="breadcrumb-item">
            <asp:Label runat="server" ID="ProceName_L"></asp:Label>
            <a href="AddFlowStep.aspx?proID=<%=ProID %>&Add=1">[添加步骤]</a>
        </li>
        <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" class="padding5">
            <div class="input-group">
                <asp:TextBox runat="server" id="searchText" class="form-control mvcparam max20rem" placeholder="请输入关键词" onkeypress="selbox.search();" />
                <span class="input-group-append">
                    <asp:LinkButton runat="server" class="btn btn-outline-secondary" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="zi zi_search"></i></asp:LinkButton>
                </span>
            </div>
        </div>
    </ol>
    <div class="list_choice table-responsive-md pr-1">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" 
            EnableTheming="False"  OnRowDataBound="EGV_RowDataBound" CssClass="table table-striped table-bordered" 
            OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="ID" OnRowCommand="EGV_RowCommand" AllowUserToOrder="true" EmptyDataText="当前没有信息!!">
            <Columns>
                <asp:TemplateField ItemStyle-CssClass="w1rem">
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="" />
                <asp:TemplateField HeaderText="步骤名" ItemStyle-CssClass="">
                    <ItemTemplate>
                        <%#GetTreeLine() %>
                        <%#Eval("StepName") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="序号" ItemStyle-CssClass="w12rem_lg">
                    <ItemTemplate>
                        <input type="text" class="stepnum form-control" data-id="<%#Eval("ID") %>" value="<%#Eval("StepNum") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="会签" ItemStyle-CssClass="">
                    <ItemTemplate>
                        <%#OACommon.GetHQoption(Eval("HQoption","")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="强制转交" ItemStyle-CssClass="">
                    <ItemTemplate>
                        <%#OACommon.GetQzzjoption(Eval("Qzzjoption","")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="回退" ItemStyle-CssClass="">
                    <ItemTemplate>
                        <%#OACommon.GetHToption(Eval("HToption","")) %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="下一步权限" ItemStyle-CssClass=""><ItemTemplate>
                    <%#OACommon.GetNextAuth(Eval("DocAuth","")) %>
                </ItemTemplate></asp:TemplateField>
                <asp:BoundField HeaderText="备注" DataField="Remind"  ItemStyle-CssClass=""/>
                <asp:TemplateField HeaderText="操作"  ItemStyle-CssClass="">
                    <ItemTemplate>
                       <a href="AddFlowStep.aspx?proID=<%= ProID %>&stepID=<%#Eval("ID") %>">查看详情</a>
                      |<asp:LinkButton runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除" Text="删除" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
		<div class="alert alert-light">
        <asp:Button runat="server" ID="SaveOrder_Btn" Text="保存排序" class="btn btn-info" OnClick="SaveOrder_Btn_Click" OnClientClick="return OrderCheck();" />
        <button type="button" class="btn btn-outline-info" onclick="ShowImgDiag()">查看流程图</button></div>
    </div>
    <div class="alert alert-info">步骤序号从1开始,不可缺少数值,支持同值序号(分支步骤)</div>
    <asp:HiddenField runat="server" ID="Order_Hid" />
    <asp:HiddenField runat="server" ID="ImgData_Hid" />
    <input type="hidden" id="image_hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    function OrderCheck() {
        var list = [];
        $(".stepnum").each(function () {
            $input = $(this);
            if (Convert.ToInt($input.val()) == 0) { alert("[" + $input.data("id") + "]步骤序号错误"); return false; }
            list.push({ id: $input.data("id"), "stepnum": $input.val() });
        });
        $("#Order_Hid").val(JSON.stringify(list));
    }
        
    var diag = new ZL_Dialog();
    function ShowImgDiag() {
        diag.title = "查看流程图";
        diag.url = "/Office/flow/ImgWorkFlow.aspx?proid=<%:ProID %>";
        diag.maxbtn = false;
        diag.ShowModal();
    }
</script>
</asp:Content>
