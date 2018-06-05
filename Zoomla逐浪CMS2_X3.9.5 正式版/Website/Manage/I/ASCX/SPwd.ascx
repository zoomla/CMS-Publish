<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SPwd.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.SPwd" %>
<div>
<link rel="stylesheet" href="/dist/css/animate.min.css">
<%--<style>
background: rgba(0, 114, 188, 0.02);
</style>--%>
<div class="pop_box card"  id="spwd_div" runat="server" visible="false">
    <div class="card-body SPwd_box animated bounceInUp">
        <asp:TextBox runat="server" autocomplete="off" TextMode="Password" ID="SPwd_T" placeholder="二级密码验证" CssClass="form-control" onkeydown="spwd_enter();" />
        <i class="zi zi_lock" aria-hidden="true"></i>
        <asp:RequiredFieldValidator runat="server" ID="v1" ControlToValidate="SPwd_T" ValidationGroup="spwd" ForeColor="Red" Display="Dynamic" ErrorMessage="不能为空" />
    </div>
    <asp:Button runat="server" ID="Sure_Btn" Text="确定" OnClick="Sure_Btn_Click" ValidationGroup="spwd" Style="display: none;" />
</div>
</div>
<div class="pop_box card" style="width: 350px;margin:auto;" runat="server" id="nospwd_div" visible="false">
 <div class="card-header">二级密码验证</div>
    <div class="card-body" style="text-align:center;">
        请输入二级验证码(相关帮助可检索官方文档）<br />
        <a href="http://www.z01.com/search/SearchList?keyword=%E4%BA%8C%E7%BA%A7%E9%AA%8C%E8%AF%81%E7%A0%81&ButtonSo=%E6%90%9C++%E7%B4%A2" class="btn btn-primary" title="点击前往" target="_blank">点击前往</a>
    </div>
</div>
<script>
    function spwd_enter(e) {
        var keyCode = 0;
        if (event) { keyCode = event.keyCode; }
        else { keyCode = e.keyCode; }
        if (keyCode == 13) {
			console.log("1");
            $("#Sure_Btn").click(); return false;
        }
        return true;
    }

</script>