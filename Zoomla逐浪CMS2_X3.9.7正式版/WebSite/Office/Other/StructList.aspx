<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StructList.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Other.StructList" MasterPageFile="~/Office/OAMain.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>组织结构</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="container-fluid mt-1">
	<div class="row">
    <div id="nodeNav" class="col-12 col-md-2">
        <div>
            <div class="tvNavDiv">
                <div class="left_ul">
                    <asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
                </div>
            </div>
            <span style="color: green;" runat="server" id="remind" visible="false" />
        </div>
    </div>
    <div class="col-12 col-md-10">
        <table id="EGV" class="table table-striped table-bordered table-hover" >
           <tr>
	        <td></td>
	        <td><asp:LinkButton runat="server" ID="ID_A" CommandArgument="AscID" OnClick="OrderBtn_Click">ID<i class='zi zi_arrowUp order_img'></i></asp:LinkButton></td>
	        <td>会员名</td>
	        <td>工号</td>
	      <%--  <td>部门名</td>--%>
	        <td><asp:LinkButton runat="server" ID="Addtime_A" CommandArgument="Addtime" OnClick="OrderBtn_Click">注册时间<i class='zi zi_arrowUp order_img'></i></asp:LinkButton></td>
	        <td><asp:LinkButton runat="server" ID="point_A" CommandArgument="point" OnClick="OrderBtn_Click">积分<i class='zi zi_arrowUp order_img'></i></asp:LinkButton></td>
	        <td><asp:LinkButton runat="server" ID="LoginTimes_A" CommandArgument="LoginTimes" OnClick="OrderBtn_Click">登录次数<i class='zi zi_arrowUp order_img'></i></asp:LinkButton></td>
	        <td><asp:LinkButton runat="server" ID="AuthTime_A" CommandArgument="AscAuthTime" OnClick="OrderBtn_Click">最后登录时间<i class='zi zi_arrowUp order_img'></i></asp:LinkButton></td>
	        <td>状态</td>
          </tr>
           <ZL:ExRepeater runat="server" ID="RPT" PageSize="10" PagePre="<tr><td><input type='checkbox' id='AllID_Chk'></td><td colspan='12'><div class='text-center'>" PageEnd="</div></td></tr>">
	        <ItemTemplate>
	          <tr ondblclick="location='UserInfo.aspx?id=<%# Eval("UserID") %>';">
		        <td><input type="checkbox" name="chkSel" value='<%# Eval("UserID") %>' /></td>
		        <td><%#Eval("UserID") %></td>
		        <td><a href="/user/Info/UserInfo?id=<%# Eval("UserID") %>" target="_blank"><%#Eval("HoneyName") %></a></td>
		        <td><%#Eval("WorkNum") %></td>
		        <td><%#Eval("RegTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
		        <td><%#Eval("UserExp") %></td>
		        <td><%#Eval("LoginTimes") %></td>
		        <td><%#Eval("LastLoginTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
		        <td>
                   <%-- <%#GetStatus(Eval("Status","{0}")) %>--%>
		        </td>
	          </tr>
	        </ItemTemplate>
	        <FooterTemplate></FooterTemplate>
          </ZL:ExRepeater>
        </table>
    </div>
	</div>
        </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        function ShowOrderIcon(id) {
            $("#" + id).find(".order_img").show();
        }
    </script>
</asp:Content>