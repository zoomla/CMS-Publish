<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyList.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Flow.ApplyList" MasterPageFile="~/Office/OAMain.master" %>  
<asp:Content runat="server" ContentPlaceHolderID="head"><title>申请列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb fixed-top mt-1">
        <li class="breadcrumb-item"><a href="/Office/Main.aspx">办公管理</a></li>
        <li class="breadcrumb-item"><a href="/Office/Main.aspx">流程管理</a></li>
        <li class="breadcrumb-item"><asp:Label runat="server" ID="CurView_L"></asp:Label>(提示：支持自定义分类，分类格式为：/Office/Flow/ApplyList.aspx?view=3&proid=[流程ID])</li>
    </ol>

    <ul id="proul" class="nav nav-tabs list_choice">
        <li id="proli_0" class="nav-item"><a class="nav-link active" href="ApplyList.aspx?View=<%:CurrentView %>">查看全部</a></li>
        <asp:Repeater runat="server" ID="ProRPT" EnableViewState="false">
            <ItemTemplate>
                <li class="nav-item" id="proli_<%#Eval("ID") %>"><a class="nav-link" href="ApplyList.aspx?View=<%#CurrentView+"&ProID="+Eval("ID") %>"><%#Eval("ProcedureName") %></a></li>
            </ItemTemplate>
        </asp:Repeater>
        <li class="nav-item"><a class="nav-link" href="/Office/Doc/FiledList.aspx">归档文件</a></li>
    </ul>
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"
         EnableTheming="False" GridLines="None" CssClass="table table-bordered table-striped table-hover"
         EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="流程" DataField="Title" />
            <asp:BoundField HeaderText="拟稿部门" DataField="Branch" />
            <asp:TemplateField HeaderText="申请人" ItemStyle-CssClass="">
                <ItemTemplate>
                   <%#Eval("UserName") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate><%# GetStatus(Eval("Status","{0}")) %></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="申请时间" DataField="CreateTime" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <%#GetLinks() %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button runat="server" ID="Del_Btn" OnClick="Del_Btn_Click" style="display:none;" />
    <asp:Button runat="server" ID="WithDraw_Btn" OnClick="WithDraw_Btn_Click" style="display:none;" />
    <asp:HiddenField runat="server" ID="DelID_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        function SetDel(id) {
            if (!confirm("确定要删除吗?")) { return false; }
            $("#DelID_Hid").val(id);
            $("#Del_Btn").click();
            return true;
        }
        function SetWithDraw(id) {
            if (!confirm("确定要撤回吗?")) { return false; }
            $("#DelID_Hid").val(id);
            $("#WithDraw_Btn").click();
        }
        $(function () {
            var proid = "<%:ProID%>";
            if (proid != "0") {
                var $lis = $("#proul li");
                $lis.find("a").removeClass("active");
                $("#proli_" + proid).find("a").addClass("active");
            }
        })
    </script>
</asp:Content>
