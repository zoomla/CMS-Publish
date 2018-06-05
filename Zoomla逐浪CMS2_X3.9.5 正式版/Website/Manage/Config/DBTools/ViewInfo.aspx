<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewInfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.ViewInfo" MasterPageFile="~/Manage/I/Safe.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>视图信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("DatalistProfile.aspx","扩展功能"),
		new Bread("DatalistProfile.aspx","开发中心"),
        new Bread() {url="", text="视图信息",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
      <table class="table table-bordered table-hover table-striped sys_table">
            <tr>
                <th scope="col" class="w12rem_lg"><strong>视图名</strong></th>
                <td scope="col">
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">ZL_V_</span>
					  </div>
					  <input type="text" id="txtVName"  class="form-control max20rem" runat="server" disabled="disabled" />
					</div>
                </td>
            </tr>
            <tr>
                <th scope="col">
                    <strong>连接条件(可为空)</strong>
                    <p></p>
                </th>
                <td scope="col">
                    <textarea runat="server" id="taWhere"  class="form-control m50rem_50" style="height:80px;" disabled="disabled"></textarea>
                    <small class="text-muted">连接条件格式为： 表1.字段名=表2.字段名 and 表3.字段=表4.字段名，依次类推</small>
                </td>
            </tr>
            
            <tr>
                <th scope="col"><strong>SQL语句</strong></th>
                <td scope="col">
                    <textarea runat="server" class="form-control m50rem_50" id="taSQL" readonly="readonly" style="height:200px;"></textarea>
                </td>
            </tr>

            <tr>
                <th scope="col"><strong>视图说明(选填)</strong></th>
                <td scope="col">
                   
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">功能</span>
					  </div>
					  <input type="text" runat="server" class="form-control m50rem_50"  id="explain" disabled="disabled" />
					</div>
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">二字查询关键字</span>
					  </div>
					  <input type="text" runat="server" class="form-control m50rem_50" id="secshort" disabled="disabled" />
					</div>
					<div class="input-group mb-3">
					  <div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">二字查询关键字</span>
					  </div>
					  <input type="text" runat="server" class="form-control m50rem_50" id="thrshort" disabled="disabled" />
					</div>
                </td>
            </tr>

            <tr>
                <td></td>
                <td><input type="button" class="btn btn-outline-info" onclick="window.location.href('ViewList.aspx');" value="返回" /></td>
            </tr>
        </table>
		</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>