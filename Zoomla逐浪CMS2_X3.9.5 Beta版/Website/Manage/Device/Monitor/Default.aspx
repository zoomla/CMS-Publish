<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Device.Monitor.Default" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>设备列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li class="active"><a href='Default.aspx'>设备列表</a>
                    [<a href="MonitorAdd.aspx">添加设备</a>]
                </li>
            </ol>
        </div>
    </div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="别名">
            <ItemTemplate><a href="MonitorAdd.aspx?ID=<%#Eval("ID") %>"><%#Eval("Alias") %></a></ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="域名或IP" DataField="Domain" />
        <asp:BoundField HeaderText="端口" DataField="M_Port"/>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a class="option_style" href="/Plugins/Monitor/View.aspx?id=<%#Eval("ID") %>" target="_blank"><i class="fa fa-eye" title="预览监控"></i>进入监控</a>
                <a class="option_style" href="MonitorAdd.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>
                <asp:LinkButton runat="server" class="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
    <div class="alert alert-info">
        1、请使用IE预览监控视频,预览前请先安装插件, <a href="http://code.z01.com/WebComponentsKit.rar" target="_blank">下点此载监控插件</a>。<br/>
		2、免费版只开放海康威视接口（如海康威视DS-2CD12D1-I3等企业级录像监控设备）。<br/>
		3、普通宽带请使用桥接或DDN映射处理，指向内网录像机通道IP的80端口。
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>