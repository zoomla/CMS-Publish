<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMoney.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.AddMoney" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <title>添加货币</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="Server">
<asp:Label runat="server" ID="NavLabel" />
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg">货币名称</th>
            <td>
                <select name="unname" class="form-control max20rem" onchange="chgcur(this)" id="moneydescp" runat="server">
                    <option value="0" selected>- 请选择 -</option>
                    <option value='CNY'>人民币</option>
                    <option value='USD'>美元</option>
                    <option value='EUR'>欧元</option>
                    <option value='GBP'>英镑</option>
                    <option value='CAD'>加拿大元</option>
                    <option value='AUD'>澳元</option>
                    <option value='RUB'>卢布</option>
                    <option value='HKD'>港币</option>
                    <option value='TWD'>新台币</option>
                    <option value='KRW'>韩元</option>
                    <option value='SGD'>新加坡元</option>
                    <option value='NZD'>新西兰元</option>
                    <option value='JPY'>日元</option>
                    <option value='MYR'>马元</option>
                    <option value='CHF'>瑞士法郎</option>
                    <option value='SEK'>瑞典克朗</option>
                    <option value='DKK'>丹麦克朗</option>
                    <option value='PLZ'>兹罗提</option>
                    <option value='NOK'>挪威克朗</option>
                    <option value='HUF'>福林</option>
                    <option value='CSK'>捷克克朗</option>
                </select>
            </td>
            <asp:TextBox ID="TextBox1" runat="server" class="form-control max20rem" Style="display: none"></asp:TextBox>
        </tr>
        <tr>
            <th>货币代码</th>
            <td>
                <asp:Label runat="server" ID="moneycode"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>货币符号</th>
            <td>
                <asp:TextBox ID="moneysign" class="form-control max20rem" runat="server"></asp:TextBox><br />
				<small  class="text-muted">设置当前货币的显示符号，前台商品价格前会显示相应符号，比如人民币使用￥符号； </small>
            </td>
        </tr>
        <tr>
            <th>当前汇率</th>
            <td>
                <asp:TextBox ID="moneyrate" class="form-control max20rem" runat="server" Text="1" onKeyUp="value=value.replace(/[^+|.|0-9]/g,'')"></asp:TextBox><br />
				<small  class="text-muted">设置当前货币和人民币之间的汇率关系，比如当前货币为美元。假设美元对人民币为1:6.3，则此处填写汇率为“6.3”； </small>
            </td>
        </tr>
        <tr>
            <th>默认货币</th>
            <td>
                <input type="checkbox" runat="server" id="isflag_Chk" class="switchChk"  /><br />
				<small  class="text-muted">只能存在一种默认货币,其汇率用于外币结算 </small>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="Button1" class="btn btn-outline-info" runat="server" Text="保存设置" OnClick="Button1_Click" OnClientClick="return checkform();" /></td>
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
