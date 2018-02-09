<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayPlatManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Pay.PayPlatManage" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>支付平台管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AutoGenerateColumns="False"  DataKeyNames="PayPlatID" PageSize="20"
        OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Lnk_Click"  CssClass="table table-bordered" EmptyDataText="无支付平台信息">
        <Columns>
      <%--      <asp:TemplateField ItemStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("PayPlatID") %>" /></ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField HeaderText="ID" DataField="PayPlatID" ItemStyle-CssClass="td_s" />
            <asp:BoundField HeaderText="名称" DataField="PayPlatName" ItemStyle-CssClass="td_l" />
            <asp:TemplateField HeaderText="支付平台">
                <ItemTemplate>
                    <%#GetPayClass() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="商户号" DataField="AccountID" ItemStyle-CssClass="td_l"/>
            <asp:TemplateField HeaderText="默认" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <%# GetDefault(Eval("IsDefault", "{0}")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="启用" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                   <input type="checkbox" value="<%#Eval("PayPlatID") %>" class="switchChk" onchange="disableThis(this);" <%#Eval("IsDisabled","").Equals("True")?"":"checked=\"checked\"" %> />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="排序" ItemStyle-CssClass="td_l text-center">
                <ItemTemplate>
                    <a href="javascript:;" class="option_style" onclick="MoveItem(this,'up');"><i class="fa fa-arrow-up"></i>上移</a>
                    <a href="javascript:;" class="option_style" onclick="MoveItem(this,'down');"><i class="fa fa-arrow-down"></i>下移</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作"  ItemStyle-CssClass="td_l">
                <ItemTemplate>
                    <a href="AddPayPlat.aspx?ID=<%#Eval("PayPlatID") %>" class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
       <%--             <asp:LinkButton runat="server" CommandName="Disabled" CommandArgument='<%# Eval("PayPlatID") %>' CssClass="option_style"></asp:LinkButton>--%>
                    <asp:LinkButton runat="server" CommandName="SetDef" CommandArgument='<%# Eval("PayPlatID") %>' CssClass="option_style"><i class="fa fa-flag" title="设为默认"></i>设为默认</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script>
<style type="text/css">
.allchk_l{display:none;}
</style>
<script>
    function disableThis(chk) {
        $.post("", {action:"enable", id: chk.value, "status": chk.checked }, function (data) {
            console.log(data);
        });
    }
    function MoveItem(obj, direct) {
        var $curtr = $(obj).closest("tr");
        var $tarTr = null;
        switch (direct) {
            case "up":
                $tarTr = $curtr.prev("tr");
                if ($tarTr.length < 1 || $tarTr.data("gid") == undefined) { console.log("无目标行,不处理"); return; }
                $curtr.after($tarTr);
                break;
            case "down":
                $tarTr = $curtr.next("tr");
                if ($tarTr.length < 1 || $tarTr.data("gid") == undefined) { console.log("无目标行,不处理"); return; }
                $tarTr.after($curtr);
                break;
        }
        var opts = { action: "move", "direct": direct, curid: $curtr.data("gid"), tarid: $tarTr.data("gid") };
        $.post("PayPlatManage.aspx", opts, function (data) { });
    }
</script>
</asp:Content>
