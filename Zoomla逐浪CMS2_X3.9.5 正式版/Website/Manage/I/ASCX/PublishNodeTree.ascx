<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishNodeTree.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.PublishNodeTree" %>
<div id="nodeNav">
<div class="NodeTree_left_ul">
	<asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
</div>
<span style="color: green;" runat="server" id="remind" visible="false" />
</div>
<script>
$("body").ready(function () {

});
function ShowMain(data, id) {
$(data).next().animate({ height: 'toggle' }, 200);
setTimeout("ShowInfo(" + id + ")", 200);
}
</script>