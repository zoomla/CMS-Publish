<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayList.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.PayList" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>支付明细</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href=" <%=CustomerPageAction.customPath2 %>Main.aspx">工作台</a></li>
		<li class="breadcrumb-item"><a href="<%=CustomerPageAction.customPath2 %>Config/SiteInfo.aspx">系统设置</a></li>
        <li class="breadcrumb-item"><a href='ProductManage.aspx'>商城管理</a></li>
        <li class="breadcrumb-item"><a href='BankRollList.aspx'>明细记录</a></li>
        <li class="breadcrumb-item">支付明细 [<a runat="server" id="SwitchUrl_A">回收站</a>]</li>
        <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server">
            <span class="pull-left d-flex flex-row">
				<span class="w12rem_lg text-right pt-2">快速查找：</span>
                <asp:DropDownList ID="Addon_DR" CssClass="form-control max20rem"  OnSelectedIndexChanged="quicksouch_SelectedIndexChanged" runat="server" AutoPostBack="true">
                    <asp:ListItem Selected="True" Value="">所有在线支付记录</asp:ListItem>
                    <asp:ListItem Value="tendays">最近10天内的新记录</asp:ListItem>
                    <asp:ListItem Value="onemonth">最近一月内的新记录</asp:ListItem>
                    <asp:ListItem Value="success">未成功的在线支付记录</asp:ListItem>
                    <asp:ListItem Value="nosuccess">支付成功的在线支付记录</asp:ListItem>
                </asp:DropDownList>
            </span>
            <span class="pull-left  d-flex flex-row" style="margin-left:5px;">
                <span class="w12rem_lg text-right pt-2">高级查询：</span>
                <asp:DropDownList ID="SkeeType_DR" CssClass="form-control"  runat="server">
                    <asp:ListItem Selected="True" Value="PaymentNum">在线支付记录编号</asp:ListItem>
                    <asp:ListItem Value="UserName">用户名</asp:ListItem>
                    <asp:ListItem Value="PayTime">交易时间</asp:ListItem>
                </asp:DropDownList>
            </span>
            <div class="input-group pull-left max20rem ">
                <asp:TextBox runat="server" ID="Skey_T" class="form-control" placeholder="请输入需要搜索的内容" />
                <span class="input-group-append">
                    <asp:LinkButton runat="server" CssClass="btn btn-outline-secondary" ID="souchok" OnClick="souchok_Click"><span class="zi zi_search"></span></asp:LinkButton>
                </span>
            </div>
        </div>
    </ol>
<div id="template" runat="server" class="template container-fluid pr-0">
<div class="row sysRow table-responsive-md list_choice">
    <table class="table table-striped table-bordered table-hover">
        <tbody id="Tbody1">
            <tr class="tdbg">
                <td><asp:LinkButton ID="ID_Order" OnClick="ID_Order_Click" runat="server">ID</asp:LinkButton></td>
                <td><span>支付序号</span></td>
                <td><span>用户名</span></td>
                <td><span>支付平台</span></td>
                <td><asp:LinkButton ID="PayTime_Order" OnClick="PayTime_Order_Click" runat="server" >交易时间</asp:LinkButton></td>
                <td><asp:LinkButton ID="MoneyPay_Order" OnClick="MoneyPay_Order_Click" runat="server">汇款金额</asp:LinkButton></td>
                <td><asp:LinkButton ID="MoneyTrue_Order" OnClick="MoneyTrue_Order_Click" runat="server">实际转帐金额</asp:LinkButton></td>
                <td><span>交易状态</span></td>
                <td><span>操作</span></td>
            </tr>
            <ZL:ExRepeater ID="RPT" runat="server" BoxType="dp" OnItemCommand="RPT_ItemCommand" PageSize="20" PagePre="<tr><td colspan='12'><div class='text-center'>" PageEnd="</div></td></tr>">
                <ItemTemplate>
                    <tr ondblclick="location.href='../Pay/DepostDetail.aspx?ztype=pay&ID=<%#Eval("PaymentID") %>';">
                        <td><%#Eval("PaymentID") %></td>
                        <td><%#Eval("PayNo") %></td>
                        <td><a href="?uname=<%#getusername(Eval("UserID","{0}"))%>"><%#getusername(Eval("UserID","{0}"))%></a></td>
                        <td><%#getPayPlat(Eval("PayPlatID","{0}"))%></td>
                        <td><%#Eval("PayTime")%></td>
                        <td><%#Eval("MoneyPay","{0:f}") %></td>
                        <td><%#Eval("MoneyTrue","{0:f}") %></td>
                        <td><%# GetStatus(Eval("Status","{0}"))%></td>
                        <td>
                            <asp:LinkButton runat="server" CommandName="Del" OnClientClick="return confirm('是否确定删除?')" CommandArgument='<%#Eval("PaymentID") %>' ><i class="zi zi_trashalt <%=Status != -99 ? "" : "hidden" %>" title="删除"></i></asp:LinkButton>
                            <asp:LinkButton runat="server"  CommandName="RecDel" OnClientClick="return confirm('回收站数据删除不可恢复，确定要删除吗?')" CommandArgument='<%#Eval("PaymentID") %>'><i class="zi zi_trashalt <%=Status == -99 ? "" : "hidden" %>" title="删除"></i></asp:LinkButton>
                            <asp:LinkButton runat="server"  CommandName="Rec" OnClientClick="return confirm('确定恢复这条数据吗?')" CommandArgument='<%#Eval("PaymentID") %>'><i class="zi zi_recycle <%=Status == -99 ? "" : "hidden" %>" title="恢复"></i></asp:LinkButton>
                            <a href="../Pay/DepostDetail.aspx?ztype=pay&ID=<%#Eval("PaymentID") %>"><i class="zi zi_eye" title="浏览"></i>浏览</a>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    <div class="clearfix"></div>
                </FooterTemplate>
            </ZL:ExRepeater>
        </tbody>
    </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function CheckAll(spanChk)//CheckBox全选
        {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++)
                if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                    if (elm[i].checked != xState)
                        elm[i].click();
                }
        }
        $("#sel_btn").click(function (e) {
            if ($("#sel_box").css("display") == "none") {
                $(this).addClass("active");
                $("#sel_box").slideDown(300);
                $(".template").css("margin-top", "44px");
            }
            else {
                $(this).removeClass("active");
                $("#sel_box").slideUp(200);
                $(".template").css("margin-top", "5px");
            }
        });
    </script>
</asp:Content>
