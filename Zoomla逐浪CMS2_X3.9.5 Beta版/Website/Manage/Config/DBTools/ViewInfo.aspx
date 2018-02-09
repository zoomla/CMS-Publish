<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewInfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.ViewInfo" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>视图信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
      <table class="table table-bordered table-hover table-striped">
            <tr>
                <td class="td_l"><strong>视图名：</strong></td>
                <td>
                    <div class="input-group"><span class="input-group-addon">ZL_V_</span><input type="text" id="txtVName"  class="form-control text_300" runat="server" disabled="disabled" /></div>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>连接条件(可为空)：</strong>
                    <p></p>
                </td>
                <td>
                    <textarea runat="server" id="taWhere"  class="form-control m715-50" style="height:80px;" disabled="disabled"></textarea>
                    <p>连接条件格式为： 表1.字段名=表2.字段名 and 表3.字段=表4.字段名，依次类推</p>
                </td>
            </tr>
            
            <tr>
                <td><strong>SQL语句：</strong></td>
                <td>
                    <textarea runat="server" class="form-control m715-50" id="taSQL" readonly="readonly" style="height:200px;"></textarea>
                </td>
            </tr>

            <tr>
                <td><strong>视图说明(选填)：</strong></td>
                <td>
                    <div class="input-group"><span class="input-group-addon">功能</span><input type="text" runat="server" class="form-control m715-50"  id="explain" disabled="disabled" /></div>
                    <div class="input-group margin_t5"><span class="input-group-addon">二字查询关键字</span><input type="text" runat="server" class="form-control m715-50" id="secshort" disabled="disabled" /></div>
                    <div class="input-group margin_t5"><span class="input-group-addon">三字查询关键字</span><input type="text" runat="server" class="form-control m715-50" id="thrshort" disabled="disabled" /></div>
                </td>
            </tr>

            <tr>
                <td></td>
                <td><input type="button" class="btn btn-primary" onclick="window.location.href('ViewList.aspx');" value="返回" /></td>
            </tr>
        </table>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>