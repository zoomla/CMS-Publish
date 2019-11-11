<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageLabel.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.PageLabel" ValidateRequest="false" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
.dragspandiv{background-color: #FFFBF5;FILTER: alpha(opacity=70);border: 1px solid #F6B9D6;
        text-align: center;overflow:hidden;padding:2px;height:20px;}
</style>
    <title>分页标签编辑</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("","系统设置"),
        new Bread("LabelManage.aspx","标签管理"),											
        new Bread() {url="", text="动态标签设置",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered sys_table">
        <tr>
            <td class="spacingtitle text-center" colspan="2" >
                <b>分页标签设置</b></td>
        </tr>
        <tr>
            <th scope="col" class="w12rem_lg">标签名称</th>
            <td scope="col">
                <asp:TextBox ID="TxtLabelName" CssClass="form-control" runat="server"/>
                <asp:RequiredFieldValidator runat="server" ID="NReq" ControlToValidate="TxtLabelName"
                    Display="Dynamic" ErrorMessage="请输入标签名称" ></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TxtLabelName"
                    ErrorMessage="标签名称重复" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <th>标签分类</th>
            <td>
                <asp:DropDownList ID="DDLType" CssClass="form-control" runat="server">
                    <asp:ListItem Selected="True" Value="5">列表分页</asp:ListItem>
                    <asp:ListItem Value="6">内容分页</asp:ListItem>
                </asp:DropDownList>              
            </td>
        </tr>
        <tr>
            <th>标签说明</th><td>
                <asp:TextBox ID="TxtLabelIntro" CssClass="form-control" class="l_input" runat="server"  TextMode="MultiLine" Columns="50" Rows="3"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <th>标签内容</th>
            <td>
                <table style="width: 95%">
                    <tr>
                        <td>
                            <div id="labellist" class="btn-group d-flex flex-wrap">
                                <div code="{totalrecord/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    总记录</div>
                                <div code="{totalpage/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    总页数</div>
                                <div code="{pagesize/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    每页显示数</div>
                                <div code="{currenturl/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    当前页路径</div>
                                <div code="{firsturl/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    首页地址</div>
                                <div code="{prvurl/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    上一页地址</div>
                                <div code="{nexturl/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    下一页地址</div>
                                <div code="{endurl/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    尾页地址</div>                                   
                                <div code="{currentpage/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    当前页码</div>
                                <div code="{prvpage/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    上一页页码</div>
                                <div code="{nextpage/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    下一页页码</div>
                                <div code="{endpage/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    尾页页码</div>
                                <div code="{loop range=\'显示半径\'}循环代码$$$当前代码{/loop}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    分页循环</div>
                                <div code="{pageid/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    循环内页码</div>                                
                                <div code="{pageurl/}" onclick="Mycit($(this).attr('code'))" class="btn btn-outline-info">
                                    循环内路径</div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <textarea id="ln_txt" readonly="readonly" style=" width:40px;background-color:gray;color:white;height:250px;float:left;position:absolute;text-align:right;padding-top:6px; padding-right:3px;overflow-y:hidden;"></textarea>
                            <asp:TextBox ID="TxtLabelTemplate" class="l_input"  runat="server" Height="250px" Wrap="true" Width="100%" Style="padding-left:40px;" TextMode="MultiLine" Rows="12" onkeydown="UpdateLine();" onscroll="SyncScroll();" />
                            
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2"   ControlToValidate="TxtLabelTemplate" runat="server" ErrorMessage="标签内容不可以为空！"></asp:RequiredFieldValidator>
                                                  
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:HiddenField ID="HdnlabelID" runat="server" />
                &nbsp;
                &nbsp;<asp:Button ID="BtnSave" class="btn btn-info"  OnClick="BtnSave_Click"
                        runat="server" Style="cursor: pointer; cursor: pointer; width: 88px;" Text="保存标签" />&nbsp;&nbsp;&nbsp;<input id="BtnCancel" type="button"
                        class="btn btn-outline-info" value="取　消" onclick="window.location.href = 'LabelManage.aspx'" style="cursor: pointer;  cursor: pointer; width: 88px;" />
            </td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

      <script type="text/javascript">
          function SyncScroll() {
              var txt_ln = document.getElementById('ln_txt');
              var txt_main = document.getElementById('TxtLabelTemplate');
              txt_ln.scrollTop = txt_main.scrollTop;
          }
          //通过换行判断不准确
          function UpdateLine() {
              if (event.keyCode == 13) {
                  UpdateLineNum();
              }
          }
          function UpdateLineNum() {
              var txt_ln = document.getElementById('ln_txt');
              var txt_main = document.getElementById('TxtLabelTemplate');
              txt_ln.value = "";
              lineNum = ($(txt_main).val().split("\n").length + 2);
              for (var i = 1; i <= lineNum; i++) {
                  txt_ln.value += i + '\n';
              }
          }
          $().ready(function () { UpdateLineNum(); });
    </script>

    <script type="text/javascript">
        var start = 0, end = 0;
        var x, y;
        var dragspan;
        var inserttext;
        var nn6 = document.getElementById && !document.all;
        var isdrag = false;

        function initDrag(e) {
            var oDragHandle = nn6 ? e.target : event.srcElement;
            if (oDragHandle.className == "spanfixdiv" || oDragHandle.className == "spanfixdiv1") {
                isdrag = true;
                dragspan = document.createElement('div');
                dragspan.style.position = "absolute";
                dragspan.className = "dragspandiv";
                y = nn6 ? e.clientY + 5 : event.clientY + 5;
                x = nn6 ? e.clientX + 10 : event.clientX + 10;
                dragspan.style.width = oDragHandle.style.width;
                dragspan.style.height = oDragHandle.style.height;
                dragspan.style.top = y + "px";
                dragspan.style.left = x + "px";
                dragspan.innerHTML = oDragHandle.innerHTML;
                document.body.appendChild(dragspan);
                document.onmousemove = moveMouse;

                inserttext = oDragHandle.getAttribute("code");
                labeltype = oDragHandle.getAttribute("outtype");

                return false;
            }
        }
        function moveMouse(e) {
            if (isdrag) {
                dragspan.style.top = (nn6 ? e.clientY : event.clientY) + document.documentElement.scrollTop + 5 + "px";
                dragspan.style.left = (nn6 ? e.clientX : event.clientX) + document.documentElement.scrollLeft + 10 + "px";
                return false;
            }
        }

        function dragend(textBox) {
            if (isdrag) {
                savePos(textBox);
                cit(this);
            }
        }

        function savePos(textBox) {
            if (typeof (textBox.selectionStart) == "number") {
                start = textBox.selectionStart;
                end = textBox.selectionEnd;
            }
        }

//        function cit() {
//            var target = document.getElementById('<% =TxtLabelTemplate.ClientID %>');
//            if (nn6) {
//                var pre = target.value.substr(0, start);
//                var post = target.value.substr(end);
//                target.value = pre + inserttext + post;
//				console.log("true");
//				console.log(pre);//前代码
//				console.log(post);//后
//				//console.log(this.attr("code"));
//            }
//            else {
//                target.focus();
//                var range = document.selection.createRange();
//                range.text = inserttext;
//				console.log("false");
//            }
//    }
	
//插入标签
function Mycit(bqtext) {
var target = document.getElementById('<% =TxtLabelTemplate.ClientID %>');
if (nn6) {
	var pre = target.value.substr(0, start);
	var post = target.value.substr(end);
	target.value = pre + bqtext + post;
}
else {
	target.focus();
	var range = document.selection.createRange();
	range.text = bqtext;
}
}

    function DragPos(textBox) {
        if (isdrag) {
            if (nn6) {
                textBox.focus();
            }
            else {
                var rng = textBox.createTextRange();
                rng.moveToPoint(event.x, event.y);
                rng.select();
            }
        }
    }

    document.onmousedown = initDrag;

    document.onmouseup = function () {
        isdrag = false;
        if (dragspan != null) {
            document.body.removeChild(dragspan);
            dragspan = null;
        }
    }
    </script>
</asp:Content>
    