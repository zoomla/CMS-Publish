<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskList.aspx.cs" Inherits="ZoomLaCMS.Manage.Sentiment.TaskList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ID="ContentID1" ContentPlaceHolderID="head">
<title>监测来源</title>
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
<asp:Content runat="server"  ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Default.aspx","企业办公"),
        new Bread("Default.aspx","舆情监测"),
        new Bread() {url="", text="任务列表<a href='AddTask.aspx'> [新建任务]</a>",addon="" }}
		)
    %>
<div class="table-responsive-md list_choice pr-1"> 
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging"  OnRowCommand="EGV_RowCommand" >
            <Columns>
                <asp:TemplateField HeaderText="" ItemStyle-CssClass="w1rem" ItemStyle-HorizontalAlign="Left">
                    <ItemTemplate>
                        <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" data-skey="<%#Eval("Condition") %>" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="" />
                <asp:BoundField HeaderText="标题" DataField="Title" />
                <asp:BoundField HeaderText="来源" DataField="Source" />
                <asp:BoundField HeaderText="关键字" DataField="Condition" /> 
                <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                <a href="AddTask.aspx?ID=<%#Eval("ID") %>" ><i class="zi zi_pencilalt" title="修改"></i></a>
                <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                <a href="GetReport.aspx?Skey=<%#HttpUtility.UrlEncode(Eval("Condition","")) %>" class="report_a"><i class="zi zi_eye" title="查看"></i>查看报告</a>                
                </ItemTemplate>
                </asp:TemplateField>            
            </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
	<div class="sysBtline">
    <input type="button" value="生成报表" class="btn btn-outline-info" onclick="GetReport();" />
    <asp:Button runat="server" ID="BatDel_Btn" OnClick="BatDel_Btn_Click" Text="批量删除" OnClientClick="return confirm('确定要删除吗');" CssClass="btn btn-outline-danger" />  
	</div>
</div>     
</asp:Content> 
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function GetReport() {
        var skey = "";
        var $chkarr = $("input[name=idchk]:checked");
        if ($chkarr.length < 1) { alert("请先选择关键词"); return false; }
        $chkarr.each(function () {
            skey += $(this).data("skey") + ",";
        })
        comdiag.ShowMask("正在努力抓取数据,请稍等");
        location = "GetReport.aspx?Skey=" + escape(skey);
    }
    $(".report_a").click(function () {
        comdiag.ShowMask("正在努力抓取数据,请稍等");
    });
</script>
</asp:Content>