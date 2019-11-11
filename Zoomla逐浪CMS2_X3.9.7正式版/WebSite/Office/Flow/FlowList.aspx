<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowList.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Flow.FlowList" MasterPageFile="~/Office/OAMain.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href="/Office/Main.aspx">办公平台</a></li>
        <li class="breadcrumb-item"><a href="<%#Request.RawUrl %>">流程列表</a></li>
    </ol>
    <div class="table-responsive-md list_choice pr-1"></div>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" PageSize="10" 
        OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" 
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
        <Columns>
            <asp:BoundField HeaderText="No" DataField="ID" ControlStyle-CssClass="" />
            <asp:TemplateField HeaderText="流程名称">
                <ItemTemplate>
                  <a href="FlowApply.aspx?ProID=<%#Eval("ID") %>"><%#Eval("ProcedureName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField  HeaderText="流程步骤" />
            <asp:BoundField DataField="FormInfo"  HeaderText="流程表单" />
            <asp:TemplateField HeaderText="允许附件">
                <ItemTemplate>
                    <%#GetAllowAttach(Eval("AllowAttach","{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Remind" HeaderText="备注" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                   <a href="FlowApply.aspx?ProID=<%#Eval("ID") %>" class="btn btn-outline-info">新建<%#Eval("SponsorGroup") %></a>
                    <button type="button" onclick="ShowImgDiag(<%#Eval("ID") %>)" class="btn btn-outline-info">查看流程图</button>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var diag = new ZL_Dialog();
        function ShowImgDiag(proID) {
            diag.title = "查看流程图";
            diag.width = "diag";
            diag.url = "ImgWorkFlow.aspx?proid=" + proID;
            diag.maxbtn = false;
            diag.ShowModal();
        }
    </script>
</asp:Content>
