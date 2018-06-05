<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default_Result.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DBTools.Default_Result" EnableViewState="false" ValidateRequest="false" %>
<form runat="server">
<asp:GridView runat="server" ID="EGV" AutoGenerateColumns="true" class="table table-bordered table-striped">
</asp:GridView>
<div runat="server" id="remind_div" class="alert alert-danger" visible="false" style="margin:10px;"></div>
</form>
