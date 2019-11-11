<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfigList.aspx.cs" Inherits="ZoomLaCMS.MIS.Ke.ConfigList"  MasterPageFile="~/Common/Master/User.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>课程列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="edu" data-ban="ke"></div>
<div class="container">
	<nav aria-label="breadcrumb" role="navigation">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="/User/">用户中心</a></li>
        <li class="breadcrumb-item active">课程列表 [<a href="SchConfig.aspx">添加课表</a>]</li>
    </ol>
	</nav>
    </div>
    <div class="container u_cnt">
    <table class="table table-bordered table-striped">
        <tr><td scope="col"></td><td scope="col">课表名称</td><td scope="col">早读</td><td scope="col">上午节数</td><td scope="col">下午节数</td><td scope="col">晚上节数</td><td scope="col">每周天数</td><td scope="col">创建人</td><td scope="col">操作</td></tr>
        <ZL:ExRepeater ID="RPT" runat="server" PageSize="10" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='8'><div class='text-center'>" OnItemCommand="RPT_ItemCommand" PageEnd="</div></td></tr>">
            <ItemTemplate>
                <tr>
                    <td scope="col"><input type="checkbox" name="idchk" value="<%#Eval("ID") %>" /></td>
                    <td scope="col"><%#Eval("TermName") %></td>
                    <td scope="col"><%#Eval("premoning") %></td>
                    <td scope="col"><%#Eval("moring") %></td>
                    <td scope="col"><%#Eval("afternoon") %></td>
                    <td scope="col"><%#Eval("evening") %></td>
                    <td scope="col"><%#Eval("weekday") %></td>
                    <td scope="col"><%#ComRE.GetNoEmptyStr(Eval("Alias",""),Eval("UserName","")) %></td>
                    <td scope="col">
                        <a href="SchConfig.aspx?id=<%#Eval("ID") %>" class="option_style" title="查看"><i class="zi zi_edit"></i></a>
                        <asp:LinkButton runat="server" CommandName="Del"  OnClientClick="return confirm('是否删除!')" CommandArgument='<%#Eval("ID") %>' CssClass="option_style"><i class="zi zi_trashalt"></i>删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </table>
        </div>
    <script>
		$(function(){
		//导航处理
			$("#usernav1 ul li").removeClass("active").siblings().eq(3).addClass("active");
		})
    </script>
</asp:Content>

