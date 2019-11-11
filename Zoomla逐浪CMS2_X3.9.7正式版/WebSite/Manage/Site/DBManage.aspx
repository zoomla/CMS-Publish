<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DBManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Site.DBManage"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title>数据库管理</title>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("Default.aspx","站群中心"),
	new Bread("DBManage.aspx","数据库管理"),
	new Bread() {url="", text="(仅用于智能建站生成的数据库)",addon="" }}
	)
%>
    <div id="dbListDiv" class="list_choice" runat="server">
        <div class="input-group" style="width: 400px; float: left; margin-bottom: 10px;">
            <asp:TextBox runat="server" ID="searchText" placeholder="请输入需要查询的信息" CssClass="form-control" />
            <span class="input-group-prepend">
                <asp:Button runat="server" CssClass="btn btn-info" ID="searchBtn" Text="搜索" OnClick="searchBtn_Click" />
                <asp:Button runat="server" CssClass="btn btn-info" ID="addBtn" Text="添加" OnClick="addBtn_Click" />
            </span>
        </div>
        <div class="tab3">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" CssClass="table table-bordered" 
                EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="数据库名" DataField="DBName" />
                    <asp:BoundField HeaderText="站点名" DataField="SiteName" />
                    <asp:BoundField HeaderText="用户名" DataField="UserName" />
                    <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="DBManage.aspx?ID=<%#Eval("ID") %>" title="编辑">
                               <i class="zi zi_pencilalt"></i></a>
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">
                            <i class="zi zi_trash"></i></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div>
    <div id="addDiv" runat="server" class="list_choice" visible="false">
        <table class="table table-bordered table-hover sys_table" style="width: 550px;">
            <tr>
                <th class="w12rem_lg">数据库名</th>
                <td><asp:TextBox runat="server" ID="dbNameT" class="form-control max20rem" /></td>
            </tr>
            <tr>
                <th>帐户</th>
                <td>
                    <asp:TextBox runat="server" ID="dbUserT" class="form-control max20rem" /></td>
            </tr>
            <tr>
                <th>密码</th>
                <td>
                    <asp:TextBox runat="server" ID="dbPwdT" class="form-control pull-left max20rem" />
                    <asp:Button runat="server" ID="cPwdBtn" class="btn btn-info ml-2" Text="重新生成" OnClick="cPwdBtn_Click"  Visible="false"/>

                </td>
            </tr>
            <tr>
                <th colspan="2" class="text-center">绑定信息(可稍后设置)</th>
            </tr>
            <tr>
                <th>绑定站点</th>
                <td>
                    <asp:DropDownList runat="server" ID="bindSiteDP" Height="35px"></asp:DropDownList></td>
            </tr>
            <tr>
                <th>绑定会员</th>
                <td>
                    <asp:TextBox runat="server" ID="bindUserT" class="form-control pull-left max20rem" />
                    <asp:HiddenField runat="server" ID="bindUserD" />
<%--                    <input type="button" class="btn btn-info" value="选择会员" onclick="showdiv('div_share', 'bindUser');" style="margin-left: 10px;" />--%>
                </td>
            </tr>
            <tr>
                <th>绑定域名</th>
                <td>
                    <asp:TextBox runat="server" ID="bindDomT" class="form-control max20rem" /></td>
            </tr>
            <tr>
                <th>操作</th>
                <td>
                    <asp:Button runat="server" ID="saveBtn" Text="保存" OnClick="saveBtn_Click" CssClass="btn btn-info" />
                    <input type="button" id="rtnBtn" value="返回" class="btn btn-outline-info" /><br />
                    <span class="alert alert-danger p-2" runat="server" visible="false" id="remindSpan"></span></td>
            </tr>
        </table>
    </div>
    <div id="div_share" class="panel panel-primary" style="display:none; position:absolute;z-index:3;">
        <div class="panel-heading"><h3 class="panel-title">选择会员</h3></div>
        <div class="panel-body">
            <iframe id="main_right" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden;width: 100%;height:500px;" name="main_right" src="/Office/Mail/SelUser.aspx" frameborder="0"></iframe>
        </div>
    </div>
<asp:HiddenField runat="server" ID="dataField" />
    <script type="text/javascript">
        function showdiv(div_id, f) {
            $("#dataField").val(f);
            var div_obj = $("#" + div_id);
            var h = (document.documentElement.offsetHeight) / 2;
            var w = (document.documentElement.offsetWidth - 400) / 2;
            div_obj.animate({ opacity: "show", left: w, top: h, width: div_obj.width, height: div_obj.height }, 300);
            div_obj.focus();
        }
        function hideDiv() {
            $("#div_share").hide();
        }

        function seluser(groupJson, userJson) {
            //var names = "";
            //var ids = "";
            //for (var i = 0; i < userJson.length; i++) {
            //    names += userJson[i].Uname + ",";
            //    ids += userJson[i].Uid + ",";
            //}
            var flag = $("#dataField").val();
            $("#" + flag + "T").val(userJson[0].Uname);
            $("#" + flag + "D").val(userJson[0].Uid);
            hideDiv();
        }
    </script>
</asp:Content>