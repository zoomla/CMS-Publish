<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileUpload.aspx.cs" Inherits="ZoomLaCMS.Common.FileUpload" MasterPageFile="~/Common/Common.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>文件上传</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"> 
<div class="input-group up2018">
<div class="custom-file">
  <div class="custom-file-label">
    <ZL:FileUpload ID="FupFile" runat="server" class=""  />
	</div>
	</div>
    <div class="input-group-append">
        <asp:Button ID="BtnUpload" runat="server" Text="上传" class="btn btn-info" OnClick="BtnUpload_Click" />
    </div>
</div>
<small class="text-muted">
<asp:RequiredFieldValidator ID="ValFile" runat="server" ErrorMessage="请选择上传路径" ForeColor="Red" ControlToValidate="FupFile" Display="Dynamic" />
<asp:Label ID="LblMessage" runat="server" ForeColor="red"></asp:Label>
<asp:HiddenField ID="HiddenNodeDir" runat="server" />
</small>
</asp:Content> 