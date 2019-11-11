<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMoney.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.AddMoney" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title><%=Resources.L.添加货币 %></title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
<asp:Label runat="server" ID="NavLabel" />
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg"><%=Resources.L.货币名称 %></th>
            <td>
                <select name="unname" class="form-control max20rem" onchange="chgcur(this)" id="moneydescp" runat="server">
                    <option value="0" selected Text="<%$Resources:L,请选择 %>"></option>
                    <option value='CNY' Text="<%$Resources:L,人民币 %>"></option>
                    <option value='USD' Text="<%$Resources:L,美元 %>"></option>
                    <option value='EUR' Text="<%$Resources:L,欧元 %>"></option>
                    <option value='GBP' Text="<%$Resources:L,英镑 %>"></option>
                    <option value='CAD' Text="<%$Resources:L,加拿大元 %>"></option>
                    <option value='AUD' Text="<%$Resources:L,澳元 %>"></option>
                    <option value='RUB' Text="<%$Resources:L,卢布 %>"></option>
                    <option value='HKD' Text="<%$Resources:L,港币 %>"></option>
                    <option value='TWD' Text="<%$Resources:L,新台币 %>"></option>
                    <option value='KRW' Text="<%$Resources:L,韩元 %>"></option>
                    <option value='SGD' Text="<%$Resources:L,新加坡元 %>"></option>
                    <option value='NZD' Text="<%$Resources:L,新西兰元 %>"></option>
                    <option value='JPY' Text="<%$Resources:L,日元 %>"></option>
                    <option value='MYR' Text="<%$Resources:L,马元 %>"></option>
                    <option value='CHF' Text="<%$Resources:L,瑞士法郎 %>"></option>
                    <option value='SEK' Text="<%$Resources:L,瑞典克朗 %>"></option>
                    <option value='DKK' Text="<%$Resources:L,丹麦克朗 %>"></option>
                    <option value='PLZ' Text="<%$Resources:L,兹罗提 %>"></option>
                    <option value='NOK' Text="<%$Resources:L,挪威克朗 %>"></option>
                    <option value='HUF' Text="<%$Resources:L,福林 %>"></option>
                    <option value='CSK' Text="<%$Resources:L,捷克克朗 %>"></option>
                </select>
            </td>
            <asp:TextBox ID="TextBox1" runat="server" class="form-control max20rem" Style="display: none"></asp:TextBox>
        </tr>
        <tr>
            <th><%=Resources.L.货币代码 %></th>
            <td>
                <asp:Label runat="server" ID="moneycode"></asp:Label>
            </td>
        </tr>
        <tr>
            <th><%=Resources.L.货币符号 %></th>
            <td>
                <asp:TextBox ID="moneysign" class="form-control max20rem" runat="server"></asp:TextBox><br />
				<small  class="text-muted"><%=Resources.L.货币符号_notice %></small>
            </td>
        </tr>
        <tr>
            <th><%=Resources.L.当前汇率 %></th>
            <td>
                <asp:TextBox ID="moneyrate" class="form-control max20rem" runat="server" Text="1" onKeyUp="value=value.replace(/[^+|.|0-9]/g,'')"></asp:TextBox><br />
				<small  class="text-muted"><%=Resources.L.当前汇率_notice %></small>
            </td>
        </tr>
        <tr>
            <th><%=Resources.L.默认货币 %></th>
            <td>
                <input type="checkbox" runat="server" id="isflag_Chk" class="switchChk"  /><br />
				<small  class="text-muted"><%=Resources.L.默认货币_notice %></small>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="Button1" class="btn btn-outline-info" runat="server" Text="<%$Resources:L,保存设置 %>" OnClick="Button1_Click" OnClientClick="return checkform();" /></td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script>
        function chgcur(cur) {
            $("#moneycode").text($(cur).val());
        }
        function checkform() {
            if ((document.getElementById("moneydescp").value == "0") || (document.getElementById("moneyrate").value * 1 <= 0)) {
                if (document.getElementById("moneydescp").value == "0") {
                    alert("请选择货币名称！");

                    return false;
                }
                if (document.getElementById("moneyrate").value * 1 <= 0) {
                    alert("请输入当前汇率！");
                    document.getElementById("moneyrate").focus();
                    return false;
                }
            } else {
                return true;
            }
        }
    </script>
</asp:Content>
