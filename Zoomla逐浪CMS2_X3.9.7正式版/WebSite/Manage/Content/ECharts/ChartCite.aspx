<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChartCite.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.ECharts.ChartCite"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>图表引用</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","智慧图表"),
        new Bread() {url=Request.RawUrl, text="图表引用",addon="" }}
		)
    %>
     <div class="card list_choice">
          <div class="card-header container-fluid pr-0"><span>图表引用</span></div>
          <div class="card-body row table-responsive-md">
              <table class="table table-bordered table-striped sys_table">
                  <tr><th scope="col" class="w12rem_lg">图表名</th><td scope="col"><asp:Label runat="server" ID="TName_L"></asp:Label></td></tr>
                  <tr><th scope="col">类型</th><td scope="col"><asp:Label runat="server" ID="SType_L"></asp:Label></td></tr>
                  <tr>
                  <th scope="col">引用</th>
                  <td scope="col" style="position:relative;">
				  <asp:TextBox runat="server" ID="Cite_T" TextMode="MultiLine" Height="100" Width="400" CssClass="form-control" />
				  <div class="sysBtline">
                      <a id="copycode" href="javascript:;"  class="btn btn-info btn-xs">获取代码</a> <a  href="Default.aspx"  class="btn btn-outline-info btn-xs">返回列表</a>
					  </div>
                  </td>
                  </tr>
              </table>
              <div class="alert alert-info w-100">点击获取代码按钮，粘贴到您想引用的html代码里</div>
          </div></div>
		  
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>