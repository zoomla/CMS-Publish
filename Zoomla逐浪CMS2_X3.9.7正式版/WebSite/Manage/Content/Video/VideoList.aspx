<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoList.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Video.VideoList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title><%=Resources.L.视频列表 %></title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb fixed-top w-100">
                <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
                <li class="breadcrumb-item"><a href='../ContentManage.aspx'><%=Resources.L.内容管理 %></a></li>
                <li class="breadcrumb-item"><a href='VideoList.aspx'><%=Resources.L.视频列表 %></a> [<a href='javascript:;' onclick='ShowUpFile()'><%=Resources.L.添加视频 %></a>]</li>
                <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
                <div id="sel_box">
					<div class="input-group mb-3">
					  <input type="text" id="skey" runat="server" class="form-control mvcparam max20rem" placeholder="<%=Resources.L.请输入关键词 %>" onkeypress="selbox.search();" />
					  <span class="input-group-append">
                            <asp:LinkButton runat="server" class="btn btn-outline-secondary" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="zi zi_search"></i></asp:LinkButton>
                        </span>
					</div>
                </div>
            </ol>
        </div>
    </div>

<div class="list_choice table-responsive-md">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="<%$Resources:L,数据为空 %>">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="w1rem">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="<%$Resources:L,预览图 %>">
            <ItemTemplate>
                <img src="<%#Eval("Thumbnail") %>"  onerror="shownopic(this);" class="img_3rem"/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$Resources:L,视频名称 %>">
            <ItemTemplate>
                <a href="VideoInfo.aspx?id=<%#Eval("ID") %>"><%#Eval("VName") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="VPath" HeaderText="<%$Resources:L,视频地址 %>" />
        <asp:TemplateField HeaderText="<%$Resources:L,视频长度 %>">
            <ItemTemplate>
                <%#Eval("VTime","{0:HH:mm:ss}") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="<%$Resources:L,创建时间 %>" ItemStyle-CssClass="td_l"/>
        <asp:BoundField DataField="Desc" HeaderText="<%$Resources:L,备注 %>" />
        <asp:TemplateField HeaderText="<%$Resources:L,操作 %>" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a  href="VideoInfo.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="<%=Resources.L.修改 %>"></i></a>
                <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i></asp:LinkButton>
                <a  href="VideoManage.aspx?id=<%#Eval("ID") %>"><i class="zi zi_magic" title="<%=Resources.L.管理 %>"><%=Resources.L.管理 %></i></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function ShowUpFile() {
        ShowComDiag("/Plugins/WebUploader/webup.aspx?json={ashx:\"action=UPVideo\"}&chunk=1", "添加视频");
    }
    function AddAttach(file, ret, json) {
        window.location = location;
    }
    function VideoSet() {
        ShowComDiag("VideoConfig.aspx", "视频设置");
    }
    function CloseVideo() {
        CloseComDiag();
    }
</script>
</asp:Content>

