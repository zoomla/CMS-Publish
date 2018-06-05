<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Advertisement.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.Advertisement" MasterPageFile="~/Manage/I/Index.master"  ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
<link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
<link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
<script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
<script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
<script src="/Plugins/CodeMirror/mode/css.js"></script>
<script src="/Plugins/CodeMirror/mode/xml.js"></script>
<script src="/Plugins/CodeMirror/mode/javascript/javascript.js"></script>
<script src="/Plugins/CodeMirror/addon/selection/active-line.js"></script>
<script src="/Plugins/CodeMirror/addon/edit/matchbrackets.js"></script>
<script src="/Plugins/CodeMirror/mode/htmlmixed.js"></script>
<title>添加广告</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ADManage.aspx","广告管理"),
        new Bread() {url="", text="广告管理",addon="" }},
		Call.GetHelp(29)
		)
    %>
<div class="list_choice container-fluid table-responsive">
	<div class="row">
    <div class="panel col-12 col-md-4 col-lg-2 panel-primary">
        <div class="panel-heading">所属版位</div>
        <div class="panel-body">
            <asp:ListBox ID="Zone_List" runat="server" Height="555px" SelectionMode="Single" class="w-100 pl-1"></asp:ListBox>
        </div>
    </div>
    <div id="addpart col-12 col-md-8 col-lg-10">
      <%--  <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">我的好友</a></li>--%>
        <ul class="nav nav-tabs" role="tablist">
            <li onclick="changeBody(this,1)" class="nav-item"><a  class="nav-link active" role="tab" href="javascript:;">广告内容</a></li>
            <li onclick="changeBody(this,2)" class="nav-item"><a class="nav-link" role="tab" href="javascript:;">过期内容</a></li>
        </ul>
        <table class="table table-striped table-bordered sys_table">
            <tbody id="tad1" >
                <tr>
                    <th scope="col" class="w12rem_lg">广告名称<span class="text-danger">*</span></th>
                    <td scope="col">
                        <asp:TextBox ID="TxtADName" class="form-control max20rem" MaxLength="150" runat="server"></asp:TextBox>*
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="广告名称不能为空！" ControlToValidate="TxtADName" Display="Dynamic"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th scope="col"> 广告类型</th>
                    <td scope="col" align="left">
                        <asp:RadioButtonList ID="RadlADType" AutoPostBack="False" RepeatDirection="Horizontal" RepeatLayout="Flow" runat="server" onclick="Change_ADType()">
                            <asp:ListItem Selected="True" Value="1">图片</asp:ListItem>
                            <asp:ListItem Value="2">动画</asp:ListItem>
                            <asp:ListItem Value="3">文本</asp:ListItem>
                            <asp:ListItem Value="4">代码</asp:ListItem>
                            <asp:ListItem Value="5">页面</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
            </tbody>
            <tbody >
                <tr id="type">
                    <th>广告内容</th>
                    <td>
                        <div id="ADContent" runat="server">
                            <div id="ADContent1" runat="server">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">广告内容设置--图片</div>
                                    <div class="panel-body">
                                        <table class="table table-striped table-bordered">
                                            <tr>
                                                <td colspan="w12rem_lg" class="text-right">图片上传：</td>
                                                <td>
                                                    <div class="upload_wrap">
                                                        <img id="Img_txtpic" src="/UploadFiles/nopic.svg">
                                                        <asp:TextBox runat="server" id="txt_txtpic" class="form-control max20rem" />
                                                        <iframe src="/Common/fileupload.aspx?FieldName=txtpic" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                                                    </div>
                                                </td>
                                    </tr>
                                    <tr>
                                        <td align="right">图片尺寸：
                                        </td>
                                        <td>
                                            <div class="input-group" style="width: 560px;">
                                                <span class="input-group-addon">宽</span>
                                                <asp:TextBox ID="TxtImgWidth" class="form-control text_s" MaxLength="5" runat="server" />
                                                <asp:DropDownList runat="server" ID="TxtImgWidthUnit_DP" class="form-control text_s" />
                                                <span class="input-group-addon">高</span>
                                                <asp:TextBox ID="TxtImgHeight" class="form-control text_s" MaxLength="5" runat="server" />
                                                <asp:DropDownList runat="server" ID="TxtImgHeightUnit_DP" class="form-control text_s" />
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 70px; height: 41px;">链接地址：
                                        </td>
                                        <td style="height: 41px;">
                                            <asp:TextBox ID="TxtLinkUrl" class="form-control max20rem" Text="http://" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 70px; text-align: right">链接提示：
                                        </td>
                                        <td style="height: 16px">
                                            <asp:TextBox ID="TxtLinkAlt" class="form-control max20rem" runat="server" MaxLength="255"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">链接目标：
                                        </td>
                                        <td>
                                            <asp:RadioButtonList ID="RadlLinkTarget" runat="server" RepeatDirection="Horizontal">
                                                <asp:ListItem Value="0">原窗口</asp:ListItem>
                                                <asp:ListItem Value="1" Selected="True">新窗口</asp:ListItem>
                                            </asp:RadioButtonList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">广告简介：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TxtADIntro" class="form-control max20rem" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                                    </div>
                                </div>
                                
                            </div>
                            <div id="ADContent2" runat="server" width="100%" style="display: none">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">广告内容设置--动画</div>
                                    <div class="panel-body">
                                        <table class="table table-striped table-bordered">
                                            <tr>
                                                <td align="right" style="width: 100px;">动画上传：</td>
                                                <td style="color: red;">
                                                    <asp:TextBox ID="txtFlashPath" class="form-control max20rem" runat="server"></asp:TextBox>
                                                    *<asp:Label ID="LabFlashPath" runat="server" Text="请选择上传路径！" Visible="False"></asp:Label>
                                                    <br />
                                                    <iframe id="Upload_Flash" src="/Common/Upload.aspx?CID=FlashPath&ftype=1" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="30" scrolling="no"></iframe>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="width: 70px">动画尺寸：
                                                </td>
                                                <td>
                                                    <div class="input-group" style="width: 560px;">
														<div class="input-group-prepend">
                                                        <span class="input-group-text">宽</span></div>
                                                        <asp:TextBox ID="TxtFlashWidth" class="form-control text_s" MaxLength="5" runat="server" />
                                                        <asp:DropDownList runat="server" ID="TxtFlashWidthUnit_DP" class="form-control text_s" />
                                                        <span class="input-group-addon">高</span>
                                                        <asp:TextBox ID="TxtFlashHeight" class="form-control text_s" MaxLength="5" runat="server" />
                                                        <asp:DropDownList runat="server" ID="TxtFlashHeightUnit_DP" class="form-control text_s" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="1" style="width: 70px; height: 6px">背景透明：
                                                </td>
                                                <td align="right" colspan="2" style="height: 6px; text-align: left;">
                                                    <asp:RadioButtonList ID="RadlFlashMode" runat="server" RepeatDirection="Horizontal">
                                                        <asp:ListItem Value="0" Selected="True">不透明</asp:ListItem>
                                                        <asp:ListItem Value="1">透明</asp:ListItem>
                                                    </asp:RadioButtonList>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div id="ADContent3" runat="server" width="100%" style="display: none">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">广告内容设置--文本</div>
                                    <div class="panel-body"><asp:TextBox ID="TxtADText" class="form-control" TextMode="multiLine" runat="server" Rows="6" placeholder="请输入文本"/></div>
                                </div>
                            </div>
                            <div id="ADContent4" runat="server" style="width: 520px; height: 550px; border: 1px solid #ddd; display: none;">
                                <iframe style="height: 30px; width: 530px; z-index: -1;" frameborder="0" name="I1" id="I1" scrolling="no" src="/manage/Template/label.htm"></iframe>
                                <%--<input type="button" value="素材选择" class="btn btn-xs btn-primary" onclick="SelPic({'callback':'addub'});" />--%>
                                <asp:TextBox ID="TxtADCode" TextMode="multiLine" runat="server" />
                            </div>
                            <div id="ADContent5" runat="server" width="100%" style="display: none">
                                <div class="panel panel-primary">
                                    <div class="panel-heading">广告内容设置--页面</div>
                                    <div class="panel-body">
                                        <asp:TextBox ID="TxtWebFileUrl" class="form-control" runat="server" placeholder="请输入网址"/>
                                    </div>
                                    <div class="panel-footer">
                                        注意：页面地址需要加上 http://
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
            <tbody id="adv" >
                <tr>
                    <th class="w12rem_lg">通过审核</th>
                    <td align="left">
                        <input runat="server" type="checkbox" id="ChkPasses" class="switchChk" checked />
                    </td>
                </tr>
                <tr>
                    <th>广告权重</th>
                    <td align="left">
                        <asp:TextBox ID="TxtPriority" runat="server" CssClass="form-control text_md" TextMode="singleLine" MaxLength="3" Text="1" Style="width: 50px"></asp:TextBox>
                        * 此项为版位广告随机显示时的优先权，权重越大显示机会越大。
                    </td>
                </tr>
                <tr>
                    <th>广告统计</th>
                    <td align="left">
                        <asp:CheckBox ID="ChkCountView" runat="server" />
                        统计浏览数 浏览数：<asp:TextBox ID="TxtViews" MaxLength="5" CssClass="form-control text_md" runat="server" Width="50px" Text="0"></asp:TextBox><br />
                        <asp:CheckBox ID="ChkCountClick" runat="server" />
                        统计点击数 点击数：<asp:TextBox ID="TxtClicks" CssClass="form-control text_md" runat="server" MaxLength="5" Width="50px" Text="0"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>广告过期时间</th>
                    <td align="left">
                        <asp:TextBox ID="txtOverdueDate" CssClass="form-control max20rem" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>出售价格(按天计)</th>
                    <td align="left">
                        <asp:TextBox ID="Price" class="form-control max20rem" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>是否开放竟价</th>
                    <td align="left">
                        <input runat="server" type="checkbox" id="ADBuy" class="switchChk" />
                    </td>
                </tr>
                            <tr>
                <td></td>
                <td>
                    <asp:Button ID="EBtnSubmit" runat="server" class="btn btn-info" Text="保存信息" OnClientClick="javascript:return CheckForm();" OnClick="EBtnSubmit_Click" />
                    <a href="" class="btn btn-outline-info">返回列表</a>
                </td>
            </tr>
            </tbody>

        </table>
        <div id="Table" style="display: none;">
            <div id="Table1" runat="server" width="100%">
                <div class="panel panel-primary">
                    <div class="panel-heading">广告内容设置--图片</div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered sys_table">
                    <tr>
                        <th class="w12rem_lg">图片上传</th>
                        <td style="">
                            <div class="upload_wrap">
                                <img id="Img_txtpic1" src="/UploadFiles/nopic.svg">
                                <asp:TextBox runat="server" ID="txt_txtpic1" class="form-control max20rem" />
                                <iframe src="/Common/fileupload.aspx?FieldName=txtpic1" frameborder="0" marginheight="0" marginwidth="0" scrolling="no"></iframe>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>图片尺寸</th>
                        <td>宽：<asp:TextBox ID="TxtImgWidth1" class="form-control text_md" MaxLength="5" Style="width: 80px" runat="server"></asp:TextBox>
                            像素 ; 高：<asp:TextBox ID="TxtImgHeight1" class="form-control text_md" MaxLength="5" Style="width: 80px" runat="server"></asp:TextBox>
                            像素
                        </td>
                    </tr>
                    <tr>
                        <th>链接地址</th>
                        <td>
                            <asp:TextBox ID="TxtLinkUrl1" class="form-control text_md" Text="http://" runat="server" Width="341px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>链接提示</th>
                        <td>
                            <asp:TextBox ID="TxtLinkAlt1" class="form-control text_md" runat="server" MaxLength="255" Width="341px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <th>链接目标</th>
                        <td>
                            <asp:RadioButtonList ID="RadlLinkTarget1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">原窗口</asp:ListItem>
                                <asp:ListItem Value="1" Selected="True">新窗口</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <th>广告简介</th>
                        <td>
                            <asp:TextBox ID="TxtADIntro1" class="form-control text_md" runat="server" TextMode="MultiLine" Height="87px" Width="341px"></asp:TextBox>
                        </td>
                    </tr>
                </table>
                    </div>
                </div>
            </div>
            <div id="Table2" runat="server" width="100%" style="display: none">
                <div class="panel panel-primary">
                    <div class="panel-heading">广告内容设置--动画</div>
                    <div class="panel-body">
                        <table class="table table-striped table-bordered sys_table">
                    <tr>
                        <th class="w12rem_lg">动画上传：</th>
                        <td style="color: red;">
                            <asp:TextBox ID="txtFlashPath1" class="form-control max20rem" runat="server"></asp:TextBox>
                            *<asp:Label ID="LabFlashPath1" runat="server" Text="请选择上传路径！" Visible="False"></asp:Label>
                            <br />
                            <iframe id="Upload_Flash1" src="../../Common/Upload.aspx?CID=FlashPath1&ftype=1" marginheight="0" marginwidth="0" frameborder="0" width="100%" height="30" scrolling="no"></iframe>
                        </td>
                    </tr>
                    <tr>
                        <th>动画尺寸</th>
                        <td>宽：<asp:TextBox ID="TxtFlashWidth1" class="form-control text_md" runat="server" Style="width: 80px" MaxLength="5"></asp:TextBox>
                            像素 高：<asp:TextBox ID="TxtFlashHeight1" class="form-control text_md" Style="width: 80px" runat="server" MaxLength="5"></asp:TextBox>
                            像素
                        </td>
                    </tr>
                    <tr>
                        <th>背景透明</th>
                        <td align="right">
                            <asp:RadioButtonList ID="RadlFlashMode1" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">不透明</asp:ListItem>
                                <asp:ListItem Value="1">透明</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </table>
                    </div>
                </div>
                
            </div>
            <div id="Table3" runat="server" width="100%" style="display: none">
                <div class="panel panel-primary">
                    <div class="panel-heading">广告内容设置--文本</div>
                    <div class="panel-body">
                        <asp:TextBox ID="TxtADText1" class="form-control" TextMode="multiLine" runat="server" Rows="6" placeholder="请输入文本" /></div>
                </div>
            </div>
            <div id="Table4" runat="server" width="100%" style="display: none">
                <table class="table table-striped table-bordered table-hover sys_table">
                    <tr valign="middle">
                        <td style="text-align: center;" colspan="2">
                            <strong>广告内容设置--代码</strong>
                        </td>
                    </tr>
                    <tr>
                        <th class="w12rem_lg">广告内容</th>
                        <td valign="middle">
                            <asp:TextBox ID="TxtADCode1" class="form-control max20rem" TextMode="multiLine" runat="server" Rows="6"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="Table5" runat="server" width="100%" style="display: none">
                <div class="panel panel-primary">
                    <div class="panel-heading">广告内容设置--页面</div>
                    <div class="panel-body">
                        <asp:TextBox ID="TxtWebFileUrl1" class="form-control" runat="server" placeholder="请输入网址" />
                    </div>
                    <div class="panel-footer">
                        注意：页面地址需要加上 http://
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script>
    var editor, editorFlag = false;
    $(function () {
        if ($("#RadlADType_3:checked").length > 0)//修改代码
        {
            InitEditor();
            editorFlag = true;
        }
    })
    function InitEditor()
    {
        editor = CodeMirror.fromTextArea(document.getElementById("TxtADCode"), {
            mode: "text/html",
            tabMode: "indent",
            lineNumbers: true,
            styleActiveLine: true,
            matchBrackets: true,
            lineWrapping: true
        });
        editor.setOption("theme", "eclipse");
    }
    function addubb(code) { PasteValue(code); }
    function PasteValue(code) {
        if (!editor || !editor.setOption) { setTimeout(function () { PasteValue(code); }, 500); return; }
        if (code && code != "")
            editor.replaceSelection(code, null, "paste");
    }
    function SelPic(pval) {
        comdiag.maxbtn = false;
        ShowComDiag("/Common/SelFiles.aspx?pval=" + JSON.stringify(pval), "选择图片");
    }
    function PageCallBack(action, vals, pval) {
        var val = vals.split('|')[0];
        addubb(val);
        CloseComDiag();
    }
    //--------------------------------------------
    function CheckImg(txtName) {
        window.open('../Flex/MyWorkList.aspx?txtName=' + txtName, 'newWin', 'modal=yes,width=650,height=750,resizable=yes,scrollbars=yes');
    }
    function CheckSelect() {
        var s = document.getElementById("<%= Zone_List.ClientID %>");
        for (var i = 0; i < s.length; i++) {
            if (s.options[i].selected) {
                return true;
            }
        }
        return false;
    }
    function CheckUploadFile() {
        if (document.getElementById("RadlADType_0").checked) {
          <%--  var s = document.getElementById("<%=txtpic.ClientID %>");
            if (s.value == "") {
                alert("还没有上传图片！");
                return false;
            }--%>
        }
        if (document.getElementById("RadlADType_1").checked) {
            s = document.getElementById("<%=txtFlashPath.ClientID %>");
            if (s.value == "") {
                alert("还没有上传Flash");
                return false;
            }
        }
        return true;
    }
    function GoBack() {
        window.location.href = "ADManage.aspx";
    }
    function Change_ADType() {
        for (var j = 1; j <= 5; j++) {
            var ot = document.getElementById("ADContent" + j);
            var ott = document.getElementById("Table" + j);
            if ($("input[id=RadlADType_" + (j - 1) + "]")[0].checked) {
                ot.style.display = '';
                ott.style.display = '';
                if (j == 1) {
                    $("#ChkCountClick").disabled = false;
                    $("#TxtClicks").disabled = false;
                }
                else if (j == 4)//代码
                {
                    if (!editorFlag)
                    {
                        InitEditor();
                        editorFlag = true;
                    }
                }
                else {
                    $("#ChkCountClick").disabled = true;
                    $("#TxtClicks").disabled = true;
                }
            }
            else {
                ot.style.display = 'none';
                ott.style.display = 'none';
            }
        }
    }
    function ADTypeChecked(i) {
        $("#RadlADType_" + (i - 1)).checked = true;
        Change_ADType();
    }
    function CheckForm() {
        if ($("#TxtADName").value == '') {
            alert('广告名称不能为空！');
            $("#TxtADName").focus();
            return false;
        }
        if (!CheckUploadFile()) {
            return false;
        }
        if ($("#RadlADType_2").checked && $("#TxtADText").value == '') {
            alert('广告文字不能空');
            $("#TxtADText").focus();
            return false;
        }
        if ($("#TxtPriority").value == '') {
            alert('权重系数不能空');
            $("#TxtPriority").focus();
            return false;
        }
    }
    function changeBody(li,index) {
        $(".nav-tabs li").find("a").removeClass("active");
        $(li).find("a").addClass("active");
        switch (index) {
            case 1:
                {
                    document.getElementById('ADContent').style.display = "";
                    document.getElementById('Table').style.display = "none";
                    $("#adv").show();
                    document.getElementById('adv').style.display = "";
                    document.getElementById('tad1').style.display = "";
                    document.getElementById('type').style.display = "";
                    document.getElementById('shezhi1').style.display = "";
                    document.getElementById('add').style.background = "#AACC12";
                }
                break;
            case 2:
                {
                    document.getElementById('ADContent').style.display = "none";
                    document.getElementById('Table').style.display = "";
                    $("#adv").hide();
                    document.getElementById('adv').style.display = "none";
                    document.getElementById('tad1').style.display = "none";
                    document.getElementById('type').style.display = "none";
                    document.getElementById('shezhi1').style.display = "none";
                    document.getElementById('add').style.background = "#8F9F56";
                }
                break;
        }
    }
    //页面大小
    var Width = document.body.offsetWidth;
    Width -= 200;
    document.getElementById("addpart").style.width = Width + "px";
    //-----------------------
    var uparr = ["txtpic", "txtpic1"];
    for (var i = 0; i < uparr.length; i++) {
        var value = $("#txt_" + uparr[i]).val();
        if (!ZL_Regex.isEmpty(value)) { $("#Img_" + uparr[i]).attr("src",value); }
    }
</script>
</asp:Content>
