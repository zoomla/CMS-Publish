<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Amazing.css.Default" MasterPageFile="~/Manage/I/Index.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>呈现管理</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
  <ol id="BreadNav" class="breadcrumb fixed-top">
            <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li class="breadcrumb-item"><a href='Default.aspx'>呈现管理</a> [<a href="CSSContent.aspx">新建样式</a>]</li>
            <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
            <div id="sel_box">
                <div class="input-group">
                    <input type="text" id="skey" runat="server" class="form-control mvcparam max20rem" placeholder="请输入关键词" onkeypress="selbox.search();" />
                    <span class="input-group-append">
                        <asp:LinkButton runat="server" class="btn btn-outline-secondary" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="zi zi_search"></i></asp:LinkButton>
                    </span>
                </div>
            </div>
        </ol>
		<div class="table-responsive-md list_choice pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="w1rem">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="" />
        <asp:BoundField HeaderText="样式名称" DataField="Name" />
        <asp:TemplateField HeaderText="标签引用" ItemStyle-CssClass="">
            <ItemTemplate>
                <%#cssBll.GetLabelQuote(Convert.ToInt32(Eval("ID"))) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="备注" DataField="Remind" ItemStyle-CssClass="" />
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass=""/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
            <ItemTemplate>
			    <a href="CSSContent.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="创作"></i> 创作</a>
                <asp:LinkButton runat="server"  CommandName="stop" CommandArgument='<%#Eval("ID") %>' Visible='<%#Eval("ZStatus","").Equals("-1")?false:true %>'><i class="zi zi_ban"></i> 停用</asp:LinkButton>
                <asp:LinkButton runat="server"  CommandName="active" CommandArgument='<%#Eval("ID") %>' Visible='<%#Eval("ZStatus","").Equals("-1")?true:false %>'><i class="zi zi_check"></i> 启用</asp:LinkButton>
                <asp:LinkButton runat="server"  CommandName="down" CommandArgument='<%#Eval("ID") %>'><i class="zi zi_download"></i> 下载</asp:LinkButton>
                <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>