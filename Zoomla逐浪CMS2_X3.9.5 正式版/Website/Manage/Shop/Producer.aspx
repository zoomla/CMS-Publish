<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producer.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Producer" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master"%>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>添加厂商</title>
<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("ProductManage.aspx","商城管理"),
	new Bread("ProducerManage.aspx","厂商管理 "),
	new Bread(){url="", text="添加厂商"}
	}) %>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
  <table class="table table-striped table-bordered table-hover sys_table">
    <tr align="center">
    </tr>
    <tr>
      <th class="w12rem_lg">厂商名称  <span class="text-danger">*</span></th>
      <td><ZL:TextBox ID="Producername" runat="server" AllowEmpty="false" class="form-control max20rem"  />
       </td>
    </tr>
    <tr>
      <th scope="col">厂商缩写</th>
      <td><asp:TextBox ID="Smallname" runat="server" class="form-control max20rem" ></asp:TextBox></td>
    </tr>
    <tr>
      <th scope="col">创建日期</th>
      <td><asp:TextBox ID="CreateTime" runat="server" class="form-control max20rem" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox></td>
    </tr>
    <tr>
      <th scope="col">公司地址  <span class="text-danger">*</span></th>
      <td><ZL:TextBox ID="Coadd" runat="server" AllowEmpty="false" class="form-control max20rem" ></ZL:TextBox>
		</td>
    </tr>
    <tr>
      <th scope="col">联系电话  <span class="text-danger">*</span></th>
      <td><ZL:TextBox ID="Telpho" runat="server" ValidType="PhoneNumber" AllowEmpty="false" class="form-control max20rem"></ZL:TextBox>
      </td>
    </tr>
    <tr>
      <th scope="col">传真号码</th>
      <td><ZL:TextBox ID="FaxCode" runat="server" class="form-control max20rem"></ZL:TextBox></td>
    </tr>
    <tr>
      <th scope="col">邮政编码</th>
      <td><asp:TextBox ID="PostCode" runat="server" class="form-control max20rem"></asp:TextBox></td>
    </tr>
    <tr>
      <th scope="col">厂商主页</th>
      <td><asp:TextBox ID="CoWebsite" runat="server" class="form-control max20rem" ></asp:TextBox></td>
    </tr>
    <tr>
      <th scope="col">电子邮件</th>
      <td><ZL:TextBox ID="Email" runat="server" ValidType="Mail" class="form-control max20rem"></ZL:TextBox></td>
    </tr>
    <tr>
      <th scope="col">厂商分类</th>
      <td><asp:RadioButtonList ID="CoClass" runat="server" RepeatDirection="Horizontal"  Width="420px">
          <asp:ListItem Selected="True">大陆厂商</asp:ListItem>
          <asp:ListItem>港台厂商</asp:ListItem>
          <asp:ListItem>日韩厂商</asp:ListItem>
          <asp:ListItem>欧美厂商</asp:ListItem>
          <asp:ListItem>其他厂商</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
    <tr>
      <th scope="col">厂商照片</th>
      <td>
          <ZL:SFileUp ID="SFile_Up" runat="server" FType="Img" MaxWidth="500" MaxHeight="500" />
      </td>
    </tr>
    <tr class="WebPart">
      <th scope="col">厂商简介</th>
      <td>
        <textarea id="Content" name="Content" runat="server" style="width:80%;height:300px;"></textarea>
        <%=Call.GetUEditor("Content",2) %></td>
    </tr>
    <tr><td></td>
      <td>
          <asp:Button ID="Button1" runat="server" class="btn btn-info"  Text="保存设置" OnClick="Button1_Click"/>
          <a href="ProducerManage.aspx" class="btn btn-outline-info">返回列表</a>
      </td>
    </tr>
  </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>