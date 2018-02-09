<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpTime.aspx.cs" Inherits="ZoomLaCMS.Cart.Comp.ExpTime" MasterPageFile="~/Common/Master/Empty.master" EnableSessionState="False"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>配送时间</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div style="padding:5px;" class="text-center">
<div>
    <table class="table table-bordered">
        <tr id="timespan_tr"><td>时间段</td></tr>
        <tr id="span1_tr"><td>09:00-15:00</td></tr>
        <tr id="span2_tr"><td>15:00-19:00</td></tr>
    </table>
</div>
<div class="r_gray margin_t10">
    温馨提示：我们会努力按照您指定的时间配送，但因天气、交通等各类因素影响，您的订单有可能会有延误现象！
</div>
<div class="text-center margin_t10">
    <input type="button" class="btn btn-danger" value="确定" onclick="sure();" style="width:100px;"/>
    <input type="button" class="btn btn-default" value="取消" onclick="cancel();" style="width:100px;"/>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.date_td{font-size:12px;color:#999;text-align:center;}
.time_td{color:#7abd54;font-size:14px;text-align:center;cursor:pointer;}
.time_td.checked{background-color:#7abd54;color:#fff;}
.time_td:hover{background-color:#7abd54;color:#fff;}
</style>
<script src="/JS/Plugs/moment.js?v=1"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
    //http://momentjs.cn/docs/#/parsing/now/
    var now = moment("<%=DateTime.Now.ToString("yyyy-MM-dd")%>").lang("zh-cn");
    var dayList = [], seled = { day: 0, span: 0, txt: "" };
    dayList.push({ id: 0, name: "今天", date: now.format("M-D") });
    for (var i = 1; i <= 7; i++) {
        var day = now.add(1, "days");
        dayList.push({ id: i, name: day.format("dddd"), date: day.format("M-D") });
    }
    for (var i = 0; i < dayList.length; i++) {
        var day = dayList[i];
        $("#timespan_tr").append('<td class="date_td"><div>' + day.date + '</div><div>' + day.name + '</div></td>');
        if (i == 0)//今日不可选
        {
            $("#span1_tr").append("<td></td>");
            $("#span2_tr").append("<td></td>");
        }
        else {
            $("#span1_tr").append('<td class="time_td" data-day="' + day.id + '" data-span="1">可选</td>');
            $("#span2_tr").append('<td class="time_td" data-day="' + day.id + '" data-span="2">可选</td>');
        }
    }
    //------------------------------------
    $(function () {
        $(".time_td").click(function () {
            var $this = $(this);
            if ($this.hasClass("checked")) { return; }
            $(".time_td").removeClass("checked");
            $(".time_td").text("可选");
            $this.addClass("checked");
            $this.text("已选");
            seled.day = $this.data("day");
            seled.span = $(this).data("span");
        });
    })
    function sure() {
        if (seled.day < 1 || seled.span < 1) { alert("请先选定时间"); return; }
        //预计 1月10日[周二] 15:00-19:00 送达
        if (parent) {
            var day = dayList.GetByID(seled.day);
            seled.txt = "预计 " + day.date.replace("-", "月") + "日 [" + day.name + "]";
            switch (seled.span) {
                case 1:
                    seled.txt += " 09:00-15:00";
                    break;
                case 2:
                    seled.txt += " 15:00-19:00";
                    break;
            }
            seled.txt += " 送达";
            parent.exp.expTimeBack(seled);
            parent.closeDiag();
        }
    }
    function cancel() { parent.closeDiag(); }
</script>
</asp:Content>