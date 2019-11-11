<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayWeiXin.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.PayWeiXin"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>微信支付</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/WeiXin/Home.aspx","移动微信"),				
        new Bread() {url="", text="PC端微信支付",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
     <table class="table table-striped table-bordered table-hover sys_table">
         <tr>
             <th scope="col" class="w12rem_lg">APPID</th>
             <td scope="col">
                 <asp:TextBox ID="AppID_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                        ControlToValidate="AppID_T" ErrorMessage="AppID不能为空" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
             </td>
         </tr>
         <tr>
             <th>Secret</th>
             <td>
                 <asp:TextBox ID="Secret_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="Secret_T" ErrorMessage="Secret不能为空" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
             </td>
         </tr>
         <tr>
             <th>商户号</th>
             <td>
                 <asp:TextBox ID="MchID_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                 <asp:RegularExpressionValidator ValidationExpression="\d+" ID="RequiredFieldValidator5" runat="server" ControlToValidate="MchID_T" SetFocusOnError="true" ErrorMessage="商户号必须为数字"
                        ForeColor="Red" Display="Dynamic"></asp:RegularExpressionValidator>
             </td>
         </tr>
         <tr>
             <th>商户密钥</th>
             <td>
                 <asp:TextBox ID="Key_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="Key_T" ErrorMessage="Key不能为空" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
             </td>
         </tr>
         <%--<tr>
             <th>证书路径</th>
             <td>
                 <asp:TextBox ID="Cert_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                 <span style="color:green;">*高级功能需要填写证书路径</span>
             </td>
         </tr>
         <tr>
             <th>证书密码</th>
             <td>
                 <asp:TextBox ID="CertPWD_T" runat="server" TextMode="Password" CssClass="form-control max20rem"></asp:TextBox>
                 <span style="color:green;">*高级功能需要填写证书密码</span>
             </td>
         </tr>--%>
         <tr><td></td><td>
                <asp:Button ID="Save_B" CssClass="btn btn-info" OnClick="Save_B_Click" runat="server" Text="保存"></asp:Button>
                <button type="button" onclick="ReClear()" class="btn btn-outline-info">重置</button>
             </td>
         </tr>
     </table>
	 </div></div>
    <script>
        function ReClear() {
            $('.max20rem').val('');
        }
    </script>
</asp:Content>

