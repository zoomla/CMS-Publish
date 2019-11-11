<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepositManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.DepositManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>出金管理</title>
<style type="text/css">
.qrcode_img{width:300px;height:300px;position:absolute;display:none;
            background-color:#fff;padding:5px;border:1px solid #ddd;
            border-radius:5px;box-shadow: rgba(0, 0, 0, 0.0980392) 0px 2px 5px 0px, rgba(0, 0, 0, 0.0784314) 0px 2px 10px 0px;
}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href='../Main.aspx'>工作台</a></li>
        <li class="breadcrumb-item"><a href='UserManage.aspx'>用户管理</a></li>
        <li class="breadcrumb-item">用户出金 <a href="Addon/UserBankManage.aspx"> [用户银行管理]</a></li>
        <div id="help" class="pull-right text-center pr-2"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server">
			<div class="input-group  pull-left mb-3 max20rem">
			  <asp:TextBox runat="server" ID="Search_T" class="form-control" placeholder="请输入用户名" />
			  <div class="input-group-append">
				<asp:Button ID="Search_B" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="Search_Btn_Click" />
			  </div>
			</div>
        </div>
    </ol>
    <div class="clearfix"></div>
    <ul class="nav nav-tabs list_choice" role="tablist">
        <li class="nav-item" role="presentation" data-type="-2"><a class="nav-link" href="?state=-2">全部</a></li>
        <li class="nav-item" role="presentation" data-type="0"><a class="nav-link" href="?state=0">未处理</a></li>
        <li class="nav-item" role="presentation" data-type="99"><a class="nav-link" href="?state=99">已确认</a></li>
        <li class="nav-item" role="presentation" data-type="-1"><a class="nav-link" href="?state=-1">已拒绝</a></li>
    </ul>
    <div id="tab_div" class="container-fluid pr-0">
	<div class="row sysRow table-responsive-md">
        <table class="table table-striped table-bordered sys_table">
            <tr>
                <th></th>
                <th scope="col">ID</th>
                <th scope="col">用户名</th>
                <th scope="col">用户组</th>
                <th scope="col">出金金额</th>
                <th scope="col">手续费</th>
                <th scope="col">申请时间</th>
                <th scope="col">出金状态</th>
                <th scope="col">帐户信息</th>
<%--                <th scope="col">开户银行</th>--%>
                <th scope="col">管理员备注</th>
                <th scope="col">操作</th>
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
                        <td>
                            <asp:Panel runat="server" Visible='<%#IsBank()%>'>
                                <div>银行：<%#Eval("Bank") %></div>
                                <div>卡号：<%#Eval("Account") %></div>
                                <div>开户人：<%#Eval("PeopleName") %></div>
                            </asp:Panel>
                            <asp:Panel runat="server" Visible="<%#!IsBank() %>">
                                <div>类型：<%#Eval("CardType") %></div>
                                <div>账号：<%#Eval("Account") %></div>
                                <div>姓名：<%#Eval("PeopleName") %></div>
                                <div class="qrcode_wrap" style="position:relative;">
                                    收款码：<a href="javascript:;" onclick="qrcode.toggle(this);">点击显示收款码</a>
                                    <img class="qrcode_img" onerror="shownopic(this);" src="<%#Eval("QRCode") %>"/>
                                </div>
                 
                            </asp:Panel>
                        </td>
                  <%--      <td><%#Eval("Remark") %></td>--%>
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
    </div>
    <div class="sysBtline">
        <asp:Button ID="CheckDepos_B" CssClass="btn btn-info" runat="server" OnClick="CheckDepos_B_Click" OnClientClick="return confirm('要确认选定出金吗?');" Text="批量确认" />
        <button type="button" class="btn btn-outline-info" onclick="OutToExcel();">导出Excel</button>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Label/ZLHelper.js"></script>
<script>
        $().ready(function () {
            $("#chkAll").click(function () {//EGV 全选
                selectAllByName(this, "idchk");
            });
        });
        //默认滑动门
        function checkState(state) {
            $("[data-type]").find("a").removeClass('active');
            $("[data-type='" + state + "']").find("a").addClass('active');
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
        var qrcode = {};
        qrcode.toggle = function (btn) {
            var $wrap = $(btn).closest(".qrcode_wrap");
            var $img = $wrap.find("img");
            if ($img.is(":visible")) {
                $img.hide();
                $(btn).text("点击显示收款码");
            }
            else {
                $(".qrcode_img").hide();
                $img.show();
                $(btn).text("点击隐藏收款码");
            }
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
        //是否为普通银行
        public bool IsBank()
        {
            string cardType = Eval("CardType","");
            if (string.IsNullOrEmpty(cardType) || cardType.Equals("银行卡"))
            {
                return true;
            }
            else { return false;}
        }
    </script>
</asp:Content>
