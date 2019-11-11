<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="ZoomLaCMS.Tools.Cache.About" MasterPageFile="~/Manage/I/Index.Master" %>
<%@ Import Namespace="ZoomLa.BLL" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>信息概览</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr>
        <td style="width: 200px;">标签缓存数</td>
        <td><%:LabelCache.Labelht.Count.ToString() %></td>
    </tr>
    <tr>
        <td>当前进程ID</td>
        <td><%:System.Diagnostics.Process.GetCurrentProcess().Id %></td></tr>
  <%--  <tr>
        <td>当前线程ID</td>
        <td><%:System.Threading.Thread.CurrentThread.ManagedThreadId.ToString()  %></td>
    </tr>--%>
    <tr>
        <td>标签方法数量</td>
        <td>
            <%foreach (var item in B_CreateHtml.DG_WorkList)
                {%>
            <div style="border-bottom:3px solid #000;margin-bottom:5px;"><span><%=item.Key %>：</span><span><%=item.Value %></span></div>
            <%} %>
        </td>
    </tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="GC_Btn" Text="手动GC" OnClick="GC_Btn_Click" />

                 </td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>