<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="ZoomLaCMS.Manage.APP.Suppliers"MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.APP配置 %></title>
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
        new Bread("/{manage}/User/AdminManage.aspx","用户管理"),
		new Bread("/{manage}/User/UserManage.aspx","会员管理"),
        new Bread() {url="", text="APP社会化登录",addon= "" }},
        Call.GetHelp(2)
        )
    %>
</asp:Content>


<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow">
    <ul class="nav nav-tabs list_choice" role="tablist">
        <li class="nav-item"><a class="nav-link active show" href="#app" aria-controls="app" role="tab" data-toggle="tab"><%=Resources.L.社会化登录 %></a></li>
        <li class="nav-item"><a class="nav-link" href="#other" aria-controls="other" role="tab" data-toggle="tab">翻译打印</a></li>
        <li class="nav-item"><a class="nav-link" href="#blog" aria-controls="other" role="tab" data-toggle="tab">博客平台</a></li>
    </ul>
    <div class="tab-content  col-12 table_box">
        <div role="tabpanel" class="tab-pane active " id="app">
            <table class="table table-striped table-bordered">
                <tr>
                    <th class="w12rem_lg">
                        <img class="sys_cur_poin" src="/App_Themes/Admin/Sina_2.png" />
                        <div><asp:CheckBox runat="server" ID="Sina_Enable_Chk" Text="开启新浪微博登录" /></div>
                    </th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <input id="ASina" type="text" class="form-control max20rem" runat="server" />
						   <div class="input-group-prepend">
							<span class="input-group-text">Secret</span>
						  </div>
						  <input id="SSina" type="text" class="form-control max20rem" runat="server" />
						</div>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text"><%=Resources.L.回调 %></span>
						  </div>
						  <input id="SSinaURL" type="text" class="form-control max20rem" runat="server" />
						</div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <img class="sys_cur_poin" src="/App_Themes/Admin/QQ_2.png" />
                        <div><asp:CheckBox runat="server" ID="QQ_Enable_Chk" Text="开启QQ登录" /></div>
                    </th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">APPID</span>
						  </div>
						  <input id="QQ_Login_APPID_T" type="text" class="form-control max20rem" runat="server" />
						   <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <input id="QQ_Login_Key_T" type="text" class="form-control max20rem" runat="server" />
						</div>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text"><%=Resources.L.回调 %></span>
						  </div>
						  <input id="QQ_Login_CallBack_T" type="text" class="form-control max20rem" runat="server" />
						</div>
                    </td>
                </tr>
                <tr>
                    <th>
                        <img class="sys_cur_poin" src="/App_Themes/Admin/Baidu_2.png" />
                        <div><asp:CheckBox runat="server" ID="Baidu_Enable_Chk" Text="开启百度登录" /></div>
                    </th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <input id="ABaidu" type="text" class="form-control max20rem" runat="server" />
						   <div class="input-group-prepend">
							<span class="input-group-text">Secret</span>
						  </div>
						  <input id="SBaidu" type="text" class="form-control max20rem" runat="server" />
						</div>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text"><%=Resources.L.回调 %></span>
						  </div>
						  <input id="UBaidu" type="text" class="form-control max20rem" runat="server" />
						</div>
                    </td>
                </tr>
                <%--<tr>
                    <th>
                        <img class="sys_cur_poin" src="/App_Themes/Admin/Kaixin_2.png" />
                    </th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <input id="AKaixin" type="text" class="form-control max20rem" runat="server" />
						   <div class="input-group-prepend">
							<span class="input-group-text">Secret</span>
						  </div>
						  <input id="SKaixin" type="text" class="form-control max20rem" runat="server" />
						</div>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text"><%=Resources.L.回调 %></span>
						  </div>
						 <input id="SKaixiuUrl" type="text" class="form-control max20rem" runat="server" />
						</div>
                    </td>
                </tr>--%>
                <tr>
                    <th>
                        <i class="fa fa-wechat text-success sys_wx_icon"></i>
                        <span><%=Resources.L.微信登录 %></span>
                        <div><asp:CheckBox runat="server" ID="Wechat_Enable_Chk" Text="开启微信登录" /></div>
                    </th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <asp:TextBox runat="server" ID="WeChat_APPID_T" CssClass="form-control max20rem"></asp:TextBox>
						   <div class="input-group-prepend">
							<span class="input-group-text">Secret</span>
						  </div>
						  <asp:TextBox runat="server" ID="WeChat_Secret_T" CssClass="form-control max20rem"></asp:TextBox>
						</div>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text"><%=Resources.L.回调 %></span>
						  </div>
						  <asp:TextBox runat="server" ID="WeChat_URL_T" CssClass="form-control max20rem"></asp:TextBox>
						</div>
                    </td>
                </tr>
                <tr style="display: none;">
                    <th>
                        <img class="sys_cur_poin" src="/App_Themes/Admin/Netease_2.png" /></th>
                    <td>
                        <div class="input-group">
                            <span class="input-group-addon">AppID</span><input id="chat_AppIDT" type="text" class="form-control max20rem" runat="server" />
                            <span class="input-group-addon">AppKey</span><input id="chat_AppKeyT" type="text" class="form-control max20rem" runat="server" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td><asp:Button runat="server" ID="Login_Save_Btn" CssClass="btn btn-outline-info" Text="保存社会化登录信息" OnClick="Login_Save_Btn_Click" /></td>
                </tr>
            </table>
        </div>
        <div role="tabpanel" class="tab-pane" id="other">
            <table class="table table-striped table-bordered">
                <tr>
                    <th class="w12rem_lg"><%=Resources.L.百度翻译 %></th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <asp:TextBox runat="server" ID="Baidu_Translate_Key_T" CssClass="form-control max20rem" />
						   <div class="input-group-prepend">
							<span class="input-group-text">Secret</span>
						  </div>
						  <asp:TextBox runat="server" ID="Baidu_Translate_Secret_T" CssClass="form-control max20rem" />
						</div>
                    </td>
                </tr>
                <tr>
                    <th>飞印打印</th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <asp:TextBox runat="server" ID="Printer_Key_T" CssClass="form-control max20rem" />
						   <div class="input-group-prepend">
							<span class="input-group-text">Secret</span>
						  </div>
						  <asp:TextBox runat="server" ID="Printer_Secret_T" CssClass="form-control max20rem" />
						</div>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td>
                        <asp:Button runat="server" CssClass="btn btn-outline-info" ID="Other_Save_Btn" Text="保存配置" OnClick="Other_Save_Btn_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="tab-pane" id="blog">
            <table class="table table-striped table-bordered">
                <%--<tr>
                    <th>新浪</th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <asp:TextBox runat="server" ID="Sina_Blog_Key_T" CssClass="form-control max20rem" />
						   <div class="input-group-prepend">
							<span class="input-group-text">Secret</span>
						  </div>
						  <asp:TextBox runat="server" ID="Sina_Blog_Secret_T" CssClass="form-control max20rem" />
						</div>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text"><%=Resources.L.回调 %></span>
						  </div>
						  <asp:TextBox runat="server" ID="Sina_Blog_CallBack_T" CssClass="form-control" />
						</div>
                    </td>
                </tr>--%>
                <tr>
                    <th class="w12rem_lg">腾迅</th>
                    <td>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">Key</span>
						  </div>
						  <asp:TextBox runat="server" ID="QQ_Blog_Key_T" CssClass="form-control max20rem" />
						  <%--  <span class="input-group-addon">APPSecret</span>
                        <asp:TextBox runat="server" ID="QQ_Blog_Secret_T" CssClass="form-control max20rem" />--%>
						</div>
						<div class="input-group m-1">
						  <div class="input-group-prepend">
							<span class="input-group-text">回调</span>
						  </div>
						  <asp:TextBox runat="server" ID="QQ_Blog_CallBack_T" CssClass="form-control max20rem" />
						</div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button runat="server" ID="Blog_Save_Btn" CssClass="btn btn-outline-info" Text="保存博客信息" OnClick="Blog_Save_Btn_Click" /></td>
                </tr>
            </table>
        </div>
    </div>
    </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
