<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ProductManage" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Import Namespace="ZoomLa.Common" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>商品列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="BreadDiv" class="container-fluid mysite">
<div class="row">
    <ol id="BreadNav" class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
        <li class="breadcrumb-item"><a href='ProductManage.aspx'><%=Resources.L.商城管理 %></a></li>
        <li class='breadcrumb-item'><a href='ProductManage.aspx'><%=Resources.L.商品列表 %></a></li>
        <li class='breadcrumb-item active'><a href='<%=ZoomLa.BLL.SafeSC.RawUrl %>'>
            <asp:Label ID="NodeName_L" runat="server" Text="全部商品"></asp:Label></a></li>
        <div class="pull-right ml-auto">
            <span>
                <span onclick="showstore(this);" class="zi zi_thead" title="按店铺筛选" > </span>
                <a href="/Class_<%:NodeID<=0?2:NodeID %>/Default.aspx" target="_blank" title="<%=Resources.L.前台浏览 %>"> <i class="zi zi_eye" zico="眼睛"></i></a>
                <i onclick="opentitle('<%:NodeID %>','<%=Resources.L.配置本节点 %>');" class="zi zi_cog deploy_icon" title="<%=Resources.L.配置本节点 %>" ></i>
            </span>
        </div>
    </ol>
	</div>
	</div>
    <div class="clearfix list_choice"></div>
    <div id="store_list" style="display:none;">
        <label class="btn btn-info btn-sm store_btn" id="store_-100"data-storeid="-100">全部</label>
        <asp:Literal ID="StoreHtml_L" runat="server" />
    </div>
    <div class="alert alert-secondary shop_operation" id="commodity_cz" >
        <%=Resources.L.商品操作 %>：<asp:Literal runat="server" ID="lblAddContent"></asp:Literal>
        <span class="pull-right visible-xs visible-sm">
            <input type="button" class="btn btn-success" onclick="opentitle(<%:NodeID %>,'<%=Resources.L.配置本节点 %>    ');" value="<%=Resources.L.节点选择 %>" /></span>
        <div id="help" class="pull-right text-center">
            <span><%=Resources.L.商品数 %>：</span><span runat="server" id="countsp"></span>
            <a href="javascript::" id="sel_btn"><i class="zi zi_search" zico="搜索"></i></a>
        </div>
        <div id="sel_box" class="m_sel_box">
            <div>
                <div class="input-group">
                    <asp:DropDownList ID="StoreType_DP" CssClass="form-control" Width="120" runat="server" AutoPostBack="true" OnSelectedIndexChanged="StoreType_SelectedIndexChanged">
                        <asp:ListItem Value="-100" Text="全部" />
                        <asp:ListItem Value="0" Text="仅商城" />
                        <asp:ListItem Value="-1" Text="仅店铺" />
                    </asp:DropDownList>
                    <asp:DropDownList ID="SType_DP" CssClass="form-control" Width="120" runat="server">
                        <asp:ListItem Value="ProName" Text="商品名称" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="ID" Text="商品ID"></asp:ListItem>
                        <asp:ListItem Value="StoreID" Text="店铺ID"></asp:ListItem>
                        <asp:ListItem Value="adduser" Text="录入者"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="SKey_T" placeholder="<%$Resources:L,商品名称 %>" runat="server" CssClass="form-control text_md" />
                    <span class="input-group-append">
                        <asp:Button ID="Search_Btn" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-outline-secondary" OnClick="Search_Btn_Click" />
                    </span>
                </div>
            </div>
            <div >
                <div class="input-group">
					<div class="input-group-prepend">
					<span class="input-group-text">排序筛选</span>
				  </div>
                    <asp:DropDownList ID="txtbyfilde" CssClass="form-control max20rem" runat="server" OnSelectedIndexChanged="txtbyfilde_SelectedIndexChanged">
                        <asp:ListItem Value="">请选择字段</asp:ListItem>
                        <asp:ListItem Value="ID">ID</asp:ListItem>
                        <asp:ListItem Value="AddTime">添加时间</asp:ListItem>
                        <asp:ListItem Value="UpdateTime">更新时间</asp:ListItem>
                        <asp:ListItem Value="AllClickNum">浏览数</asp:ListItem>
                        <asp:ListItem Value="Dengji">推荐级别</asp:ListItem>
                        <asp:ListItem Value="Stock">库存</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="txtbyOrder" CssClass="form-control max20rem" runat="server" OnSelectedIndexChanged="txtbyOrder_SelectedIndexChanged">
                        <asp:ListItem Value="desc">降序</asp:ListItem>
                        <asp:ListItem Value="asc">升序</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="quicksouch"  CssClass="form-control max20rem" runat="server" AutoPostBack="True" OnSelectedIndexChanged="quicksouch_SelectedIndexChanged">
                        <asp:ListItem Value="1" Text="<%$Resources:L,所有商品 %>"></asp:ListItem>
                        <asp:ListItem Value="2" Text="<%$Resources:L,正在销售的商品 %>"></asp:ListItem>
                        <asp:ListItem Value="3" Text="<%$Resources:L,未销售的商品 %>"></asp:ListItem>
                        <asp:ListItem Value="5" Text="<%$Resources:L,特价处理的商品 %>"></asp:ListItem>
                        <asp:ListItem Value="6" Text="<%$Resources:L,所有热销的商品 %>"></asp:ListItem>
                        <asp:ListItem Value="7" Text="<%$Resources:L,所有新品 %>"></asp:ListItem>
                        <asp:ListItem Value="8" Text="<%$Resources:L,所有精品商品 %>"></asp:ListItem>
                        <asp:ListItem Value="9" Text="<%$Resources:L,有促销活动的商品 %>"></asp:ListItem>
                        <asp:ListItem Value="10" Text="<%$Resources:L,实际库存报警的商品 %>"></asp:ListItem>
                        <asp:ListItem Value="11" Text="<%$Resources:L,预定库存报警的商品 %>"></asp:ListItem>
                        <asp:ListItem Value="12" Text="<%$Resources:L,已售完的商品 %>"></asp:ListItem>
                        <asp:ListItem Value="15" Text="<%$Resources:L,所有礼品 %>"></asp:ListItem>
                        <asp:ListItem Value="16" Text="<%$Resources:L,已审核商品 %>"></asp:ListItem>
                        <asp:ListItem Value="17" Text="<%$Resources:L,待审核商品 %>"></asp:ListItem>
                        <asp:ListItem Value="20" Text="组合商品"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ShowImport() {
            $("#divImp").show("middle");
        }
    </script>
    <div id="divImp" class="divline">
        <%=Resources.L.导入商城 %>：<ZL:FileUpload runat="server" Style="display: inline;" ID="FileUpload1" />
        <asp:Button ID="btImport" runat="server" Text="<%$Resources:L,导入 %>" OnClick="btImport_Click" class="btn btn-default" />
        <asp:LinkButton ID="lbtnSaveTempter" runat="server" OnClick="lbtnSaveTempter_Click" CausesValidation="true">
            <span style="color: #0E529D;"><%=Resources.L.下载 %><asp:Label runat="server" ID="NodeName_L1"></asp:Label>
                的<asp:Label runat="server" ID="Item_L1"></asp:Label>
                <%=Resources.L.模型CSV导入模板 %></span>
        </asp:LinkButton>(<%=Resources.L.下载后用EXCEL打开从第二行开始按规范填写并保存即可 %>)
    </div>
	<div class="table-responsive-md">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="id" PageSize="20" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover " EnableTheming="False" EnableModelValidation="True" EmptyDataText="<%$Resources:L,无相关数据 %>">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("id") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID"  DataField="ID" />
            <asp:TemplateField HeaderText="<%$Resources:L,商品图片 %>">
                <HeaderStyle  />
                <ItemTemplate>
                    <a href="ShowProduct.aspx?id=<%#Eval("id")%>">
                        <img src="<%#getproimg() %>" class="img_3rem" onerror="shownopic(this);" />
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,商品名称 %>">
                <ItemTemplate>
                    <div class="Ctitle sys_userPopver" onmouseover="ShowPopover(this)">
                        <div class="max20rem">
                            <%#GetNode() %>
                            <a href="<%#Eval("Class","").Equals("2") ? "Arrive/SuitProAdd.aspx?id="+Eval("ID") : "ShowProduct.aspx?id="+ Eval("id") %>"><%#Eval("ProName") %></a>
                        </div>
                        <%#GetGroupPro() %>
                        <div class="popover bs-popover-right popbox">
                            <div class="arrow"></div>
                            <h3 class="popover-header">商品概览<a href="javasvript:;" class="hidePopover"><i class="zi zi_times" zico="错号粗黑"></i></a></h3>
                            <div class="popover-body">
                                <table>
                                    <tr><td scope="col" class="text-right">发布者：</td><td scope="col"><%#Eval("AddUser") %></td></tr>
                                    <tr><td scope="col">发布时间：</td><td scope="col"><%#Eval("AddTime") %></td></tr>
                                    <tr><td scope="col">所在店铺：</td><td scope="col"><%# string.IsNullOrEmpty(Eval("StoreName","")) ? "自营商城" : Eval("StoreName","") %></td></tr>
                                    <tr>
                                        <td scope="col" colspan="2" class="text-right">
                                            <asp:LinkButton runat="server" CommandName="refresh" CommandArgument='<%#Eval("ID") %>' ><i class="zi zi_redoalt" zico="重做标识"></i>刷新</asp:LinkButton>
                                            <asp:LinkButton runat="server" CommandName="audit" Visible='<%# !Eval("IsTrue","").Equals("1") %>' CommandArgument='<%#Eval("ID") %>' >审核</asp:LinkButton>
                                            <asp:LinkButton runat="server" CommandName="unaudit" Visible='<%# Eval("IsTrue","").Equals("1") %>'  CommandArgument='<%#Eval("ID") %>' >取消审核</asp:LinkButton>/
                                            <asp:LinkButton runat="server" CommandName="unsales" Visible='<%# Eval("Sales","").Equals("1") %>' CommandArgument='<%#Eval("ID") %>' >停售</asp:LinkButton>
                                            <asp:LinkButton runat="server" CommandName="sales" Visible='<%# !Eval("Sales","").Equals("1") %>' CommandArgument='<%#Eval("ID") %>' >取消停售</asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,录入者 %>" DataField="AddUser"  />
            <asp:BoundField HeaderText="<%$Resources:L,单位 %>" DataField="ProUnit"  />
            <asp:TemplateField HeaderText="<%$Resources:L,库存 %>">
                <ItemTemplate>
                    <a onclick="showStock(<%#Eval("ID") %>);" title="库存管理"><%#ShowStockNum()%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,价格 %>">
                <ItemTemplate>
                    <%#GetPrice()%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,类型 %>">
                <ItemTemplate>
                    <%#formatnewstype(Eval("ProClass",""))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,商品属性 %>">
                <ItemTemplate>
                    <%#GetProAttr() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,销售中 %>">
                <ItemTemplate>
                    <%#formattype(DataBinder.Eval(Container,"DataItem.Sales","{0}"))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,状态 %>">
                <ItemTemplate>
                    <%#GetStatus() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,排序 %>">
                <ItemTemplate>
                    <asp:LinkButton ID="UpMove"  CommandName="UpMove" CommandArgument='<%# Eval("ID") %>' runat="server">↑<%=Resources.L.上移 %> </asp:LinkButton>
                    <asp:LinkButton ID="DownMove"  CommandName="DownMove" CommandArgument='<%# Eval("ID") %>' runat="server"><%=Resources.L.下移 %>↓</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,操作 %>" ItemStyle-CssClass="codetr">
                <ItemTemplate>
<!--                    <a class="precode" href="javascript:;" <%#Eval("istrue").ToString().Equals("1") ? "":"hidden" %> data-href="<%#GetShopUrl() %>"><i class="zi zi_qrcode"></i></a>-->
					
					<a href='ShowProduct.aspx?id=<%# Eval("ID") %>' title="预览"> <i class="zi zi_eye"></i> </a>
					<a  href='<%#Eval("Class","").Equals("2") ? "Arrive/SuitProAdd.aspx?id="+Eval("ID") : "AddProduct.aspx?id="+Eval("id") %>'> <i class="zi zi_pencilalt" title="<%=Resources.L.编辑 %>"></i>编辑</a>
					 <a  href="<%#GetShopUrl() %>" target="_blank" title="<%=Resources.L.浏览 %>"> <i class="zi zi_globe" zico="全球"></i>浏览</a>
					 <a  href="javascript:;" onclick="showStock(<%#Eval("ID") %>);"><i class="zi zi_warehouse" zico="仓库黑"></i>库存</a>
					 	
					<button type="button" class="btn btn-link sys_precode_btn" data-toggle="tooltip" data-html="true" title="<div class='sys_precode'><img src='/common/common.ashx?url=<%Call.Label("{$SiteURL/}"); %>/shop/<%# Eval("ID") %>.aspx' alt=''/><div> "><i class="zi zi_qrcode" zico="二维码"></i></button>
                    <asp:LinkButton runat="server"  CommandName="Del1" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('确定要将商品移入回收站吗');"><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i></asp:LinkButton>
                    <%# Eval("Largess","").Equals("1") ? "<a href=\"javascript:;\" class=\"\" onclick=\"showBindUser('"+ Eval("ID","") +"');\"><i class=\"zi zi_user\"></i>特选用户</a>" : "" %>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
	<div class="container-fluid pr-0">
    <div class="row sysRow">
		<div class="input-group d-flex flex-wrap ml-2">
        <span class="input-group-append d-flex flex-wrap">
			<asp:Button ID="Button1" runat="server" Text="<%$Resources:L,开始销售 %>" OnClick="Button1_Click" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button2" runat="server" Text="<%$Resources:L,设为热卖 %>" OnClick="Button2_Click" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button6" runat="server" Text="<%$Resources:L,设为精品 %>" OnClick="Button6_Click" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button5" runat="server" Text="<%$Resources:L,设为新品 %>" OnClick="Button5_Click" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button3" runat="server" Text="<%$Resources:L,批量删除 %>" CssClass="btn btn-outline-info" OnClick="Button3_Click" OnClientClick="return confirm('确定要将商品移入回收站吗'); " />
            <asp:Button ID="Button4" runat="server" Text="<%$Resources:L,停止销售 %>" OnClick="Button4_Click" CssClass="btn btn-outline-info" />
			<asp:Button ID="Button7" runat="server" Text="<%$Resources:L,取消热卖 %>" OnClick="Button7_Click" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button8" runat="server" Text="<%$Resources:L,取消精品 %>" OnClick="Button8_Click" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button9" runat="server" Text="<%$Resources:L,取消新品 %>" OnClick="Button9_Click" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button10" runat="server" Text="<%$Resources:L,批量移动 %>" OnClick="btnMove_Click" UseSubmitBehavior="true" CssClass="btn btn-outline-info" />
            <asp:Button ID="Button11" runat="server" Text="<%$Resources:L,批量审核 %>" UseSubmitBehavior="true" OnClick="Button11_Click" class="btn btn-outline-info" />
            <asp:Button ID="Button12" runat="server" Text="<%$Resources:L,取消审核 %>" UseSubmitBehavior="true" OnClick="Button12_Click" class="btn btn-outline-info" />
        </span>
    	</div>
        <div>
            <strong><%=Resources.L.商品属性中的各项含义 %>：</strong>
            <span class="text-primary"><%=Resources.L.精 %></span>----<%=Resources.L.推荐精品 %>， 
                <span class="text-danger"><%=Resources.L.热 %></span>----<%=Resources.L.热门商品 %>， 
                <span class="text-success"><%=Resources.L.新 %></span>----<%=Resources.L.推荐新品 %>， 
                <span class="text-primary"><%=Resources.L.图 %></span>----<%=Resources.L.有商品缩略图 %>， 
                <span class="text-warning"><%=Resources.L.绑 %></span>----<%=Resources.L.捆绑商品销售 %>
        </div>
    </div>
	</div>
    <asp:HiddenField ID="ModelID_Hid" runat="server" />
    <div runat="server" id="GroupPro_L" style="display: none;">
    </div>
	<style>
.popover.fade.bs-popover-left{width: 170px;}
.popover.fade.bs-popover-left .popover-body{height: 160px;}
</style>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Modal/shopbll.js"></script>
    <script>
        $(function(){
            $("#store_<%=StoreID%>").addClass("active");
        });
        var diag = new ZL_Dialog();
        function opentitle(nid, title) {
            if (!nid||nid == 0) alert("尚未选择节点");
            else {
                var url = "../Content/Node/EditNode.aspx?NodeID=" + nid;
                diag.url = url;
                diag.title = title;
                diag.ShowModal();
            }
        }
        //HideColumn("1,4,5,6,7,8,9,10,11,12");
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
        var product={};
        product.init=function(){
            $(".grouppro_btn").popover({
                animation: true, html: true, trigger: "manual", placement: 'right', title: "商品分组 <a href='javascript:;' class='popClose' title='关闭' onclick='pop.close(this);'><i class='zi zi_expandarrowsalt'></a>",
                content: function () {
                    var id="#sgp_"+$(this).data("pid");
                    return $(id).html();
                }
            }).click(function(){
                var $this=$(this);
                $(".grouppro_btn").not(this).popover("hide");
                $this.popover("show");
            });
        }
        product.init();
        $(function(){
            pop.bindEvent($(".precode"));
        });
        function showStock(id)
        {
            var url="/AdminMVC/Product/StockAdd?ProID="+id;
            comdiag.maxbtn=false;
            comdiag.ShowModal(url,"库存管理");
        }
        function showsuit(id){
            var url = "/common/comp/SuitPro.aspx?id=" + id
            comdiag.maxbtn = false;
            comdiag.width = 600;
            comdiag.reload = true;
            comdiag.ShowModal(url, "促销组合");
        }
        function showBindUser(id){
            var url = "Addon/ShowProBindUser.aspx?proid=" + id;
            comdiag.maxbtn = false;
            comdiag.width = 600;
            comdiag.reload = true;
            comdiag.ShowModal(url, "特选商品");
        }
        var pop = { href:'' };
        pop.close=function(btn)
        {
            var id= $(btn).closest(".popover").attr("id");
            $("#"+id).popover("hide");
        }
        
        function ShowPopover(obj) {
			$(".popbox").hide();
            $(obj).find(".popover").show();
        }
        $(".hidePopover").click(function(){
		$(this).parent(".popbox").hide();
		$(".popbox").hide();
		})
		
        //店铺筛选
        $(".store_btn").click(function(){
            location.href="ProductManage.aspx?storeid="+$(this).data("storeid");
        });
        function showstore(btn){
            var $this = $(btn);
            if ($("#store_list").css("display") == "none") {
                $this.removeClass("fa-caret-right").addClass("fa-caret-down");
                $("#store_list").slideDown(300);
            }
            else {
                $this.removeClass("fa-caret-down").addClass("fa-caret-right");
                $("#store_list").slideUp(200);
            }
        }
		//下拉菜单
		$("#commodity_cz .btn-group li").addClass("dropdown-item");
		
		//冒泡
		$(function () {
		  $('[data-toggle="tooltip"]').tooltip()
		})

    </script>
    <script runat="server">
        public string ShowStockNum()
        {
            string str = "";
            int stock = DataConverter.CLng(Eval("stock"));
            int stockDown = DataConverter.CLng(Eval("StockDown"));
            if (stock <= stockDown)
            {
                str = "<font color=red>" + stock + " [警]</font>";
            }
            else
            {
                str = stock.ToString();
            }
            return str;
        }
    </script>
</asp:Content>
