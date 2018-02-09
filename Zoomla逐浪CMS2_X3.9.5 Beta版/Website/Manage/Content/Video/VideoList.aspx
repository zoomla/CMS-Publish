<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoList.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Video.VideoList" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title>视频列表</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li><a href='../ContentManage.aspx'>内容管理</a></li>
                <li class="active"><a href='UserManage.aspx'>视频列表</a>[<a href='javascript:;' onclick='ShowUpFile()'>添加视频</a>]</li>
                <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="fa fa-search"></i></a></div>
                <div id="sel_box" class="padding5">
                    <div class="input-group">
                        <input type="text" id="skey" runat="server" class="form-control mvcparam" placeholder="请输入关键词" onkeypress="selbox.search();" />
                        <span class="input-group-btn">
                            <asp:LinkButton runat="server" class="btn btn-default" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="fa fa-search"></i></asp:LinkButton>
                        </span>
                    </div>
                </div>
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
        <asp:TemplateField HeaderText="预览图">
            <ItemTemplate>
                <img src="<%#Eval("Thumbnail") %>"  onerror="shownopic(this);" class="img_50"/>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="视频名称">
            <ItemTemplate>
                <a href="VideoInfo.aspx?id=<%#Eval("ID") %>"><%#Eval("VName") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="VPath" HeaderText="视频地址" />
        <asp:TemplateField HeaderText="视频长度">
            <ItemTemplate>
                <%#Eval("VTime","{0:HH:mm:ss}") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:BoundField DataField="Desc" HeaderText="备注" />
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a class="option_style" href="VideoInfo.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>
                <asp:LinkButton runat="server" class="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                <a class="option_style" href="VideoManage.aspx?id=<%#Eval("ID") %>"><i class="fa fa-magic" title="管理">管理</i></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
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

