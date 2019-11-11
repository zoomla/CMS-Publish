<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StructChart.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.StructChart" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>组织结构</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("StructList.aspx","组织结构"),
        new Bread() {url="", text="组织结构<a href='StructList.aspx'>[表格浏览]</a>",addon="" }}
		)
    %>
    <div style="height:50px;"></div>
<div id="chart-container"></div>
<div style="display:none;">
    <asp:HiddenField runat="server" ID="ID_Hid" />
    <asp:Button runat="server" ID="Del_Btn" OnClick="Del_Btn_Click" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/JS/Plugs/OrgChart/jquery.orgchart.css?v=1" rel="stylesheet" />
<style type="text/css">
.card{padding-bottom:0px;font-size:12px;}
.card .card-footer{text-align:right;padding:3px;}
#chart-container {position: relative;display:block;top: 10px;left: 10px; width: 100%;overflow: auto;text-align: center;}
.orgchart {display:block;}
</style>
<script src="/JS/Plugs/OrgChart/jquery.orgchart.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>

<script type="text/javascript">
    $(function() {
        $("#chart-container").height($(document).height()-50);
        var datasource = <%=Newtonsoft.Json.JsonConvert.SerializeObject(parent)%>;

    var nodeTemplate = function(data) {
        return `       
             <div class="card" data-id="${data.id}" data-pid="${data.pid}">
             <div class="card-header">${data.name}</div>
             <div class="card-body">${data.info}</div>
             <div class="card-footer">
                 <button type="button" class="btn btn-info btn-sm" title="添加" onclick="node.add(this);"><i class="zi zi_plus"></i></button>
                 <button type="button" class="btn btn-info btn-sm firstHide" title="修改" onclick="node.edit(this);"><i class="zi zi_pencilalt"></i></button>
                 <button type="button" class="btn btn-danger btn-sm firstHide" title="删除 " onclick="node.del(this);"><i class="zi zi_trash"></i></button>
             </div>
         </div>`;
    };

    var oc = $('#chart-container').orgchart({
      'data' : datasource,
      'nodeTemplate': nodeTemplate
    });
    $(".card:first").find(".firstHide").remove();
    });
    /*
    1.整理出数据
    2.节点添加等事件
    */
    var node={};
    node.edit=function(btn){
        var id= $(btn).closest(".card").data("id");
        ShowComDiag("AddStruct.aspx?id="+id,"修改信息");
    }
    node.add=function(btn){
        var id= $(btn).closest(".card").data("id");
        ShowComDiag("AddStruct.aspx?pid="+id,"添加信息");
    }
    node.del=function(btn){
        if(!confirm("确定要删除吗?")){return false;}
        var id= $(btn).closest(".card").data("id");
        $("#ID_Hid").val(id);
        $("#Del_Btn").click();
    }
  </script>
</asp:Content>