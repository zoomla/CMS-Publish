<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowJSCode.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.ShowJSCode" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>获取广告代码</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
    new Bread("/{manage}/Main.aspx","工作台"),
    new Bread("ADManage.aspx","广告管理"),
	new Bread() {url="", text="获取广告代码",addon="" }}
    )
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-striped table-bordered table-hover">
	<tr class="tdbg">
		<td align="left" class="pb-2">
			<asp:TextBox ID="TxtZoneCode" runat="server" TextMode="MultiLine" class="form-control" Style="max-width: 578px; min-height:10rem;margin:0.6rem;"></asp:TextBox>
			&nbsp;
			<input id="Button1" type="button" value="获取广告代码" class="btn btn-info"  />
			<input id="Button2" type="button" value="返回列表" class="btn btn-outline-info" onclick="javascript: history.back()" /></td>
	</tr>
	<tr class="tdbg">
		<td align="left" style="padding-left: 60px;">
			<span style="color: Grey">调用方法：点击按钮复制代码，粘贴到网页模板中的指定位置（飘、悬浮类广告放于模板最下方）即可。</span></td>
	</tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
	/*function copy() {
		var innerHTML = "复制广告JS失败您的浏览器不支持复制，请手动复制代码。";
		if (window.clipboardData) {
			innerHTML = "复制广告JS成功您现在可以将代码粘贴（ctrl+v）到网页中预定位置。";

			var str = $("#TxtZoneCode").html();
			while (str.indexOf("&lt;") >= 0) {
				str = str.replace("&lt;", "<");
			}
			while (str.indexOf("&gt;") >= 0) {
				str = str.replace("&gt;", ">");
			}

			window.clipboardData.setData("Text", str);
			alert(innerHTML);
		}
		else { alert(innerHTML); }
	}*/
	
	//拷贝 复制
    var clipboard = new ClipboardJS('#Button1', {
        text: function() {
			var Codetext = $("#TxtZoneCode").val();
			//console.log(Codetext);
            return Codetext;
        }
    });
    clipboard.on('success', function(e) {
        //console.log(e);
		alert("复制完成");
    });

    clipboard.on('error', function(e) {
        //console.log(e);
		alert("复制失败");
    });
</script>
</asp:Content>