<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductsSelect.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ProductsSelect" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>选择商品</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="input-group" style="width:867px;margin-bottom:5px;">
            <span class="input-group-addon">
                <label><input type="checkbox" id="ALLChk" /> 全选</label>
            </span>
            <select id="ddlnode" name="ddlnode" class="form-control text_300" onchange="UpdateNode()">
                <option value="0">全部栏目</option>
                <asp:Label runat="server" ID="NodeHtml_L"></asp:Label>
            </select>
            <asp:TextBox ID="TxtKeyWord" class="form-control text_300" runat="server" placeholder="请输入商品名称"></asp:TextBox>
            <span class="input-group-btn">
                <asp:LinkButton runat="server" ID="BtnSearch" OnClick="BtnSearch_Click" class="btn btn-info"><i class="fa fa-search"></i> 搜索商品</asp:LinkButton>
                <button type="button" class="btn btn-info" onclick="suresel();"><i class="fa fa-sign-in"></i> 确定选择</button>
            </span>
        </div>
    <div style="min-height:300px;">
        <table class="table table-striped table-bordered" id="EGV">
        <tr>
            <td class="td_s"></td>
            <td class="td_m">商品图片</td>
            <td>商品名称</td>
            <td class="td_m">零售价</td>
        </tr>
        <asp:Repeater ID="RPT" runat="server">
            <ItemTemplate>
                <tr>
                    <td>
                        <label>
                            <input data-name="<%#Eval("Proname") %>" data-price="<%#Eval("LinPrice","{0:F2}") %>" name="idchk" type="<%=ChkMode %>" value="<%#Eval("ID") %>" />
                            <%#Eval("ID") %>
                        </label>
                    </td>
                    <td><img src=" <%#getproimg()%>" class="img_50" /></td>
                    <td>
                        <div style="display:inline-block;width:40%;overflow:hidden;"><%#Eval("Proname") %></div>
                        <%#GetGroupPro() %>
                    </td>
                    <td><%#Eval("LinPrice","{0:F2}")%></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>
.pro_btn{border-radius:11px;padding:0 10px;color:#ededed;border:0px;}
.pro_btn:hover{color:#ededed;}
.pro_btn:focus{outline: none;color:#ededed;}
.grouppro_btn{background-color:#c9302c;}
.suitpro_btn{background-color:#ff0000;}
#navHolder{display:none;}
</style>
<script src="/JS/SelectCheckBox.js"></script>
<script>
    $(function () {
        $("#ddlnode").val("<%:NodeID%>");
        $("#ALLChk").click(function () { selectAllByName(this,"idchk"); });
    })
    function suresel() {
        var list = [];
        var $chks = $("#EGV input[name='idchk']:checked");
        if ($chks.length < 1) { alert("尚未选择商品"); return; }
        $chks.each(function () {
            var $this = $(this);
            list.push({ id: $this.val(), name: $this.data("name"), price: $this.data("price") });
        });
<%-- parent.window["<%:CallBack%>"](JSON.stringify(list));--%>
        InvokeBack(list);
        parent.closeDiag();
    }
    function UpdateNode() {
        location = "<%=customPath2%>Shop/ProductsSelect.aspx?NodeID=" + $("#ddlnode").val()+"&callback=<%:CallBack%>";
    }
    //调用父页面的回调
    function InvokeBack(list) {
        var json = JSON.stringify(list);
        var back = "<%:CallBack%>";
        var func = null;//回调的方法
        if (!back || back == "") { return; }
        if (back.indexOf(".") == -1) { func = parent.window[back]; }
        else
        {
            var obj = parent.window[back.split(".")[0]];
            func = obj[back.split(".")[1]];
        }
        if (func) { func(json); }
    }
</script>
</asp:Content>
