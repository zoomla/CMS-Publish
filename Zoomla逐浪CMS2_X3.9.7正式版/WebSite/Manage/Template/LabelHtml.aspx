<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabelHtml.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.LabelHtml" MasterPageFile="~/Manage/I/Index.master"  ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
<link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
<script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
<script src="/Plugins/CodeMirror/mode/xml.js"></script>
<script src="/Plugins/CodeMirror/mode/javascript/javascript.js"></script>
<script src="/Plugins/CodeMirror/addon/selection/active-line.js"></script>
<script src="/Plugins/CodeMirror/addon/edit/matchbrackets.js"></script>
<script src="/Plugins/CodeMirror/mode/htmlmixed.js"></script>
<script src="/Plugins/CodeMirror/mode/css.js"></script>
<script src="/Plugins/Third/bootstrap-select/js/bootstrap-select.js"></script>
<link href="/Plugins/Third/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
<script>
    //必须顶部声明
    function replaceDPToSelect(filter) {
        $(filter).selectpicker({
            hideDisabled: true,
            liveSearch: true,
            maxOptions: 1
        });
    }
</script>
<style type="text/css">
.opname{position: absolute; width: 100px;font-weight:bolder;}
.field_wrap{width: 150px; display: inline-block; position: relative;border:1px solid #ddd;border-right:none;}
</style>
<title>标签查询</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
<div id="BreadDiv" class="container-fluid mysite">
     <div class="row">
            <ol class="breadcrumb fixed-top w-100">
                <li class="breadcrumb-item"><a href="LabelManage.aspx">标签管理</a></li>
                <li class="breadcrumb-item">
                    <asp:Label ID="Bread_L" runat="server" />
            </ol>
        </div>
</div>
<div class="list_choice">
<asp:UpdatePanel ID="LabelPanel" runat="server">	<ContentTemplate>
<asp:Wizard ID="Wizard1" runat="server" DisplaySideBar="False"  class="w-100" ActiveStepIndex="0">
<HeaderTemplate></HeaderTemplate>
<WizardSteps>
    <asp:WizardStep ID="WizardStep1" EnableTheming="true" runat="server">
        <div class="container-fluid pr-0">
            <div class="row sysRow table-responsive-md">
                <table class="table table-striped table-bordered sys_table">
                    <tr>
                        <td class="spacingtitle text-center" colspan="2">第一步：基本信息</td>
                    </tr>
                    <tr>
                        <th class="w12rem_lg">标签名称</th>
                        <td class="text-left">
                            <asp:TextBox ID="LabelName_T" class="form-control max20rem" runat="server" />
                            <asp:RequiredFieldValidator runat="server" ID="S1R1" ControlToValidate="LabelName_T" Display="Dynamic" ForeColor="Red" ErrorMessage="必须输入名称" SetFocusOnError="True" />
                            <asp:CustomValidator ID="S1C1" Display="Dynamic" runat="server" ControlToValidate="LabelName_T" ErrorMessage="名称重复" OnServerValidate="S1C1_ServerValidate" SetFocusOnError="True" /></td>
                    </tr>
                    <tr>
                        <th>标签分类</th>
                        <td class="text-left">
                            <div class="input-group mb-3">
                                <asp:TextBox ID="LabelCate_T" class="form-control max20rem" runat="server"></asp:TextBox>
                                <div class="input-group-append">
                                    <asp:DropDownList ID="LabelCate_DP" DataTextField="Name" DataValueField="Name" CssClass="form-control max20rem" runat="server" onchange="changecate(this);"></asp:DropDownList>
                                    <asp:RequiredFieldValidator CssClass="tips" Display="Dynamic" ID="S1R2" runat="server" ControlToValidate="LabelCate_T" ErrorMessage="分类不能为空" ForeColor="Red" />
                                </div>
                            </div>

                        </td>
                    </tr>
                    <tr>
                        <th>标签说明</th>
                        <td>
                            <asp:TextBox ID="Desc_T" class="form-control max20rem" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:DropDownList ID="Step_DP" CssClass="form-control pull-left w12rem_lg" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Step_DP_SelectedIndexChanged">
                                <asp:ListItem Value="0" Text="基本信息"></asp:ListItem>
                                <asp:ListItem Value="1" Text="标签内容"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="下一步" class="btn btn-info ml-2" OnClick="StartNextButton_Click" />
                            <input type="button" value="保存标签" class="btn btn-info" onclick="$('#Save_Btn').click();;" />
                            <asp:LinkButton OnClick="UseLable_Click" class="btn btn-link" runat="server"><i class="zi zi_quoteleft" zico="上引号黑"></i> 引用标签</asp:LinkButton>
                            <a href="LabelManage.aspx" class="btn btn-link"><i class="zi zi_times" zico="错号粗黑"></i>取消</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </asp:WizardStep>
    <asp:WizardStep ID="WizardStep4" runat="server">
        <div class="container-fluid pr-0">
            <div class="row sysRow table-responsive-md">
                <table class="table table-striped table-bordered sys_table">
                    <tr>
                        <td class="spacingtitle" align="center" colspan="2">第四步：标签内容</td>
                    </tr>
                    <tr>
                        <th>判断模式</th>
                        <td>
                            <asp:CheckBox ID="BoolMode_Chk" runat="server" Text="判断模式" AutoPostBack="true" OnCheckedChanged="BoolMode_Chk_CheckedChanged" />
                            [根据判断条件输出内容-接受标签为条件]       
                        </td>
                    </tr>
                    <tr id="boolMode_tr" runat="server" visible="false">
                        <th>模式设置</th>
                        <td>
                            <div class="input-group">
                                <asp:DropDownList ID="Modeltypeinfo" class="form-control text_200_auto" runat="server" AutoPostBack="true" OnSelectedIndexChanged="Modeltypeinfo_SelectedIndexChanged">
                                    <asp:ListItem Value="参数判断" Selected="True">参数判断</asp:ListItem>
                                    <asp:ListItem Value="用户登录判断">用户登录判断</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="Valueroot" runat="server" class="form-control text_200_auto" placeholder="这里放入标签" />
                                <asp:DropDownList ID="setroot" CssClass="form-control td_m" runat="server">
                                    <asp:ListItem Value="大于">大于</asp:ListItem>
                                    <asp:ListItem Value="等于" Selected="True">等于</asp:ListItem>
                                    <asp:ListItem Value="小于">小于</asp:ListItem>
                                    <asp:ListItem Value="不等于">不等于</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="Modelvalue" class="form-control td_m" runat="server" ToolTip="注意：当判断是否为空时，请不要填写任何内容" />
                            </div>
                            <asp:Label ID="Label3" runat="server" ForeColor="#339933" Visible="False" Font-Bold="True" CssClass="hidden"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="padding-t0" colspan="2">
                            <div id="labeldiv">
                                <ul class="nav nav-tabs top_opbar" style="margin-bottom: 0px; border-bottom: none;">
                                    <li class="nav-item"><a class="nav-link active" href="#Tabs0" data-toggle="tab">自定标签</a></li>
                                    <%--            <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">字段标签</a></li>--%>
                                    <li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab">系统标签</a></li>
                                    <li class="nav-item"><a class="nav-link" href="#Tabs3" data-toggle="tab">扩展函数</a></li>
                                </ul>
                                <div class="row">
                                    <div class="col-md-4" style="height: 536px; max-width: 450px; overflow-y: auto; border: 1px solid #ddd; border-right: none; padding: 0px; text-align: center;">
                                        <div class="tab-content">
                                            <div class="tab-pane active" id="Tabs0" runat="server">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <asp:DropDownList ID="CustomLabel_DP" runat="server" DataTextField="Name" DataValueField="Name" CssClass="form-control max20rem" onchange="GetCustom(this);"></asp:DropDownList>
                                                    </div>
                                                    <div class="panel-body" id="CustomLabel_div" runat="server"></div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="Tabs1">
                                                <div class="card card-header">
                                                    <%-- <div class="panel-heading">
                            <asp:DropDownList ID="Field_DP" runat="server" CssClass="form-control max20rem" onchange="GetField(this);"></asp:DropDownList>
                        </div>--%>
                                                    <div class="card-body" id="Field_div" runat="server"></div>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="Tabs2">
                                                <div class="list-group pl-2">
                                                    <asp:Label ID="lblSys" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="tab-pane" id="Tabs3">
                                                <div class="list-group pl-2">
                                                    <asp:Label ID="lblFun" runat="server"></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-8" style="border: 1px solid #ddd; padding: 0px;">
                                        <p id="boolMode_sp" runat="server" visible="false">满足判断:</p>
                                        <div style="margin-left: 30px;">
                                            <%=ZoomLa.Safe.SafeC.ReadFileStr("/manage/Template/label.htm") %>
                                        </div>
                                        <div id="Textarea">
                                            <asp:TextBox TextMode="MultiLine" runat="server" ID="textContent" Style="max-width: 100%; width: 100%; height: 530px;" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr id="bool_s1_tr" runat="server" visible="false">
                        <td colspan="2">
                            <div>不满足判断(当选择计数判断时,下面只能填写{Repeate}标签里面的内容):</div>
                            <asp:TextBox TextMode="MultiLine" runat="server" ID="falsecontent" Width="100%" Height="231px"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>
                    <tr runat="server" visible="false" data-disuse="true">
                        <td align="center" colspan="2">
                            <div style="float: left; padding-left: 250px; display: none">
                                <a href="LabelManage.aspx" class="btn btn-primary">返回列表</a>
                                <input type="button" value="保存标签" class="btn btn-primary" onclick="$('#Save_Btn').click();;" />
                            </div>
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div>
                                <asp:DropDownList ID="Step4_DP" runat="server" CssClass="form-control float-left" Width="120" AutoPostBack="true" OnSelectedIndexChanged="Step_DP_SelectedIndexChanged" onchange="saveEditor();">
                                    <asp:ListItem Value="0" Text="基本信息"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="标签内容"></asp:ListItem>
                                </asp:DropDownList>
                                <div class="float-left">
                                    <asp:Button ID="PreviousButtonFinish" runat="server" CausesValidation="False" class="btn btn-info" CommandName="MovePrevious" Text="上一步" OnClick="PreviousButtonStep3_Click" OnClientClick="return saveEditor();" />
                                    <input type="button" value="保存标签" class="btn btn-info" onclick="$('#Save_Btn').click();;" />
                                    <asp:LinkButton OnClick="UseLable_Click" class="btn btn-link" runat="server"><i class="zi zi_quoteleft" zico="上引号黑"></i> 引用标签</asp:LinkButton>
                                </div>
                                <a href="LabelManage.aspx" class="btn btn-link" onclick="return confirm('要返回列表吗?');"><i class="zi zi_times" zico="错号粗黑"></i>取消</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div style="margin-top: 5px;">
            <ul class="disc">
                <li>标签内容支持CSS等HTML定义，可以从左侧拖拽标签参数使用。</li>
                <li>重复输出数据请需要在{Repeate}{/Repeate}内进行排序输出。</li>
                <li>扩展函数支持字段格式化、截取、重新筛选、取值获值等操作，使数据输出更加科学合理。</li>
                <li>由于多浏览器兼容与W3C规则严谨度要求，建议标签预览仅作为预览使用，不作为保存操作，以免产生乱码。</li>
            </ul>
        </div>
    </asp:WizardStep>
</WizardSteps>
<StepNavigationTemplate><center></center></StepNavigationTemplate>
<StartNavigationTemplate><center></center></StartNavigationTemplate>
<FinishNavigationTemplate><center></center></FinishNavigationTemplate>
</asp:Wizard>
</ContentTemplate></asp:UpdatePanel></div>
<div class="hidden">
    <asp:Button runat="server" class="d-none" ID="Save_Btn" OnClick="BtnSave_Click" Text="保存" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/Design/JS/sea.js"></script>
<script src="/JS/jquery.validate.min.js"></script> 
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/Plugins/CodeMirror/LabelCall.js?v=1"></script>
<script>
    //LabelCall调用
    var diag = new ZL_Dialog();
    function opentitle(url, title) {
        diag.url = url;
        diag.title = title;
        diag.ShowModal();
    }
    function closeCuModal() {
        diagLabel.CloseModal();
    }
    //新增Div参数块,拥有绑定功能
    function pdrag(ev) {
        var code = $(ev.target ? ev.target : ev.srcElement).attr("code");
        ev.dataTransfer.setData("Text", code);
    }
    function VoteCheck() {
        var validator = $("#form1").validate({ meta: "validate" });
        return validator.form();
    }
    function changecate(obj) {
        var $text = $("#<%=LabelCate_T.ClientID %>");
        $text.val($(obj).val());
    }
    function saveEditor() {
        $("#textContent").val(editor.getValue());
        return true;
    }
    var base64 = null;
    seajs.use(["base64"], function (instance) { base64 = instance; })

    var labelEditor = {
        current: "Content_T",
        load: function (dom, id) {
            var ref = this;
            if (id == ref.current) { return; }
            else { $("#" + ref.current).val(editor.getValue()); }
            $(dom).closest(".nav-tabs").find("a").removeClass("active");
            $(dom).addClass("active");
            //---------------------
            ref.current = id;
            $("#textContent").val($("#" + id).val());
            editor.setValue($("#" + id).val());
        },
        save: function () {
            var ref = this;
            $("#" + ref.current).val(editor.getValue());
        }
    };
	
</script> 
</asp:Content>