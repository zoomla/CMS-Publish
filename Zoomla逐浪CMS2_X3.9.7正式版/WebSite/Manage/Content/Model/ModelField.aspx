<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Manage/I/Index.master" CodeBehind="ModelField.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.ModelField" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>字段列表</title>
<asp:Literal runat="server" ID="Bread_Nav"></asp:Literal>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div class="panel panel-default container-fluid pr-0">
    <div class="panel-body row sysRow list_choice table-responsive-md">
        <table id="FieldList" class="table table-striped table-bordered table-hover sys_table">
            <tr class="gridtitle text-center">
                <th class="w1rem" scope="col"></th>
                <th scope="col"><strong>字段名</strong></th>
                <th scope="col"><strong>字段别名</strong></th>
                <th><strong>字段类型</strong></th>
                <th scope="col"><strong>字段级别</strong></th>
                <th scope="col"><strong>是否启用</strong></th>
                <th scope="col"><strong>前端显示</strong></th>
                <th scope="col"><strong>是否必填</strong></th>
                <th scope="col"><strong>批量添加</strong></th>
                <th scope="col"><strong>后台显示/内链</strong></th>
                <th scope="col"><strong>排序号</strong></th>
                <th scope="col"><strong>操作</strong></th>
            </tr>
            <ZL:Repeater ID="RPT" runat="server" OnItemCommand="RPT_ItemCommand">
                <ItemTemplate>
                    <tr data-id="<%#Eval("FieldID") %>" ondblclick="GetToUrl(' <%# Eval("FieldID") %>','<%# Eval("ModelID") %>');">
                        <td><%#GetChk() %></td>
                        <td>
                            <%#Eval("IsShow", "{0}") == "False" ? "<font color=#999999>" :""%><%#Eval("FieldName")%><%#Eval("IsShow","{0}")=="False"?"</font>":"" %>
                        </td>
                        <td><%#Eval("FieldAlias")%></td>
                        <td><%#GetFieldType(Eval("FieldType", "{0}"))%></td>
                        <td><%#IsSysField()%></td>
                        <td><%#IsValid(Eval("IsCopy", "{0}"),"iscopy") %></td>
                        <td><%#IsValid(Eval("IsShow", "{0}")) %></td>
                        <td><%#IsValid(Eval("IsNotNull", "{0}")) %></td>
                        <td><%#IsValid(Eval("Islotsize", "{0}")) %></td>
                        <td><%#IsValid(Eval("IsChain", "{0}")) %></td>
<%--                        <td>
                            <a href="javascript:;" onclick="moveup(this)">↑上移</a><a href="javascript:;" onclick="movedown(this)">下移↓</a>
                        </td>--%>
                        <td class="text-center"><%#Eval("OrderID") %></td>
                        <td class="text-center">
                            <asp:LinkButton runat="server" CommandName="edit2" CommandArgument='<%#Eval("FieldID")+"|"+Eval("FieldName") %>' ><i class="zi zi_pencilalt" title="修改"></i></asp:LinkButton>
                            <asp:LinkButton runat="server"  CommandName="Delete" CommandArgument='<%# Eval("FieldID") %>' OnClientClick="return confirm('确定删除此字段吗?\r\n\r\n删除后请更新相应字段输出配置以确保应用')" Visible='<%# Get_sum(Eval("Sys_type","{0}")) ? true:false %> '><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
            </ZL:Repeater>
        </table>
        <div style="width:100%;">
            <asp:HiddenField ID="Order_Hid" runat="server"/>
            <button type="button" onclick="sort_show();" class="btn btn-info">字段排序</button>
        <%--    <asp:Button ID="Order_B" runat="server" OnClientClick="return CheckOrder()" CssClass="btn btn-info" Text="保存排序" OnClick="Order_B_Click" />--%>
            <asp:Button runat="server" ID="BatDel_Btn" CssClass="btn btn-danger" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除选定字段吗?');" Text="批量删除" />
            <div style="float: right;">
                <%=PageCommon.GetTlpDP("TxtTemplate") %>
                <asp:HiddenField runat="server" ID="TxtTemplate_hid" />
                <asp:Button ID="Button1" runat="server" CssClass="btn btn-info" Text="设定模板" OnClick="SetTemplate" />
            </div>
        </div>
    </div>
</div>
<ZL:TlpDown runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    $().ready(function () {
        Tlp_initTemp();
    });
    ////上移操作
    //function moveup(obj) {
    //    $tr = $(obj).closest('tr');
    //    $pretr = $tr.prevAll(':visible').eq(0);
    //    var curorder = $tr.find("input[name='order']").val();
    //    var curid = $tr.data('id');
    //    var preid = $pretr.data('id');
    //    var preorder = $pretr.find("input[name='order']").val();
    //    $tr.find("input[name='order']").val(preorder);
    //    $pretr.find("input[name='order']").val(curorder);
    //    $tr.insertBefore($pretr);
    //    ajaxorder({ id: curid, tagid: preid, order: preorder, tagorder: curorder });
    //}
    ////下移操作
    //function movedown(obj) {
    //    $tr = $(obj).closest('tr');
    //    $nexttr = $tr.nextAll(':visible').eq(0);
    //    var curorder = $tr.find("input[name='order']").val();
    //    var curid = $tr.data('id');
    //    var nextid = $nexttr.data('id');
    //    var nextorder = $nexttr.find("input[name='order']").val();
    //    $tr.find("input[name='order']").val(nextorder);
    //    $nexttr.find("input[name='order']").val(curorder);
    //    $tr.insertAfter($nexttr);
    //    ajaxorder({id:curid,order:nextorder,tagid:nextid,tagorder:curorder});
    //}
    //ajax排序
    //function ajaxorder(option) {
    //    $.post('', { action: "orderup", curid: option.id, curorder: option.order, tagid: option.tagid, tagorder: option.tagorder }, function (data) {
    //        if (data != '1') {
    //            alert('操作出错，请重试或联系管理员!');
    //        }
    //    })
    //}
    function sort_show() {
        ShowComDiag("<%=customPath2 + "Common/Sort.aspx?tbname=ModelField&ModelID=" + ModelID%>", "模型字段排序");
    }
    //排序成功,页面回调
    function sort_callback() {
        location = location;
    }
    
    window.onload = function () {
        $("#FieldList tr td:contains('系统')").parent().hide();
    }
    function ShowList() {
        $("#FieldList tr td:contains('系统')").parent().toggle();
        $("#ShowLink").text($("#ShowLink").text() == "[显示所有字段]" ? "[隐藏系统字段]" : "[显示所有字段]");
    }
    function WinOpenDialog(url, w, h) {
        var feature = "dialogWidth:" + w + "px;dialogHeight:" + h + "px;center:yes;status:no;help:no";
        showModalDialog(url, window, feature);
    }
    function CheckOrder() {
        $("[name='order']").each(function (i, v) {
            if ($(v).val() != $(v).data('old')) {
                $("#Order_Hid").val($("#Order_Hid").val() + ","+$(v).data('id')+"|"+ $(v).val());
            }
        });
        return true;
    }
    function GetToUrl(fid, modelid) {
        if (ZL_Regex.isNum(fid) && ZL_Regex.isNum(modelid)) {
            location = " AddModelField.aspx?FieldID=" + fid + "&ModelID=" + modelid + "&ModelType=<%:ModelType%>";
        }
        else { alert("该字段不允许修改"); }
    }
</script>
<script runat="server">
//public string ShowEditUrl()
//{
//    string url = "";
//    if (ModelType == 7 && Eval("FieldID", "") == "")
//    { url = "ModelSys.aspx?ModelId=" + Eval("ModelID") + "&ModelType=" + ModelType; }
//    else { url = "AddModelField.aspx?name=" + Eval("FieldName") + "&ModelID=" + Eval("ModelID") + "&ModelType=" + ModelType; }
//    return url;
//}
</script>
</asp:Content>
