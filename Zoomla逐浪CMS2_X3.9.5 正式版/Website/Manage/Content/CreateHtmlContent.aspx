<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Manage/I/Index.master" CodeBehind="CreateHtmlContent.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.CreateHtmlContent" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title><%=Resources.L.发布管理 %></title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ContentManage.aspx","内容管理"),
        new Bread() {url="/{manage}/Content/CreateHtmlContent.aspx", text="生成发布",addon="" }}
		)
    %>
  <div class="Creat_tips list_choice">
    <div class="alert alert-info alert-dismissible fade show">
      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
      <h5>提示：</h5>
      <p class="pl-5"> <strong> <span class='zi zi_exclamationTriangle text-danger'></span>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <asp:LinkButton ID="btnCreate" OnClick="btnCreate_Click" runat="server"  CssClass="btn btn-info" ><%=Resources.L.发布主页 %>>></asp:LinkButton>
        </strong> </p>
        <p><%=Resources.L.对应栏目页需在 %><a class="text-primary" href="<%=CustomerPageAction.customPath2%>Config/SiteInfo.aspx">[<%=Resources.L.系统设置 %>]</a>-<a class="text-primary" href="<%=CustomerPageAction.customPath2%>Content/Node/NodeManage.aspx">[<%=Resources.L.节点管理 %>]</a><%=Resources.L.对相应节点生成选项进行设置 %>，<%=Resources.L.aspx为不生成静态页 %><br />
        <%=Resources.L.发布内容页 %>，<%=Resources.L.需对内容所在节点的生成选项的中 %>，<%=Resources.L.对内容页扩展名进行设置 %>，<%=Resources.L.aspx为不生成静态页 %>。 </p>
    </div>
  </div>
  <!--top生成内容页-->
  <div>
    <ul class="nav nav-tabs">
      <li class="nav-item"><a class="nav-link active" href="#Tab1" data-toggle="tab"><%=Resources.L.快速发布 %></a></li>
      <li class="nav-item"><a class="nav-link" href="#Tab2" data-toggle="tab" onclick="ShowMenu('node');"><%=Resources.L.栏目 %></a></li>
      <li class="nav-item"><a class="nav-link" href="#Tab2" data-toggle="tab" onclick="ShowMenu('content');"><%=Resources.L.内容 %></a></li>
      <li class="nav-item"><a class="nav-link" href="#Tab4" data-toggle="tab"><%=Resources.L.单页 %></a></li>
      <li class="nav-item"><a class="nav-link" href="#Tab5" data-toggle="tab"><%=Resources.L.专题 %></a></li>
    </ul>
    <div class="tab-content container-fluid pr-0">
      <div class="tab-pane active row sysRow" id="Tab1">
        <table class="table table-bordered table-hover sys_table">
          <tr><td colspan="2" class="text-center"><strong><%=Resources.L.快速发布 %></strong></td></tr>
          <tr>
            <th class="w12rem_lg"><%=Resources.L.发布最新内容 %></th>
              <td>
				  <div class="input-group mb-3">
				  <div class="input-group-prepend">
					<span class="input-group-text"><%=Resources.L.篇 %></span>
				  </div>
				  <asp:TextBox ID="txtNewsCount" CssClass="form-control max20rem num" runat="server" placeholder="<%$Resources:L,请输入数量 %>" Text="10" ></asp:TextBox>
				  <div class="input-group-append">
					<asp:Button ID="btnNewsCount" runat="server" Text="<%$Resources:L,发布最新 %>" CssClass="btn btn-outline-info" OnClick="btnNewsCount_Click" OnClientClick="return CheckNum('txtNewsCount');"/>
				  </div>
				</div>
              </td>
          </tr>
          <tr>
            <th><%=Resources.L.按照ID发布 %></th>
            <td>
                <div class="input-group">
                    <asp:TextBox ID="txtIdStart" CssClass="form-control max20rem num"  runat="server" placeholder="<%$Resources:L,开始ID %>" />
                    <asp:TextBox ID="txtIdEnd" CssClass="form-control max20rem num" runat="server" placeholder="<%$Resources:L,结束ID选填 %>" />
                    <span class="input-group-append">
                       <asp:Button ID="btnCreateId" runat="server" Text="<%$Resources:L,开始发布 %>" CssClass="btn btn-outline-info" OnClick="btnCreateId_Click" OnClientClick="return CheckNum('txtIdStart');"/>
                    </span>
                </div>
            </td>
          </tr>
          <tr>
            <th><%=Resources.L.按照日期发布 %></th>
            <td>
                <div class="input-group">
                    <asp:TextBox ID="STime_T" CssClass="form-control max20rem"  runat="server" onclick="WdatePicker();" placeholder="<%$Resources:L,开始时间 %>" />
                    <asp:TextBox ID="ETime_T" CssClass="form-control max20rem" runat="server" onclick="WdatePicker();" placeholder="<%$Resources:L,结束时间 %>" />
                    <span class="input-group-append">
                        <asp:Button ID="RDate_Btn" runat="server" Text="<%$Resources:L,开始发布 %>" CssClass="btn btn-outline-info" OnClick="RDate_Click"  OnClientClick="return CheckEmpty();"/>
                    </span>
                </div>
              </td>
          </tr>
            <tr><th><%=Resources.L.定时发布首页 %></th><td>
                <div class="input-group">
                    <select id="scheTime_Sel" name="scheTime_Sel" class="form-control max20rem" >
                        <option value="0"><%=Resources.L.每天 %></option>
                <%--        <option value="1">每隔</option>--%>
                    </select>
                    <asp:TextBox runat="server" ID="scheTime_T"  CssClass="form-control max20rem" onfocus="WdatePicker({dateFmt: 'HH:mm', minDate: '0:00:00', maxDate: '25:00:00' })" />
                    <asp:TextBox runat="server" ID="scheTime_T2" CssClass="form-control max20rem" Visible="false" />
                    <span class="input-group-append">
                       <asp:Button runat="server" ID="scheSure_Btn" Text="<%$Resources:L,保存 %>" OnClick="scheSure_Btn_Click" OnClientClick="return ValidData();" CssClass="btn btn-outline-info" ValidationGroup="sch"/>
                       <a href="SchedTask.aspx" class="btn btn-outline-info"><%=Resources.L.任务管理 %></a>
                    </span>
                </div>
          <tr>
            <td class="text-right"><%=Resources.L.发布所有 %>：</td>
            <td><asp:Button ID="btnNewsContent" runat="server" Text="<%$Resources:L,发布所有内容 %>" CssClass="btn btn-outline-info" OnClick="btnNewsContent_Click" OnClientClick="return confirm('确定要将所有内容页生成Html吗?');"/></td>
          </tr>
          <tr>
            <td colspan="2">
                <div class="alert alert-info">
                    <span><strong><%=Resources.L.注意 %>：</strong></span>
                     <ul>
					 <li>如果选择了栏目，则只生成选择栏目下的内容；如果不选择直接生成的，则生成全站的内容。</li>
					 <li>合理的静态发布会提升访问效率，但也会造成缓存和管理成本。</li>
					 </ul>
                </div>
            </td>
          </tr>
        </table>
      </div>
      <div class="tab-pane row sysRow" id="Tab2"> 
             <table id="EGV" class="table table-striped table-bordered table-hover" style="margin-bottom:45px;">
                 <tr class="menu_item menu_node text-center"><td colspan="5"><strong><%=Resources.L.发布栏目首页与列表页 %></strong></td></tr>
                 <tr class="menu_item menu_content text-center"><td colspan="5"><strong><%=Resources.L.发布选定栏目的内容页 %></strong></td></tr>
	            <tr>
		            <td class="td_s"><label class="filltd"><input type="checkbox" onclick="selectAllByName(this, 'nodechk');" /></label></td>
		            <td class="td_s">ID</td>
		            <td style="width: 40%;"><%=Resources.L.节点名称 %></td>
		            <td class="td_m"><%=Resources.L.节点类型 %></td>
                    <td class="td_l"><%=Resources.L.操作 %></td>
	            </tr>
             <asp:Repeater ID="NodeRPT" runat="server" EnableViewState="false">
		        <ItemTemplate>
                    <tr data-layer="1" data-id="<%#Eval("NodeID") %>" data-pid="0" title="单击打开|收缩">
                        <td><label class="filltd"><input type="checkbox" name="nodechk" value="<%#Eval("NodeID") %>" /></label></td>
                        <td><%#Eval("NodeID") %></td>
                        <td data-child="<%#Eval("ChildCount") %>" onclick="ShowChild(this);"><%#GetIcon() %></td>
                        <td><%#GetNodeType() %></td>
                        <td>
                            <%#GetOper()%>
                            <a href="<%#"?CType=node&NodeID="+Eval("NodeID") %>" class="menu_item menu_node"><%=Resources.L.生成节点 %></a>
                            <a href="<%#"?CType=content&NodeID="+Eval("NodeID") %>" class="menu_item menu_content"><%=Resources.L.生成内容 %></a>
                        </td>
                    </tr>
		        </ItemTemplate>
	        </asp:Repeater>
        </table>
          <div class="Conent_fix menu_item menu_node">
                <asp:Button ID="btnCreateColumn"    runat="server" Text="<%$Resources:L,发布选定栏目 %>" CssClass="btn btn-info" OnClick="btnCreateColumn_Click"  OnClientClick="return CheckNode();"/>
                <asp:Button ID="btnCreateColumnAll" runat="server" Text="<%$Resources:L,发布所有栏目 %>" CssClass="btn btn-info" OnClick="btnCreateColumnAll_Click" OnClientClick="return confirm('确定要发布所有栏目吗?');" />
          </div>
          <div class="Conent_fix menu_item menu_content">
                <asp:Button ID="Button6" runat="server" Text="<%$Resources:L,开始发布内容 %>" CssClass="btn btn-info" OnClick="btnColumnCreate_Click" OnClientClick="return CheckNode();"/>
                <asp:Button ID="Button5" runat="server" Text="<%$Resources:L,发布所有内容 %>" CssClass="btn btn-info" OnClick="btnNewsContent_Click"  OnClientClick="return confirm('确定要发布栏目下的所有内容吗?');" />
          </div>
        <!--end发布栏目--> 
      </div>
      <div class="tab-pane row sysRow" id="Tab4">
          <table class="table table-striped table-bordered table-hover">
                <tr class="text-center"><td colspan="5"><strong><%=Resources.L.发布单页 %></strong></td></tr>
	            <tr>
		            <td class="td_s" ><label class="filltd"><input type="checkbox" onclick="selectAllByName(this, 'spagechk');"/></label></td>
		            <td class="td_s">ID</td>
		            <td style="width: 40%;"><%=Resources.L.节点名称 %></td>
		            <td>节点类型</td>
                    <td class="td_l">操作</td>
	            </tr>
             <asp:Repeater ID="SPageRPT" runat="server" EnableViewState="false">
		        <ItemTemplate>
                    <tr title="单击打开|收缩">
                        <td><label class="filltd"><input type="checkbox" name="spagechk" value="<%#Eval("NodeID") %>" /></label></td>
                        <td><%#Eval("NodeID") %></td>
                        <td><%#GetIcon() %></td>
                        <td><%#GetNodeType() %></td>
                        <td>
                            <%#GetOper()%> 
                            <a href="<%#"?CType=spage&NodeID="+Eval("NodeID") %>">生成</a>
                        </td>
                    </tr>
		        </ItemTemplate>
	        </asp:Repeater>
        </table>
          <div class="Conent_fix">
               <asp:Button ID="Button3" runat="server" Text="开始发布" CssClass="btn btn-info mr-3" OnClick="btnCreateSingle_Click" OnClientClick="return CheckSPage();" />
               <asp:Button ID="Button1" runat="server" Text="发布所有单页" CssClass="btn btn-info" OnClick="btnCreateSingleAll_Click" OnClientClick="return confirm('确定要发布所有单页吗');" />
          </div>
      </div>
      <div class="tab-pane row sysRow" id="Tab5"> 
          <table class="table table-striped table-bordered table-hover">
                <tr class="text-center"><td colspan="5"><strong>发布专题</strong></td></tr>
	            <tr>
		            <td class="td_s"><label class="filltd"><input type="checkbox" onclick="selectAllByName(this, 'spchk');"/></label></td>
		            <td class="td_s">ID</td>
		            <td style="width: 40%;">节点名称</td>
		            <td>节点类型</td>
                    <td>操作</td>
	            </tr>
             <asp:Repeater ID="SpecRPT" runat="server" EnableViewState="false">
		        <ItemTemplate>
                    <tr title="单击打开|收缩">
                        <td><label class="filltd"><input type="checkbox" name="spchk" value="<%#Eval("NodeID") %>" /></label></td>
                        <td><%#Eval("NodeID") %></td>
                        <td><%#GetIcon() %></td>
                        <td>专题</td>
                         <td>
                             <%#GetOper()%> 
                            <a href="<%#"?CType=spec&NodeID="+Eval("NodeID") %>">生成</a>
                        </td>
                    </tr>
		        </ItemTemplate>
	        </asp:Repeater>
        </table>
           <div class="Conent_fix">
             <asp:Button ID="btnCreateSpeacil" runat="server" Text="发布选定专题" CssClass="btn btn-info" OnClick="btnCreateSpeacil_Click" />
           </div>
      </div>
    </div>
  </div>
<script src="/JS/DatePicker/WdatePicker.js"></script> 
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    var childTlp = '<tr data-layer="@Layer" data-id="@NodeID" data-pid="@ParentID"><td><label class="filltd"><input type="checkbox" name="nodechk" value="@NodeID"/></label></td>'
    + '<td>@NodeID</td><td onclick="ShowChild(this);" data-child="@ChildCount">@LayerHtml@icon</td>'
    + '<td><fun>GetNodeType(@NodeType);</fun></td>'
    + '<td>@oper <fun>GetCStr(@NodeType,@NodeID)</fun></td></tr>';
    //第一次点击时加载,以后点击时显示子级
    function ShowChild(obj) {
        if ($(obj).data("child") < 1)//无子级直接返回
        {
            obj.onclick = null;
            return false;
        }
        $tr = $(obj).closest("tr"); 
        $.post("", { nid: $tr.data("id")}, function (data) {
            if (data != "" && data != "[]") {
                data = JSON.parse(data);
                var html = ReplaceTlp(childTlp, $tr.data("layer"), data);
                obj.onclick = function () { ToggleChild(obj); }
                $tr.after(html);
                $tr.find("[data-type=icon]").attr("class", "zi zi_folderOpen");
                //用于内容与栏目
                if ($(".menu_node").is(":visible")) { ShowMenu("node"); }
                else if ($(".menu_content").is(":visible")) { ShowMenu("content"); }
            }
        });
    }
    //确定是要显示还是隐藏
    function ToggleChild(obj) {
        $tr = $(obj).closest("tr");
        var id = $tr.data("id");
        $trs = $("#EGV tr[data-pid=" + id + "]");
        if ($trs.length < 1) return;
        var flag = $trs.is(":visible");
        if (flag) {
            HideByPid(id);
            $tr.find("[data-type=icon]").attr("class", "zi zi_folders");
        }//隐藏的话递归  
        else {
            $trs.show();
            $tr.find("[data-type=icon]").attr("class", "zi zi_folderOpen");
        }
    }
    //true隐藏,false显示 
    function HideByPid(pid) {
        $trs = $("#EGV tr[data-pid=" + pid + "]");
        if (!$trs || $trs.length < 1) return;//不存在,或下再无子级时跳出递归
        for (var i = 0; i < $trs.length; i++) {
            HideByPid($($trs[i]).data("id"));
        }
        $("#EGV tr[data-pid=" + pid + "]").hide();
    }
    //附加数据
    function ReplaceTlp(tlp, layer, list) {
        var layerTlp = "<img src='/Images/TreeLineImages/tree_line4.gif' />";
        var layerhtml = "";
        for (var i = 0; i < layer; i++) {
            layerhtml += layerTlp;
        }
        tlp = tlp.replace("@LayerHtml", layerhtml).replace("@Layer", ++layer);
        //替换模板
        return JsonHelper.FillData(tlp, list);
    }
    function GetNodeType(nodetype) {
        switch (parseInt(nodetype)) {
            case 0:
                return "根节点";
            case 1:
                return "栏目节点";
            case 2:
                return "单页节点";
            case 3:
                return "外部链接";
            default:
                return "";
        }
    }
    //返回生成字符串
    function GetCStr(nodeType, nodeID) {
        //有内容和栏目两种选项
        var html = "";
        switch (nodeType) {
            case 2:
                html ='<a href="?CType=spage&NodeID=' + nodeID + '">生成</a>';
                break;
            case 10:
                type = "spec";
                html = '<a href="?CType=spec&NodeID=' + nodeID + '">生成</a>';
                break;
            default://栏目和内容生成
                html = '<a href="?CType=node&NodeID=' + nodeID + '" class="menu_item menu_node">生成节点</a>';
                html += '<a href="?CType=content&NodeID=' + nodeID + '" class="menu_item menu_content">生成内容</a>';
                break;
        }
        return html;
    }
</script>
<script>
    $(function () {
        ZL_Regex.B_Num(".num");
    })
    function CheckEmpty() {
        if (ZL_Regex.isEmpty($("#STime_T").val()) || ZL_Regex.isEmpty($("#ETime_T").val()))
        {
            alert("开始与结束时间不能为空"); return false;
        }
        return true;
    }
    function CheckNum(id) {
        var val = parseInt($("#" + id).val());
        if (ZL_Regex.isInt(val) && val > 0) {
            return true;
        }
        alert("输入的数值不正确");
        return false;
    }
    function ShowMenu(menu) {
        switch (menu) {
            case "node":
                break;
            case "content":
                break;
        }
        $(".menu_item").hide();
        $(".menu_" + menu).show();
    }
    function CheckNode() {
        if ($("[name=nodechk]:checked").length<1) {
            alert("尚未选定需要生成的栏目");
            return false;
        }
        return true;
    }
    function CheckSPage() {
        if ($("[name=spagechk]:checked").length < 1) {
            alert("尚未选定需要生成的单页");
            return false;
        }
        return true;
    }
    function ValidData() {
    var result = false;
    var val = "";
    flag = $("#scheTime_Sel").val();
    switch (flag) {
        case "0":
            val = $("#scheTime_T").val().trim();
            break;
        case "1":
            val = $("#scheTime_T2").val().trim();
            break;
    }
    if (val && val != "") result = true;
    else
        alert("时间不能为空");
    return result;
    }
</script>
</asp:Content>