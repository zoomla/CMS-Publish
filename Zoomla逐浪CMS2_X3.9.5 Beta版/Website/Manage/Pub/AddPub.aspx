<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPub.aspx.cs" Inherits="ZoomLaCMS.Manage.Pub.AddPub" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script src="/JS/Common.js" type="text/javascript"></script>
<title>互动信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="us_seta" id="manageinfo" runat="server">
	<asp:DetailsView ID="DetailsView1" runat="server" CssClass="table table-bordered table-striped">
		<Fields>
		</Fields>
		<FooterStyle Font-Bold="True" BackColor="#FFFFFF" />
		<CommandRowStyle Font-Bold="True" CssClass="tdbgleft" />
		<RowStyle />
		<FieldHeaderStyle Font-Bold="True" />
		<PagerStyle HorizontalAlign="Center" />
		<HeaderStyle Font-Bold="True" />
		<EditRowStyle />
		<AlternatingRowStyle />
	</asp:DetailsView>
	<br />
        <table class="table table-bordered table-striped">
            <tr>
                <td class="td_m text-right">标题：</td>
                <td>
                    <asp:TextBox ID="TextBox1" class=" form-control text_300" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="text-right">内容：</td>
                <td>
                    <asp:TextBox ID="tx_PubContent" class="form-control" runat="server" Height="107px" TextMode="MultiLine" Width="456px"></asp:TextBox>
                </td>
            </tr>
            <asp:Literal ID="ModelHtml" runat="server"></asp:Literal>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="EBtnSubmit" Text="保存" OnClick="EBtnSubmit_Click" runat="server" CssClass="btn btn-info" />
                        <a href="Pubsinfo.aspx?Pubid=<%=PubID %>" class="btn btn-info">返回列表</a>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
 </asp:Content>