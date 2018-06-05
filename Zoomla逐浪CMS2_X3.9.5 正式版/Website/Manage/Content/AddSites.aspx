<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSites.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.AddSites" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" runat="server" >
<title>添加站点信息</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="server">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("/{manage}/Content/Collect/CollSite.aspx","采集检索"),
	new Bread("/{manage}/Content/Collect/CollSite.aspx","子站采集"),
	new Bread() {url="", text="检索日志",addon="" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-bordered table-hover table-striped sys_table">
        <tr>
            <th class="name w12rem_lg">站点名称</th>
            <td>
                <asp:TextBox ID="SiteName_T" runat="server"  CssClass="form-control max20rem"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"  ControlToValidate="SiteName_T"
                    ErrorMessage="站点名称不能为空!" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th class="name">站点链接</th>
            <td>
                <asp:TextBox runat="server" ID="SiteUrl_T" CssClass="form-control max20rem" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2"   runat="server" ControlToValidate="SiteUrl_T"
                    ErrorMessage="站点链接不能为空!" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
                
        </tr>
        <tr>
            <th class="name">子站备注</th>
            <td>
                <asp:TextBox runat="server" ID="SiteDesc_T" CssClass="form-control max20rem"></asp:TextBox></td>
        </tr>
        <tr>
            <th class="name">站点密钥</th>
            <td>
                <asp:TextBox runat="server" ID="SiteKey_T"  CssClass="form-control max20rem"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3"  runat="server" ControlToValidate="SiteKey_T"  ErrorMessage="站点密钥不能为空!" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th class="name">需获取的节点</th>
            <td>
				<div class="input-group ">
				  <asp:TextBox runat="server" ID="Nodes_T" CssClass="form-control max20rem" s></asp:TextBox>
				  <div id="port_btns" class="input-group-append">
					  <input type="button" value="选择" onclick="ShowDiv('node_div');" class="btn btn-outline-info" />
				  </div>
		  		</div>
				<small class="text-muted">为空代表所有节点</small>
            </td>
        </tr>
            <tr>
                <td colspan="2"><asp:Button CssClass="btn btn-info" OnClick="Save_Btn_Click" ID="Save_Btn" runat="server" Text="添加站点" /></td>
            </tr>
    </table>
</div>
</div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="server">    
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script>
	function CloseDiv(id)
	{
		$("#" + id).hide();
	}
	var nodediag = new ZL_Dialog();
	function ShowDiv(id)
	{
		var url = $("#SiteUrl_T").val();
		if (!url || url == "") {
			alert("站点地址不能为空!");
		}
		else {
			if (url.indexOf("http://") < 0) url = "http://" + url;
			if (url.lastIndexOf("/") != url.length - 1) url = url += "/";
			nodediag.maxbtn = false;
			nodediag.title = "远程节点选择" + "来源：" + url;
			nodediag.url = "/Common/NodeList.aspx?SiteUrl=" + url;
			nodediag.ShowModal();
		}
	}
	function DealResult(nodeArr)
	{
	    var ids = "";
	    for (var i = 0; i < nodeArr.length; i++) {
	        ids += nodeArr[i].nodeid+",";
	    }
	    $("#Nodes_T").val(ids);
	    nodediag.CloseModal();
	}
</script>
</asp:Content>