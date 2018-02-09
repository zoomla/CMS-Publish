<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.DepositManage" MasterPageFile="~/Manage/I/Default.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>出金管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb navbar-fixed-top">
        <li><a href='../Main.aspx'>工作台</a></li>
        <li><a href='UserManage.aspx'>用户管理</a></li>
        <li class="active">用户出金 <a href="Addon/UserBankManage.aspx">[用户银行管理]</a></li>
        <div id="help" class="pull-right text-center" style="margin-right: 8px;"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
        <div id="sel_box" runat="server" class="padding5">
            <div class="input-group pull-left" style="width: 300px;">
                <asp:TextBox runat="server" ID="Search_T" class="form-control" placeholder="请输入用户名" />
                <span class="input-group-btn">
                    <asp:Button ID="Search_B" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="Search_Btn_Click" />
                </span>
            </div>
        </div>
    </ol>
    <div class="clearfix"></div>
    <ul class="nav nav-tabs" role="tablist">
        <li role="presentation" data-type="-2"><a href="?state=-2">全部</a></li>
        <li role="presentation" data-type="0"><a href="?state=0">未处理</a></li>
        <li role="presentation" data-type="99"><a href="?state=99">已确认</a></li>
        <li role="presentation" data-type="-1"><a href="?state=-1">已拒绝</a></li>
    </ul>
    <div id="tab_div">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td class="td_xs"></td>
                <td>ID</td>
                <td>用户名</td>
                <td>用户组</td>
                <td>出金金额</td>
                <td>手续费</td>
                <td>申请时间</td>
                <td>出金状态</td>
                <td>帐户信息</td>
                <td>开户银行</td>
                <td>管理员备注</td>
                <td>操作</td>
            </tr>
            <ZL:ExRepeater ID="Deposit_RPT" runat="server" PageSize="10" PagePre="<tr id='page_tr'><td><input type='checkbox' id='chkAll'/></td><td colspan='11' id='page_td'>" PageEnd="</td></tr>">
                <ItemTemplate>
                    <tr>
                        <td>
                            <input type="checkbox" name="idchk" value="<%#Eval("Y_ID") %>" /></td>
                        <td><%#Eval("Y_ID") %></td>
                        <td><a href="javascript:;" onclick="ShowUserDiag(<%#Eval("UserID") %>)" title="<%#Eval("YName") %>"><%#Eval("YName") %> | <%#Eval("HoneyName") %> | <%#Eval("UserID") %></a><input type="hidden" name="uname_hid" value="<%#Eval("YName") %>" /></td>
                        <td><%#Eval("GroupName") %></td>
                        <td><%#Eval("money","{0:f2}") %><input type="hidden" name="price_hid" value="<%#Eval("money") %>" /></td>
                        <td><%#Eval("WithdrawFee","{0:f2}") %></td>
                        <td><%#Eval("STime","{0:yyyy年MM月dd日 HH:mm}") %></td>
                        <td><%#GetStatus() %></td>
                        <td class="text_300">
                            <div>开户人：<%#Eval("PeopleName") %></div>
                            <div>银行：<%#Eval("Bank") %></div>
                            <div>卡号：<%#Eval("Account") %></div>
                        </td>
                        <td><%#Eval("Remark") %></td>
                        <td><%#Eval("Result") %></td>
                        <td>
                            <%#ShowOP() %>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </ZL:ExRepeater>
        </table>
    </div>
    <asp:Button ID="CheckDepos_B" CssClass="btn btn-primary" runat="server" OnClick="CheckDepos_B_Click" OnClientClick="return confirm('要确认选定出金吗?');" Text="批量确认" />
    <button type="button" class="btn btn-primary" onclick="OutToExcel();">导出Excel</button>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Label/ZLHelper.js"></script>
    <script>
        $().ready(function () {
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "idchk");
            });
        });
        //默认滑动门
        function checkState(state) {
            $("[data-type]").removeClass('active');
            $("[data-type='" + state + "']").addClass('active');
        }
        var userDiag = new ZL_Dialog();
        userDiag.maxbtn = false;
        function ShowUserDiag(uid) {
            userDiag.title = "用户信息";
            userDiag.url = "Userinfo.aspx?id=" + uid;
            userDiag.ShowModal();
        }
        var diag = new ZL_Dialog();
        function cashAudit(id, action) {
            diag.url = "DepositAudit.aspx?id=" + id + "&action=" + action;
            diag.title = "";
            diag.maxbtn = false;
            diag.reload = true;
            diag.backdrop = true;
            diag.ShowModal();
        }
        function OutToExcel() {
            var $html = $(document.getElementById("tab_div").outerHTML);
            $html.find("td").css("border", "1px solid #666");
            $html.find("tr").find("td:first").remove();
            $html.find("#page_tr").remove();
            $html.find("tr:last").remove();
            ZLHelper.OutToExcel($html.html(), '<%=DateTime.Now.ToString("yyyyMMdd")%>用户提现');
        }
    </script>
    <script runat="server">
        public string ShowOP()
        {
            string opstr = "";
            if (Convert.ToInt32(Eval("YState")) == (int)ZoomLa.Model.ZLEnum.WDState.WaitDeal)
            {
                opstr += "<a href='javascript:;' onclick='cashAudit(" + Eval("Y_ID") + ",\"dealed\")' class='btn btn-info btn-sm' style='margin-right:5px;'>确认</a>";
                opstr += "<a href='javascript:;' onclick='cashAudit(" + Eval("Y_ID") + ",\"rejected\")' class='btn btn-danger btn-sm'>拒绝</a>";
            }
            else
            {
                opstr += "<a href='javascript:;' onclick='cashAudit(" + Eval("Y_ID") + ",\"view\")' class='btn btn-info btn-sm'>查看</a>";
            }
            return opstr;
        }
    </script>
</asp:Content>
