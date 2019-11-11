<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SToS.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Addon.SToS"  MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SPwd.ascx" TagPrefix="uc1" TagName="SPwd" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>站点迁移工具</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
	new Bread() {url="", text="站点拷贝工具",addon="" }}
	)
%>
<div class="list_choice">
    <uc1:SPwd runat="server" ID="SPwd" Visible="false" />
	
    <div runat="server" id="maindiv" visible="false">
            <div runat="server" id="step1" >
	<div class="container-fluid pr-0">
	<div class="row sysRow">
     <table class="table table-bordered table-striped">
         <tr><th scope="col"></th><th scope="col">数据库IP</th><th scope="col">数据库名</th><th scope="col">用户名</th><th scope="col">密码</th></tr>
         <tr><th>来源数据库</th>
             <td><asp:TextBox runat="server" ID="SIP_T" CssClass="form-control max20rem"/></td>
             <td><asp:TextBox runat="server" ID="SDBName_T" CssClass="form-control max20rem"/></td>
             <td><asp:TextBox runat="server" ID="SUName_T" CssClass="form-control max20rem"/></td>
             <td><asp:TextBox runat="server" ID="SPwd_T" CssClass="form-control max20rem" TextMode="Password"/></td>
         </tr>
         <tr><th>目标数据库:
<%--             <asp:Button runat="server" ID="UserLocal_Btn" 
                 CssClass="btn btn-xs btn-info" Text="使用本站连接" OnClick="UserLocal_Btn_Click" /></td>--%>
             <td><asp:TextBox runat="server" ID="TIP_T" CssClass="form-control max20rem" disabled="disabled" /></td>
             <td><asp:TextBox runat="server" ID="TDBName_T" CssClass="form-control max20rem" disabled="disabled" /></td>
             <td><asp:TextBox runat="server" ID="TUName_T" CssClass="form-control max20rem" disabled="disabled" /></td>
             <td><asp:TextBox runat="server" ID="TPwd_T" CssClass="form-control max20rem" Text="******" disabled="disabled"/></td>
         </tr>
     </table>
	 <div class="alert alert-light">
    <asp:Button runat="server" ID="Next_Btn" CssClass="btn btn-outline-info" Text="下一步" OnClick="Next_Btn_Click"/></div>
	 </div>
    </div>
</div>
    <div runat="server" id="step2" visible="false">
        <ul class="col-lg-6 col-md-6 col-xs-6 col-sm-6 nodeul">
                <li class="titleli"><i class="zi zi_database"></i>本站数据库</li>
            <asp:Literal runat="server" ID="Nodes_Li"></asp:Literal>
            
        </ul>
        <ul class="col-lg-6 col-md-6 col-xs-6 col-sm-6 nodeul">
            <li class="titleli"><i class="zi zi_clouddownload"></i>外部数据库</li>
            <asp:Literal ID="SNodes_Li" runat="server"></asp:Literal>
            
        </ul>
       <div style="position:fixed;width:100%;background:#fff;text-align:center; padding:5px;bottom:1px;border-radius:3px;border:1px solid #ccc;box-shadow:0 4px 20px 1px rgba(0,0,0,0.2);">
            <asp:Button runat="server" ID="Pre_Btn" CssClass="btn btn-outline-info" Text="上一步" OnClick="Pre_Btn_Click" />
        <asp:Button runat="server" ID="Check_Btn" CssClass="btn btn-outline-info" Text="下一步" OnClick="Check_Btn_Click" OnClientClick="return NodesCheck();" />
       </div>
    </div>
    <div runat="server" id="step3" visible="false">
        <table class="table table-bordered table-stirped">
            <tr><td><span>外部节点：</span><asp:Label runat="server" ID="SNode_L" /></td></tr>
            <tr><td><span>本站节点：</span><asp:Label runat="server" ID="TNode_L" /></td></tr>
            <tr>
                 <td>
                     <ul id="modelul" class="modelul">
                     <asp:Repeater runat="server" ID="ModelRPT" OnItemDataBound="ModelRPT_ItemDataBound">
                         <ItemTemplate>
                             <li>
                                 <input type="hidden" id="modelid_hid" value="<%#Eval("ModelID") %>" />
                                 <span>外部模型:</span><span id="mname_sp" class="btn btn-default"><%#Eval("ModelName") %></span>
                                 <span class="zi zi_arrowRight" style="font-size:1.5em;"></span>
                                 <asp:DropDownList runat="server" ID="Model_DP" CssClass="form-control text_md" DataTextField="ModelName" DataValueField="ModelID"></asp:DropDownList>
                                 <input type="button" class="btn btn-info" value="查看详情" onclick="ShowDiag(this,'<%#Server.UrlEncode(Eval("ModelName","{0}"))%>    ');" />
                             </li>
                         </ItemTemplate>
                     </asp:Repeater></ul>
                 </td>
            </tr>
            <tr><td>
                <asp:Button runat="server" ID="PreTo2_Btn" CssClass="btn btn-outline-info" OnClick="PreTo2_Btn_Click" Text="上一步" />
                <asp:Button runat="server" ID="Sure_Btn" CssClass="btn btn-outline-info" OnClick="Sure_Btn_Click" Text="确定拷贝" OnClientClick="return ModelStrCheck(this);" /></td></tr>
        </table>
	</div>
	</div>
    <asp:HiddenField runat="server" ID="snids_hid" />
    <asp:HiddenField runat="server" ID="tnid_hid" />
    <asp:HiddenField runat="server" ID="modelstr_hid" />
    <asp:HiddenField runat="server" ID="conn_hid" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        function NodesCheck() {
            if ($("[name=Tid_Rad]:checked").length < 1 || $("[name=Sid_Chk]:checked").length < 1) {
                alert("来源与目标节点不能为空");
                return false;
            }
            return true;
        }
        $().ready(function(){
            $(".parent_node input").click(function(){
                $parent=$(this).closest('li');
                if($parent.find(".icon").hasClass('fa-folder')){
                    $parent.next().show();
                    $parent.find(".icon").removeClass('fa-folder');
                    $parent.find(".icon").addClass('fa-folder-open');
                }else{
                    $parent.next().hide();
                    $parent.find(".icon").removeClass('fa-folder-open');
                    $parent.find(".icon").addClass('fa-folder');
                }
            });
        });
        function ModelStrCheck(obj) {
            $liarr = $("#modelul li");
            var modelstr = "";
            for (var i = 0; i < $liarr.length; i++) {
                var $li = $($liarr[i]);
                var smid = $li.find("#modelid_hid").val();
                var tmid = $li.find("#Model_DP").val(); 
                if (smid == "" || tmid == "") { alert("[" + $li.find("#mname_sp").text() + "]" + "未指定对应模型"); return false; }
                modelstr += smid + ":" + tmid + ",";
            }
            $("#modelstr_hid").val(modelstr);
            disBtn(obj);
            disBtn($("#PreTo2_Btn")[0]);
            return true;
        }
        var diag = new ZL_Dialog();
        function ShowDiag(obj,smname) {
            $li=$(obj).closest("li");
            var smid = $li.find("#modelid_hid").val();
            var tmid = $li.find("#Model_DP").val();
            if (smid == "" || tmid == "") { alert("[" + $li.find("#mname_sp").text() + "]" + "未指定对应模型"); return false; }
            diag.title = "模型对比";
            diag.backdrop = true;
            diag.maxbtn = false;
            diag.url = "ModelContract.aspx?smid=" + smid + "&tmid=" + tmid + "&smname=" + smname + "&conn=<%=Server.UrlEncode(conn_hid.Value)%>";
            diag.ShowModal();
        }

    </script>
</asp:Content>
