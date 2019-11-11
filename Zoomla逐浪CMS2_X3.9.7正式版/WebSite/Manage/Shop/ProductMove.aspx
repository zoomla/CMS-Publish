<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductMove.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ProductMove" MasterPageFile="~/Manage/I/Default.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>内容批量移动</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread() {url="ProductManage.aspx", text="商品管理",addon="" },
 new Bread() {url=Request.RawUrl, text="商品移动"}}
       
		)
    %>
    <table class="table table-striped table-bordered sys_table">
	    <tr align="center">
            <td colspan="2" class="spacingtitle">移动商品到其他节点</td>
        </tr>
        <tr>
		<th scope="row" class="w12rem_lg">商品ID</th>
            <td>
                <asp:TextBox ID="TxtContentID" class="form-control" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtContentID"
                    ErrorMessage="商品ID不能为空" /></td>
         </tr>
         <tr>
		 		<th scope="row">目标节点</th>
            <td>
              <select id="node_dp" name="node_dp" class="form-control max_width1100">
                    <asp:Literal runat="server" ID="Node_Lit"></asp:Literal>
              </select>
            </td>
         </tr>
         <tr>
             <td></td>
            <td>                    
                <asp:Button ID="Button1" class="btn btn-outline-info" runat="server" Text="批量处理" OnClick="Button1_Click" />
                <input name="Cancel" type="button" class="btn btn-outline-info" id="BtnCancel" value="取消" onclick="location.href = 'ProductManage.aspx'" />
            </td>            
         </tr>
	</table>
</asp:Content>