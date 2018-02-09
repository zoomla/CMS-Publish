<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WxAppManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.WxAppManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>微信公众号管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
        new Bread("Home.aspx","移动微信"),
        new Bread() {url="", text="微信管理 [<a href='WxConfig.aspx'>添加公众号</a>]",addon= "" }}
        )
    %>

<ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" 
EnableTheming="False" EnableModelValidation="True" OnRowCommand="Egv_RowCommand" OnRowDataBound="Egv_RowDataBound" EmptyDataText="暂无公众号信息!">
<Columns>
<asp:BoundField DataField="ID" HeaderText="ID" />
<asp:TemplateField HeaderText="公众号名" ItemStyle-CssClass="opt_div">
	<ItemTemplate>
		<span ondblclick="show_opt('<%#Eval("ID") %>');"><%#Eval("Alias") %></span>
		<div class="opt_cnt" style="z-index:9999;">
			<div class="alert alert-info">
				<table>
					<tr><td><strong>Secret：</strong></td><td><%#Eval("Secret") %></td></tr>
					<tr><td><strong>Token：</strong></td><td><%#GetToken() %> </td></tr>
				</table>
			</div>
			<div class="opt_border"></div>
		</div> 
	</ItemTemplate>
</asp:TemplateField>
<asp:BoundField DataField="WxNo" HeaderText="微信公众号" />
<asp:BoundField DataField="APPID" HeaderText="APPID" />

<asp:BoundField DataField="CDate" HeaderText="创建时间" />
<asp:TemplateField HeaderText="操作" ItemStyle-CssClass="opt_div">
	<ItemTemplate> 
		<a class="option_style" href="WxConfig.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="编辑"> 编辑</i></a>
		<asp:LinkButton runat="server" OnClientClick="return confirm('是否删除该项')" CommandName="Del" CommandArgument='<%#Eval("ID") %>' CssClass="option_style"><span class="fa fa-trash-o" title="删除"></span> 删除</asp:LinkButton>
	</ItemTemplate>
</asp:TemplateField>
</Columns>
</ZL:ExGridView>
<div class="alert alert-info fade in margin_b2px">
<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
<h4>提示!</h4>
本页用于管理、关联微信公众帐号，如果还没有微信公众号可点击<a href="//mp.weixin.qq.com/" target="_blank">微信公众平台</a>申请；
</div>
<asp:Button runat="server" ID="Dels_B" Visible="false" OnClick="Dels_B_Click" OnClientClick="return confirm('确定删除选中项?')" CssClass="btn btn-primary" Text="批量删除" />
<style>
.allchk_l {display:none;}
.opt_div{ position:relative;}
.opt_div .opt_cnt{ display:none; position:absolute; bottom:15px; width:900px; max-width:500%;    text-align:justify; text-decoration:inherit}
.opt_cnt .alert-info{ background:#e2f9fc; border-color:#e2f9fc;}
.opt_cnt .alert-info table td{border:0;}
.opt_border{ position:absolute; left:20px;top: 3em; width:0; height:0; border-width:10px;border-color:rgba(0, 0, 0, 0.00);  border-top-color:#e2f9fc;border-style:solid; } 
</style>
<script>
    var $leftwx = $(parent.document.getElementById("LeftPanel"));
    var action = "<%=Request.QueryString["action"] %>";
    $(function () {
        if (action == "add") {
            AddWxApp('<%=Request.QueryString["id"] %>', '<%=Request.QueryString["alias"]%>');
            location.href = "WxAppManage.aspx";
        }
        $("#Egv tr").dblclick(function () {
            if ($(this).find("[name='idchk']")[0])
                window.location.href = "WxConfig.aspx?id="+$(this).find("[name='idchk']").val();
        });
    });
    //以下函数同步左边栏内容操作
    function DelWxApp(id) {
        $leftwx.find("[data-id='" + id + "']").remove();
        //parent.DelWxTree(id);
    }
    function AddWxApp(id,alias) {
        var $ul = $leftwx.find("#menu7_9_ul2");
        $ul.append("<li data-id='"+id+"'><a href='javascript:;' onclick='ShowMain(\"\",\"<%=customPath2 %>WeiXin/Home.aspx?appid="+id+"\");'>"+alias+"</a></li>");
    }
    function DelsWxApp(ids) {
        var idsarray = ids.split(',');
        for (var i = 0; i < idsarray.length; i++) {
            $leftwx.find("[data-id='" + idsarray[i] + "']").remove();
        }
    }
	$(".opt_div").mouseover(function(e){
		$(".opt_div .opt_cnt").hide();
		$(this).find(".opt_cnt").show();
	}).mouseout(function(e){
		$(this).find(".opt_cnt").hide();
	})
	function show_opt(obj){
		window.location="WxConfig.aspx?id="+obj;
	}
</script>
</asp:Content>