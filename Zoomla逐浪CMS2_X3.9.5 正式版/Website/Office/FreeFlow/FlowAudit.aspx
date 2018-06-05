<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowAudit.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.FreeFlow.FlowAudit" MasterPageFile="~/Common/Master/UserEmpty.master"  ValidateRequest="false"%>
<%@ Register Src="~/Office/Tlp/defTlp.ascx" TagPrefix="oa" TagName="defTlp" %>
<%@ Register Src="~/Office/Tlp/send.ascx" TagPrefix="oa" TagName="send" %>
<%@ Register Src="~/Office/Tlp/rece.ascx" TagPrefix="oa" TagName="rece" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程审批</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
            <li><a href="/Office/Main.aspx">办公管理</a></li>
            <li><a href="../Flow/FlowList.aspx">流程列表</a></li>
            <li><a href="<%=Request.RawUrl %>">流程审批</a>
                 <span title="打印公文"><a href="/Office/Flow/Print.aspx?appID=<%=appID %>" target="_blank">
                    <img class="startprint" onclick="doprint()" alt="" src="/Template/V4/style/images/print-btn.png" /></a></span>
            </li>
        </ol>
<div style="margin-top:60px;">
            <asp:Panel runat="server" ID="OAForm_Div">
                <oa:send runat="server" id="ascx_send" visible="false" />
                <oa:rece runat="server" id="ascx_rece" visible="false" />
                <oa:deftlp runat="server" id="ascx_def" visible="false" />
            </asp:Panel>
            <table class="table table-bordered table-striped">
                <tr runat="server" id="formop_tr">
                    <td class="text-right">操作</td>
                    <td colspan="5">
                        <asp:Button runat="server" ID="SaveForm_Btn" Text="修改表单" OnClick="SaveForm_Btn_Click" CssClass="btn btn-primary"  Visible="false"/>
                        <button type="button" runat="server" id="ChangeUser_Btn" class="btn btn-primary" onclick="disChangeUser();" visible="false">人员管理</button>
                        <button type="button" runat="server" id="publicAttach_Manage_Btn" onclick="disPublicAttachManage();" class="btn btn-primary" visible="false">附件管理</button>
                        <input type="button" value="显示公文" onclick="TogWord();" class="btn btn-info" id="wordbtn" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <iframe src="/Plugins/Office/office.aspx?ID=<%=appID%>" class="wordifr"></iframe>
                    </td>
                </tr>
            <tr>
                <td class="text-right">发起人：</td><td><asp:Label runat="server" ID="SendMan_L"></asp:Label></td>
                <td class="text-right">当前步骤：</td><td><asp:Label runat="server" ID="stepNameL"></asp:Label></td>
                <td class="text-right">发文时间：</td><td><asp:Label runat="server" ID="createTimeL"></asp:Label></td>
            </tr>
           <tr>
               <td class="text-right"><asp:Label runat="server" ID="ReferUser_Alias" Text="主办人" />：</td>
               <td colspan="7">
                   <asp:Label runat="server" ID="ReferUser_HasHQ_L" />
                   <asp:Label runat="server" ID="ReferUser_NoHQ_L" /></td>
           </tr>
            <tr runat="server" id="CCUser_Tr">
                <td class="text-right"><asp:Label runat="server" ID="CCUser_Alias" Text="协办人" />：</td>
                <td colspan="7">
                    <asp:Label runat="server" ID="CCUser_HasHQ_L" />
                    <asp:Label runat="server" ID="CCUser_NoHQ_L" />
                </td>
            </tr>
            <tr runat="server" id="HelpUser_Tr">
                <td class="text-right"><asp:Label runat="server" ID="HelpUser_Alias" Text="辅办人" />：</td>
                <td colspan="7"><asp:Label runat="server" ID="HelpUser_L" /></td>
            </tr>
            <tbody runat="server" id="audit_body">
       <%--     <tr><td class="text-right">公文编辑器：</td><td><input type="button" onclick="ShowWord();" class="btn btn-info" value="打开公文" /></td></tr>--%>
            <tr><td class="text-right">附件：</td>
                <td runat="server" id="publicAttachTD" colspan="7">
                <div style="margin-top:10px;" id="uploader" class="uploader"><ul class="filelist"></ul></div>
                <asp:HiddenField runat="server" ID="Attach_Hid" /></td></tr>
            <tr id="signTr" runat="server" visible="false">
                <td class="text-right">签章：</td>
                <td colspan="7">
                    <asp:RadioButtonList runat="server" ID="signRadio" RepeatDirection="Horizontal"></asp:RadioButtonList>
                    <span runat="server" id="signTrRemind" visible="false">你尚未配置个人签章</span>
                </td>
            </tr>
            <tr runat="server" id="remindTr"><td class="text-right">审核意见：</td>
                <td colspan="7">
                <asp:TextBox runat="server" ID="remindT" TextMode="MultiLine" Width="500px" Height="100px" /></td></tr>
            <tr runat="server" id="Free_OP_Tr" visible="false"><td class="text-right">自由流程：</td>
                    <td colspan="7">
                    <input type="button" runat="server" id="Free_Next_Btn" value="继续流转" class="btn btn-primary" onclick="disWin();" />
                    <asp:Button runat="server" ID="Free_Sure_Btn" Text="文件归档" class="btn btn-primary opBtn" OnClick="Free_Sure_Btn_Click" OnClientClick="return sureF('确定归档文件吗!!');"/>
                    </td>
                </tr>
            <tr runat="server" id="AdminFree_OP_Tr" visible="false">
                <td class="text-right">公文流程：</td>
                <td colspan="7">
                    
                    <asp:Repeater runat="server" ID="SelRefer_RPT" EnableViewState="false">
                        <ItemTemplate>
                            <input type="button" value="<%#Eval("StepName") %>" class="btn btn-primary opBtn" onclick="disWin('<%#Eval("ID")%>');" />
                        </ItemTemplate>
                    </asp:Repeater>
                    <button runat="server" type="button" id="AF_FileView_Btn" class="btn btn-warning opBtn" onclick="disFileView();" visible="false">文件传阅</button>
                    <asp:Button runat="server" ID="AF_Sure_Btn" Text="文件归档" class="btn btn-warning opBtn" OnClick="AF_Sure_Btn_Click" OnClientClick="return sureF('确定归档文件吗!!');" Visible="false"/>
                </td>
            </tr>
            <tr runat="server" id="opBar_Tr" visible="false"><td class="text-right">操作：</td>
                <td colspan="7">
                    <div class="pull-left" runat="server" id="refer_op_wrap" visible="false">
                        <asp:Button runat="server" ID="agreeBtn"  Text="同意" CssClass="btn btn-primary opBtn" OnClick="agreeBtn_Click" OnClientClick="return sureF('请点击确认同意!!');" />
                        <asp:Button runat="server" ID="rejectBtn" Text="拒绝" CssClass="btn btn-primary opBtn" OnClick="rejectBtn_Click" OnClientClick="return sureF('请点击确认拒绝!!');" />
                    </div>
                    <div class="pull-left margin_l5" runat="server" id="rollback_touser_wrap" visible="false">
                        <asp:Button runat="server" ID="RollBackToUser_Btn" Text="退稿回发起人" class="btn btn-warning" OnClick="RollBackToUser_Btn_Click" OnClientClick="return sureF('确定要退回发起人吗?');"/>
                    </div>
                    <div runat="server" class="input-group text_300 pull-left margin_l5" id="rollback_dp_wrap" visible="false">
                        <span class="opSpan input-group-addon">回退至</span>
                        <asp:DropDownList runat="server" ID="rollBackDP" class="form-control"></asp:DropDownList>
                        <span class="input-group-btn">
                            <asp:Button runat="server" ID="rollBackBtn" Text="回退" CssClass="btn btn-warning opBtn" OnClick="rollBackBtn_Click" OnClientClick="return sureF('确定要回退吗!!');" />
                        </span>
                    </div>
                    <!--只能转交给之后的步骤-->
                    <div runat="server" class="input-group text_300 pull-left margin_l5" id="zj_wrap" visible="false">
                        <span class="input-group-addon opSpan"> 转交至</span>
                        <asp:DropDownList runat="server" ID="zjDP" class="form-control"></asp:DropDownList>
                        <span class="input-group-btn">
                             <asp:Button runat="server" ID="zjBtn" Text="转交" CssClass="btn btn-warning opBtn" OnClick="zjBtn_Click" OnClientClick="return sureF('确定要转交吗!!');"/>
                        </span>
                    </div>
                </td>
            </tr>
            <tr runat="server" id="ccOPBar" visible="false">
                <td class="text-right">操作：</td>
                <td colspan="7">
                    <asp:Button runat="server" CssClass="btn btn-primary" ID="ccUser_Btn" Text="批复" OnClick="ccUser_Btn_Click" OnClientClick="return CCUserCheck();"/>
                    <asp:Label ID="RemindInfo_L" runat="server" Text="您已经处理过该文件了！！" ForeColor="Red" Visible="false"></asp:Label>
                </td>
            </tr>
        </tbody>
        </table>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
#AllID_Chk {display:none;}
.wordifr {border:1px solid #000;width:100%;width:1px;height:1px;}
</style>
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    var diagUrl="/office/flow/diag/";
    function disWin(id) {
        ShowComDiag('FreeProNext.aspx?AppID=<%:appID%>&StepID='+id, "");
    }
    function disFileView()
    {
        ShowComDiag(diagUrl+"FileView.aspx?appid=<%:appID%>","公文传阅");
    }
    function disPublicAttachManage() {
        ShowComDiag(diagUrl+"FileAttachManage.aspx?appid=<%:appID%>", "附件管理");
    }
    function disChangeUser(){
        ShowComDiag(diagUrl+"ChangeUser.aspx?appid=<%:appID%>","人员管理");
    }
    //回复不能为空
    function CCUserCheck() {
        if (ZL_Regex.isEmpty($("#remindT").val())) { alert("审核意见不能为空!"); return false; }
    }
</script>
<script>
    function TogWord(isshow) {//true显示
        var $ifr = $(".wordifr");
        if ($ifr.width() > 2)
        { $ifr.css("width", "1px"); $ifr.css("height", "1px"); $("#wordbtn").val("显示公文"); }
        else
        { $ifr.css("width", "100%"); $ifr.css("height", "700px"); $("#wordbtn").val("隐藏公文"); }
    }
    function ShowWord() {
        <%-- ShowDiag("/Plugins/Office/office.aspx?ID=<%=appID%>", "查看正文");--%>
        var $ifr = $(".wordifr");
        $ifr.css("width", "100%"); $ifr.css("height", "700px"); $("#wordbtn").val("隐藏公文");
    }
    function sureF(s) {
        if (confirm(s)) {
            $(".opBtn").each(function () { o = this; setTimeout(function () { o.disabled = true; }, 100); });
            return true;
        }
        else {
            return false;
        }
    }
</script>
</asp:Content>