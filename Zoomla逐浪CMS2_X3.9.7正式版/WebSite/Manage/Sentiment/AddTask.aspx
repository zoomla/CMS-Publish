<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTask.aspx.cs" Inherits="ZoomLaCMS.Manage.Sentiment.AddTask" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ID="ContentID1" ContentPlaceHolderID="head">
<title>监测任务</title>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>
<asp:Content runat="server"  ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Default.aspx","企业办公"),
        new Bread("Default.aspx","舆情监测"),
        new Bread("TaskList.aspx","监测任务"),
        new Bread() {url="", text="新建任务",addon="" }}
		)
    %>
<div class="container-fluid pr-0"> 
    <div class="row sysRow list_choice table-responsive-md">
    <table class="table table-bordered table-striped sys_table"> 
        <tr>       
        <th class="w12rem_lg" scope="col">标题</th><td scope="col"><asp:TextBox runat="server" ID="Title_T" CssClass="form-control max20rem" />
            <asp:RequiredFieldValidator runat="server" ID="R1" cssclass="text-danger" ErrorMessage="标题不能为空" ControlToValidate="Title_T" Display="Dynamic" /></td>
        </tr>
        <tr>
        <th scope="col">类型</th>
        <td scope="col">
            <label><input type="checkbox" name="source_chk" value="新闻" checked="checked" />新闻</label>
            <label><input type="checkbox" name="source_chk" value="微博" checked="checked"/>微博</label>
            <label><input type="checkbox" name="source_chk" value="微信" checked="checked"/>微信</label>
            <label><input type="checkbox" name="source_chk" value="论坛" />论坛</label>
            <label><input type="checkbox" name="source_chk" value="贴吧" />贴吧</label>
            <label><input type="checkbox" name="source_chk" value="网页" />网页</label>
        </td>
        </tr>
        <tr><th>搜索方式</th><td><asp:DropDownList runat="server" ID="SType_DP" CssClass="form-control max20rem">
            <asp:ListItem Value="0" Selected="True">标题&时间</asp:ListItem>
            <asp:ListItem Value="1">正文&相关度</asp:ListItem>
                             </asp:DropDownList></td></tr>
        <tr><th>关键词</th><td><asp:TextBox runat="server" ID="Condition_T" CssClass="form-control max20rem"></asp:TextBox>
             <asp:RequiredFieldValidator runat="server" ID="R3" cssclass="text-danger" ErrorMessage="关键词不能为空" ControlToValidate="Condition_T" Display="Dynamic" />
			 <small class="text-muted">示例:股市动荡</small>
                         </td></tr>
        <tr><th>内容匹配词(可选)</th><td>
            <asp:TextBox runat="server" ID="SuitKey_T" CssClass="form-control max20rem"></asp:TextBox>
           </td></tr>
        <tr>
        <th>任务状态</th><td>
            <input type="checkbox" runat="server" id="Status_Chk" checked="checked" />
                                        </td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button runat="server" Text="提交" CssClass="btn btn-outline-info" ID="Save_Btn" OnClick="Save_Btn_Click"/>
                <a href="Default.aspx" class="btn btn-outline-info">取消</a></td>
        </tr>
    </table>
    </div>
</asp:Content>     