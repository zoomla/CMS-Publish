<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddComp.aspx.cs" Inherits="ZoomLaCMS.Manage.Plat.AddComp" MasterPageFile="~/Manage/I/Index.master" %>

<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagName="SFile" TagPrefix="ZL" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>公司管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Plat/PlatInfoManage.aspx","能力中心"),
        new Bread("PlatInfoManage.aspx","信息管理"),
        new Bread() {url="", text="添加公司",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-bordered sys_table">
        <tr>
            <th scope="col" class="w12rem_lg">公司简称</th>
            <td scope="col">
                <asp:TextBox runat="server" ID="CompShort_T" CssClass="form-control max20rem"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th scope="col">公司名称</th>
            <td scope="col">
                <asp:TextBox ID="CompName_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>Logo</th>
            <td>
                <ZL:SFile FType="Img" ID="Logo_SFile" runat="server" />
            </td>
        </tr>
        <tr>
            <th>创建人</th>
            <td>
			<div class="input-group ">
			  <div class="input-group"><asp:TextBox CssClass="form-control max20rem" runat="server" ID="CUser_T"></asp:TextBox>
			  <div id="port_btns" class="input-group-append">
			  <input type="button" class="btn btn-outline-info" value="选择用户" onclick="SelUser();" />
		  	  </div>
		    </div>
            </td>
        </tr>
        <tr>
            <th>企业邮箱</th>
            <td>
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
					<span class="input-group-text" id="basic-addon1">@</span>
				  </div>
				  <ZL:TextBox runat="server" ID="EMail_T" ValidExpressionCustom="[a-z0-9]+\.[a-z0-9]+(?:\.[a-z0-9]+)?$" ValidError="邮箱后缀有误"  CssClass="form-control max20rem" />
                    <asp:RegularExpressionValidator ID="Validator" runat="Server" ControlToValidate="EMail_T" ValidationExpression="[a-z0-9]+\.[a-z0-9]+(?:\.[a-z0-9]+)?$" ForeColor="red" ValidationGroup="compVaid" ErrorMessage="邮箱后缀格式不正确" Display="Dynamic" />
				</div>
            </td>
        </tr>
        <tr>
            <th>联系电话</th>
            <td>
                <ZL:TextBox runat="server" ID="Telephone_T" CssClass="form-control max20rem" ValidationGroup="compVaid" ValidType="PhoneNumber"></ZL:TextBox></td>
        </tr>
        <tr>
            <th>联系手机</th>
            <td>
                <ZL:TextBox runat="server" ID="Mobile_T" CssClass="form-control max20rem" ValidationGroup="compVaid" ValidType="MobileNumber"></ZL:TextBox></td>
        </tr>
        <tr>
            <th>公司网址</th>
            <td>
                <asp:TextBox runat="server" ID="CompHref_T" CssClass="form-control max20rem"></asp:TextBox></td>
        </tr>
        <tr>
            <th>公司详情</th>
            <td>
                <asp:TextBox runat="server" ID="CompDesc_T" CssClass="form-control max20rem" TextMode="MultiLine" Height="120"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>创建时间</th>
            <td>
                <asp:TextBox runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" ID="CDate_T" CssClass="form-control max20rem"></asp:TextBox>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <asp:Button ID="Save_Btn" runat="server" ValidationGroup="compVaid" CssClass="btn btn-info" OnClick="Save_Btn_Click" Text="保存" />
                <a href="CompList.aspx" class="btn btn-outline-info">返回</a></td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        var TemDiag = new ZL_Dialog();
        function SelUser() {
            TemDiag.title = "选择用户";
            TemDiag.maxbtn = false;
            TemDiag.url = "/Common/Dialog/SelGroup.aspx";
            TemDiag.ShowModal();
        }
        function UserFunc(list, select) {
            //var users = "";
            //$.each(list, function (i, val) {
            //    users += val.UserName + ",";
            //});
            $("#CUser_T").val(list[0].UserName);
            TemDiag.CloseModal()
        }
    </script>
</asp:Content>
