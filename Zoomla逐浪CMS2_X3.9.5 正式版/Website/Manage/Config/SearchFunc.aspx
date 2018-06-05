<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchFunc.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.SearchFunc" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Import Namespace="ZoomLa.Common" %>
<%@ Import Namespace="ZoomLa.Components" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.管理导航 %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread() {url="/{manage}/Config/SearchFunc.aspx", text="管理导航<a href='AddSearch.aspx'> [添加管理导航]</a>",addon="" }}
		)
    %>
	<div class="list_choice">
    <div class="divbox" id="nocontent" runat="server" style="display: none"><asp:Literal Text="<%$Resources:L,暂无导航信息 %>" runat="server"/> </div>
    <div class="alert alert-info mb-2">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <%=Resources.L.管理导航 %>：<%=Resources.L.在此位置您可以对索引目录进行观察位置 %>、<%=Resources.L.删除目录及管理目录的索引文件 %>。 <span class="text-danger">(<%=Resources.L.提示 %>：<%=Resources.L.凡是文件未启用或站内链接不存在该文件则无法链接到指定的页面 %>。)</span>
    </div> 
    <ul class="nav nav-tabs" id="linktype_ul">
      <li class="nav-item" data-id="0" role="presentation"><a class="nav-link" href="SearchFunc.aspx"><%=Resources.L.所有应用 %></a></li>
      <li class="nav-item" data-id="1" role="presentation"><a class="nav-link" href="SearchFunc.aspx?state=1"><%=Resources.L.已启用 %></a></li>
      <li class="nav-item" data-id="2" role="presentation"><a class="nav-link" href="SearchFunc.aspx?state=2"><%=Resources.L.已停用 %></a></li>  
    </ul>
    <div class="table-responsive">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="False" AllowPaging="true" PageSize="20" OnPageIndexChanging="EGV_PageIndexChanging"
            CssClass="table table-striped table-bordered" OnRowCommand="EGV_RowCommand" IsHoldState="false" OnRowDataBound="gvCard_RowDataBound" >
            <Columns>
                <asp:TemplateField ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <input type="checkbox" name="chkSel" value='<%#Eval("id") %>' />
                        <asp:HiddenField ID="hfId" runat="server" Value='<%# Eval("id") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$Resources:L,名称 %>" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <a href='<%#Eval("id","AddSearch.aspx?menu=edit&id={0}") %>' title="<%=Resources.L.点击编辑导航 %>"><%#Eval("Name") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$Resources:L,状态 %>" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                        <%#ShowStatus() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$Resources:L,文件或地址路径 %>">
                    <ItemTemplate>
                        <a href="<%# Eval("FileUrl") %>" title="<%# Eval("Name") %>"><%#Eval("FileUrl") %></a>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$Resources:L,图标地址 %>">
                    <ItemTemplate>
                        <span class="font_red"><%#GetItemIcon() %></span>：<asp:Label ID="lblpic" runat="server" Text='<%# Eval("ico") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$Resources:L,手动排序 %>">
                     <ItemStyle HorizontalAlign="Center" />
                    <ItemTemplate>
                        <input type="number" min="1" class="text_x text-center" name="order_T" value="<%#Eval("OrderID") %>" />
                        <input type="hidden" name="order_Hid" value="<%#Eval("ID")+":"+Eval("OrderID")+":"+Eval("OrderID") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="属性" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                      <ItemTemplate>
                         <%#ShowAttribute() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$Resources:L,连接类型 %>" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                       <%#ShowLinkType() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle">
                    <ItemTemplate>
                       <asp:LinkButton runat="server" CommandName="seturl" CommandArgument='<%#Eval("ID") %>'>设为启动页</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
    <div class="alert alert-light text-center">
        <asp:Button ID="BtnDelete" runat="server" CssClass="btn btn-outline-danger mb-1" OnClick="BtnDelete_Click" OnClientClick="if(!IsSelectedId()){alert('请选择内容');return false;}else{return confirm('确定删除？')}" Text="<%$Resources:L,删除导航 %>"/>
        <asp:Button ID="Button1" runat="server" Text="<%$Resources:L,批量启用 %>" CssClass="btn btn-outline-info mb-1" OnClick="Btnuse_Click" />
        <asp:Button ID="Button2" runat="server" Text="<%$Resources:L,批量停用 %>" CssClass="btn btn-outline-danger mb-1" OnClick="Btnstop_Click" />
        <asp:Button ID="Button3" runat="server" Text="<%$Resources:L,保存排序 %>" CssClass="btn btn-outline-info mb-1" OnClick="saveOrder_Btn_Click" OnClientClick="return confirm('确定要保存修改后的排序吗!!!');"/>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        $().ready(function () {
            ZL_Regex.B_Num("input[type=number]");
            $("#gvCard tr>th:eq(0)").html("<input type=checkbox id='chkAll'/>");//EGV顶部
            //$("#Egv  tr>th").css("height", "30px").css("line-height", "30px");
            $("#AllID_Chk").click(function () {//EGV 全选
                selectAllByName(this, "chkSel");
            });
            var LinkState = '<%=LinkState %>';
            $("#linktype_ul [data-id='" + LinkState + "']").find("a").addClass('active');
        })
    </script>
    <script runat="server">
        public string startUrl = SiteConfig.SiteOption.Admin_StartUrl.ToLower();
        public string ShowLinkType()
        {
            string result = "";
            string url = Eval("FileUrl", "").ToLower();
            if (url.StartsWith("http") || url.StartsWith("https")) { return "<i class='zi zi_link' style='color:#FF7A00;'></i>"; }
            switch (DataConverter.CLng(Eval("Type")))
            {
                case 0://站内链接  
                    result = "<i class='zi zi_folderOpen' style='color:#FF7A00;'></i>";
                    break;
                case 1://用户中心
                    result = "<i class='zi zi_listalt' style='color:#FF7A00;'></i>";
                    break;
                case 2://站外链接
                    result = "<i class='zi zi_folderOpen' style='color:#FF7A00;'></i>";
                    break;
            }
            return result;
        }
        public string ShowStatus()
        {
            switch (DataConverter.CLng(Eval("state")))
            {
                case 1:
                    return "启用";
                case 2:
                default:
                    return "停用";
            }
        }
        public string IsMobile(object o)
        {
            string result = "<i class='{0}' title='{1}' style='color:#FF7A00;'/>";
            if (o.ToString().Equals("1"))
            {
                result = string.Format(result, "zi zi_check", "支持移动");
            }
            else
            {
                result = string.Format(result, "zi zi_times", "不支持");
            }
            return result;
        }
        public string ShowAttribute()
        {
            string result = "";
            if (DataConverter.CLng(Eval("Mobile")) == 1)
            {
                result += "<i class='zi zi_mobile' title='支持移动' style='font-size:22px;color:#FF7A00;'/> ";
            }

            string linkUrl = Eval("FileUrl", "").Replace("/Manage/",customPath2).ToLower();
            if (linkUrl.Equals(startUrl))
            {
                result += "<i class='zi zi_home' title='启动页' style='font-size:20px; color:#FF7A00;'/> ";
            }
            return result;
        }
    </script>
</asp:Content>
