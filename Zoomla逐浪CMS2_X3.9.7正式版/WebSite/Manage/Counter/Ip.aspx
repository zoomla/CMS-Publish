<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ip.aspx.cs" Inherits="ZoomLaCMS.Manage.Counter.Ip" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>总访问报表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href='<%:CustomerPageAction.customPath2 %>I/Main.aspx'>工作台</a></li>
	<li class="breadcrumb-item"><a href='Counter.aspx'>访问统计</a></li>
	<li class="breadcrumb-item"><a href='Ip.aspx'>总访问报表</a></li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
    <div id="sel_box">
        <div class="input-group">
		    <asp:DropDownList ID="FilterType_Drop" runat="server" CssClass="form-control max20rem">
		        <asp:ListItem Selected="True" Value="UserName">会员名</asp:ListItem>
		        <asp:ListItem Value="Source">来源</asp:ListItem>
		    </asp:DropDownList>
		    <asp:TextBox ID="IDName" runat="server" CssClass="form-control max20rem"></asp:TextBox>
		    <span class="input-group-append">
		    <asp:LinkButton runat="server" ID="Search_Btn" OnClick="Search_Btn_Click" CssClass="btn btn-outline-secondary"><span class="zi zi_search"></span></asp:LinkButton>
		    </span> 
        </div>
    </div>
</ol>
<div class="list_choice">
    <h3>
        <small>
            <a  class="float-right mr-2" href="counter.aspx">[返回]</a><span class="ml-2">访客累计：</span><asp:Label ID="SumCount_L" runat="server"></asp:Label>
        </small>
    </h3>
    <div class="table-responsive-md">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" PageSize="15" AllowPaging="true"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging">
            <Columns>
                <asp:BoundField ControlStyle-CssClass="" HeaderText="ID" DataField="ID" />
                      <asp:TemplateField HeaderText="来源">
                          <ItemTemplate>
                              <%#Eval("Source") %>
                          </ItemTemplate>
                      </asp:TemplateField>
                     <asp:TemplateField HeaderText="用户">
                          <ItemTemplate>
                              <%#Eval("UserName") %>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="IP">
                          <ItemTemplate>
                              <%#Eval("IP") %>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="操作系统">
                          <ItemTemplate>
                              <%#Eval("OSVersion") %>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="设备">
                          <ItemTemplate>
                              <%#Eval("Device") %>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="浏览器版本">
                          <ItemTemplate>
                              <%#Eval("BrowerVersion") %>
                          </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField HeaderText="创建时间">
                          <ItemTemplate>
                              <%#Eval("CDate") %>
                          </ItemTemplate>
                      </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $(function () {
            $("#sel_btn").click(function (e) {
                if ($("#sel_box").css("display") == "none") {
                    $(this).addClass("active");
                    $("#sel_box").slideDown(300);
                }
                else {
                    $(this).removeClass("active");
                    $("#sel_box").slideUp(200);
                }
            });
        })
    </script>
</asp:Content>