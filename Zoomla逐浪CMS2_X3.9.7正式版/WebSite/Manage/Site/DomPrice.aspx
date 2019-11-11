<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DomPrice.aspx.cs" Inherits="ZoomLaCMS.Manage.Site.DomPrice" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>域名定价</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"> 
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","站群管理"),
        new Bread() {url="", text="域名定价",addon="" }}
		)
    %>
	<div class="list_choice">
<div id="viewDiv" runat="server">
    <div class="input-group p-2 mb-2">
    <asp:TextBox runat="server" ID="searchText" CssClass="form-control max20rem"  placeholder=".com|.cn|.asia..." />
    <div class="input-group-btn">
    <asp:Button runat="server" ID="searchBtn" CssClass="btn btn-outline-info" Text="搜索" OnClick="searchBtn_Click" ValidationGroup="search" />
    <asp:Button runat="server" ID="disAddBtn" CssClass="btn btn-outline-info" Text="添加" OnClick="disAddBtn_Click" />  
    </div>
    </div>
<asp:RequiredFieldValidator ID="R2" runat="server" ControlToValidate="searchText" Display="Dynamic" ErrorMessage="关键词不能为空" ValidationGroup="search" ForeColor="Red"/>
    <ZL:ExGridView runat="server" ID="domPriceEGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" 
         EnableTheming="False" CssClass="table table-hover table-striped table-bordered sys_table"
         OnRowCommand="domPriceEGV_RowCommand" OnRowCancelingEdit="domPriceEGV_RowCancelingEdit" OnPageIndexChanging="mimeEGV_PageIndexChanging" 
         EmptyDataText="没有域名定价信息">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" ReadOnly="true"/>
            <asp:TemplateField HeaderText="域名" >
                <ItemTemplate>
                    <%#Eval("DomName") %>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="eDomName" CssClass="domname" Text='<%#Eval("DomName") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="价格">
                <ItemTemplate>
                    <asp:TextBox runat="server" ID="DomPriceText" Text='<%#Eval("DomPrice") %>' 
                         TabIndex="1" MaxLength="10" autocomplete="off"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox runat="server" ID="eDomPrice" CssClass="domname" Text='<%#Eval("DomPrice") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                <%#GetStatus(Eval("Status")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="接口">
                <ItemTemplate>
                    <%#GetInterFace(Eval("IFSupplier")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="简述" DataField="ProDetail" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="?ID=<%#Eval("ID") %>" title="查看详情">查看详情</a>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Del2" 
                        OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle   HorizontalAlign="Center" />
        <RowStyle  HorizontalAlign="Center" />
    </ZL:ExGridView>
	<div class="alert alert-light">
<asp:Button runat="server" Text="保存价格修改" ID="saveBtn" OnClick="saveBtn_Click" CssClass="btn btn-outline-info"/>
</div>
            </div>
<div id="addDiv" runat="server" visible="false" class="m-3">
            <table class="table table-bordered table-striped table-hover">
                <tr><td>域名：</td><td> 
                    <span class="text-success" runat="server" id="addSpan"><asp:DropDownList runat="server" ID="domNameDP" CssClass="form-control max20rem"></asp:DropDownList>
                    注:尚未定价的后缀名</span>
                    <asp:Label runat="server" ID="domNameL" ReadOnly="true" Visible="false"/><!--用于修改-->
               </td></tr>
               <tr><td>价格：</td><td> 
                   <asp:TextBox runat="server" ID="tab2DomPrice"  CssClass="form-control max20rem float"/>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" runat="server" ControlToValidate="tab2DomPrice" 
                      Display="Dynamic" ErrorMessage="价格不能为空" ValidationGroup="add"/>
                             </td></tr>
                   <tr><td>简述：</td><td><asp:TextBox runat="server" Rows="5" ID="detailText" TextMode="MultiLine" CssClass="form-control max20rem" /></td></tr>
                <tr><td>接口：</td><td>
                    <asp:DropDownList runat="server" ID="ifListDP" CssClass="form-control max20rem">
                        <asp:ListItem Value="0">新网</asp:ListItem>
                        <asp:ListItem Value="1">万网</asp:ListItem>
                    </asp:DropDownList>
                              </td></tr>
                 <tr><td>状态：</td><td>
                     <asp:CheckBox runat="server" ID="statusChk" Checked="true" Text="启用"/>
                                 </td></tr>
                <tr><td>操作：</td><td>
                    <asp:Button runat="server" ID="tab2AddBtn" Text="添加" CssClass="btn btn-outline-info" OnClick="tab2AddBtn_Click" ValidationGroup="add" />
                    <input type="button" id="returnBtn" value="返回" class="btn btn-outline-info" onclick="location = 'DomPrice.aspx';"/>
                                </td></tr>
                </table>
        </div>
		</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/ZL_Regex.js"></script>
    <script type="text/javascript">
        $().ready(function () {
            $(":submit").addClass("site_button");
            $(":button").addClass("site_button");
            $(":text").addClass("site_input");
            ZL_Regex.B_Float(".float");
        });
    </script>
</asp:Content>