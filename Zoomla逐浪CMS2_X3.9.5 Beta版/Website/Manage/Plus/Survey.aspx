<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.Survey" MasterPageFile="~/Manage/I/Default.master" ValidateRequest="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<title>编辑问卷投票</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="tdleft td_l"><strong>问卷投票名称：</strong></td>
            <td>
                <ZL:TextBox ID="Title_T" class="form-control text_300" runat="server" MaxLength="80" ToolTip="标题最大长度为80个字符" AllowEmpty="false" />
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>类型：</strong></td>
            <td>
                <asp:RadioButtonList ID="ZType_Rad" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">投票</asp:ListItem>
                    <asp:ListItem Value="2">问卷</asp:ListItem>
                    <asp:ListItem Value="3" Selected="True">报名系统</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>起止时间：</strong></td>
            <td>
                <ZL:TextBox AllowEmpty="false" ID="StartDate" class="form-control text_300" runat="server" onfocus="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss'});"></ZL:TextBox>
                -- 
                <ZL:TextBox AllowEmpty="false" ID="EndDate" class="form-control text_300" runat="server" onfocus="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss'});"></ZL:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>IP投票间隔：</strong></td>
            <td>
                <div style="width:480px;" class="input-group">
                    <asp:TextBox ID="IPInterval_T" class="form-control text_300" runat="server" Text="0" />
                    <span class="input-group-addon">秒</span>
                    <span class="input-group-btn timesp">
                        <button type="button" class="btn btn-default" data-inter="86400">1天</button>
                        <button type="button" class="btn btn-default" data-inter="3600">1小时</button>
                        <button type="button" class="btn btn-default" data-inter="600">10分钟</button>
                    </span>
                </div>
                <span class="rd_green">同一IP需要隔多长时间才可再投票,0则不限制</span>
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>IP最大可提交次数：</strong></td>
            <td>
                <div class="text_300 input-group">
                    <asp:TextBox ID="IsIPLimit" class="form-control text_300" runat="server" Text="1" />
                    <span class="input-group-addon">次</span>
                </div>   
                <span class="rd_green">每日同一IP可提交的次数,0则不限制</span></td>
        </tr>
        <tr>
            <td class="tdleft"><strong>是否需登录：</strong></td>
            <td>
                <input runat="server" type="checkbox" id="IsNeedLogin" class="switchChk" />
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>是否启用：</strong></td>
            <td>
                 <input runat="server" type="checkbox" id="ZStatus" class="switchChk" />
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>是否启用验证码：</strong></td>
            <td>
                <input runat="server" type="checkbox" id="IsEnableVCode" class="switchChk" />
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>是否启用结果前台预览：</strong></td>
            <td>
                <input runat="server" type="checkbox" id="IsShowResult" class="switchChk" />
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>简介：</strong></td>
            <td>
                <asp:TextBox ID="Remind" runat="server" TextMode="MultiLine" Width="90%" Height="200px" />
                <%=Call.GetUEditor("Remind",2) %>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="EBtnSubmit" Text="保存信息" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
                <a href="SurveyManage.aspx" class="btn btn-default">返回列表</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script>
    $(function () {
        $(".timesp .btn").click(function () {
            var inter = $(this).data("inter");
            $("#IPInterval_T").val(inter);
        });
    })
</script>
</asp:Content>
