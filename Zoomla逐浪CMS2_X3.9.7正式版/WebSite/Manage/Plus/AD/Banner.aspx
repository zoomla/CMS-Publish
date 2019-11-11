<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Banner.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.AD.Banner" MasterPageFile="~/Manage/I/Index.Master" %>
<%@ Import Namespace="System.Data" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>Banner管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
    new Bread("/{manage}/Plus/ADManage.aspx","广告管理"),
    new Bread() {url=Request.RawUrl, text="Banner管理",addon="[<a href='BannerAdd.aspx'>添加Banner</a>]" }}
	)
%>

<div class="list_choice table-responsive-md">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="5" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="w1rem">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
       <asp:TemplateField HeaderText="别名" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <%#Eval("Alias") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="预览图">
            <ItemTemplate>
                <%#ShowImages() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l text-center">
            <ItemTemplate>
                <div style="margin-bottom:5px;">
                    <a class="btn btn-info btn-sm" href="BannerAdd.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i> 修改</a>
                    <asp:LinkButton runat="server" class="btn btn-info btn-sm" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i> 删除</asp:LinkButton>
                </div>
                <div>
<%--                    <asp:LinkButton runat="server" CommandName="refresh" CommandArgument='<%#Eval("ID") %>' class="btn btn-info btn-sm"><i class="zi zi_recycle"></i> 刷新</asp:LinkButton>--%>
                    <button type="button" class="btn btn-info btn-sm quote_btn" data-id="<%#Eval("id") %>"><i class="zi zi_copy"></i> 拷贝</button>
                    <textarea id="js_<%#Eval("id") %>" style="display:none;"><%#ShowJSQuote() %></textarea>
                </div>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    var clipboard = new ClipboardJS('.quote_btn', {
        text: function (obj) {
            var quote = $("#js_" + $(obj).data("id")).val();
            alert("已引用入剪贴板");
            return quote;
        }
    });
</script>
<script runat="server">
    public string ShowImages()
    {
        string imageTlp = "<img src='{0}' style='max-width:150px;max-height:150px;margin-right:5px;margin-bottom:5px;border:1px solid #ddd;padding:3px;'/>", html = "";
        string images = Eval("images","");
        if (string.IsNullOrEmpty(images) || images.Equals("[]")) { return "未指定图片"; }
        DataTable dt = Newtonsoft.Json.JsonConvert.DeserializeObject<DataTable>(images);
        foreach (DataRow dr in dt.Rows)
        {
            html += string.Format(imageTlp,ZoomLa.Common.DataConverter.CStr(dr["image"]));
        }
        return html;
    }
</script>
</asp:Content>