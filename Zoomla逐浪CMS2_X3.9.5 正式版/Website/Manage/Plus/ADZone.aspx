<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ADZone.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.ADZone" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>广告版位</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ADZoneManage.aspx","扩展功能"),
        new Bread("ADZoneManage.aspx","版位管理"),
        new Bread() {url="ADZone.aspx", text="版位编辑",addon="" }},
		Call.GetHelp(28)
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-bordered table-striped sys_table">
        <tr>
            <th class="w12rem_lg">版位名称<span class="text-danger">*</span></th>
            <td>
                <ZL:TextBox ID="TxtZoneName" AllowEmpty="false" class="form-control max20rem" runat="server" MaxLength="100"/>
                
            </td>
        </tr>
        <tr>
            <th>生成JS文件名 <span class="text-danger">*</span></th>
            <td>
                <ZL:TextBox ID="TxtZoneJSName" AllowEmpty="false" class="form-control max20rem" runat="server" EnableViewState="False" MaxLength="100"/>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtZoneJSName" Display="Dynamic" ErrorMessage="JS文件名不正确或者为空！" ValidationExpression="[0-9]{6}\/[0-9]{1,4}\.js" />
            </td>
        </tr>
        <tr>
            <th>版位描述</th>
            <td>
                <asp:TextBox ID="TxtZoneIntro" class="form-control max20rem" runat="server" EnableViewState="False" Height="63px" MaxLength="255" TextMode="multiline" />
            </td>
        </tr>
        <tr>
            <th><p>版位类型</p>
				<small class="text-muted">选择放置于此版位的广告类型。</small>
			</th>
            <td>
                <asp:RadioButtonList ID="radlZonetype" runat="server" AutoPostBack="false" EnableViewState="true" RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Value="7" Selected="True">静默样式</asp:ListItem>
                    <asp:ListItem Value="0">矩形横幅</asp:ListItem>
                    <asp:ListItem Value="1">弹出窗口</asp:ListItem>
                    <asp:ListItem Value="2">随屏移动</asp:ListItem>
                    <asp:ListItem Value="3">固定位置</asp:ListItem>
                    <asp:ListItem Value="4">漂浮移动</asp:ListItem>
                    <asp:ListItem Value="5">文字代码</asp:ListItem>
                    <asp:ListItem Value="6">对联广告</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th><p>版位位置</p>
				<small class="text-muted">对版位的详细参数进行设置。</small>
                <br />
            </th>
            <td>
                <asp:RadioButtonList ID="RBLDefaultSetting" runat="server" RepeatDirection="Horizontal" AutoPostBack="false">
                    <asp:ListItem Value="1" Selected="True">默认设置</asp:ListItem>
                    <asp:ListItem Value="0">自定义设置</asp:ListItem>
                </asp:RadioButtonList>
                <div id="ZoneTypeSetting">
                    <div id="ZoneTypeSetting_Empty" class="alert alert-info setItem">
                        此类型无版位参数设置！
                    </div>
                    <div id="ZoneTypeSetting2" class="setItem">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <td>弹出方式： </td>
                                <td>
                                    <asp:DropDownList ID="DropPopType" CssClass="form-control text_md" Width="150" runat="server">
                                        <asp:ListItem Value="1">前置窗口</asp:ListItem>
                                        <asp:ListItem Value="2">后置窗口</asp:ListItem>
                                        <asp:ListItem Value="3">网页对话框</asp:ListItem>
                                        <asp:ListItem Value="4">背投广告</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>弹出位置： </td>
                                <td>
                                    <asp:DropDownList ID="DropPopPosition" CssClass="form-control text_md" Width="150" runat="server">
                                        <asp:ListItem Value="1" Text="左上" Selected="true"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="左下"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="右上"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="右下"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><span id="PopLeft">左</span>： </td>
                                <td>
                                    <asp:TextBox ID="TxtPopLeft" CssClass="form-control text_md" runat="server" Text="100" MaxLength="4" TextMode="SingleLine" Width="80" /></td>
                            </tr>
                            <tr>
                                <td><span id="PopTop">上</span>： </td>
                                <td>
                                    <asp:TextBox ID="TxtPopTop" CssClass="form-control text_md" runat="server" Text="100" MaxLength="4" TextMode="singleLine" Width="80" /></td>
                            </tr>
                            <tr>
                                <td>时间间隔： </td>
                                <td>
                                    <asp:TextBox ID="TxtPopCookieHour" Text="0" MaxLength="2" TextMode="singleLine" Width="36px" runat="server" />
                                    小时 在时间间隔内不重复弹出，设为0时总是弹出 </td>
                            </tr>
                        </table>
                    </div>
                    <div id="ZoneTypeSetting3" class="setItem">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <td>广告位置： </td>
                                <td>
                                    <asp:DropDownList ID="DropMovePosition" CssClass="form-control text_md" Width="150" runat="server">
                                        <asp:ListItem Value="1" Text="左上" Selected="true"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="左下"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="右上"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="右下"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td><span id="MoveLeft">左</span>： </td>
                                <td>
                                    <asp:TextBox ID="TxtMoveLeft" CssClass="form-control text_md" MaxLength="4" Width="80" Text="15" TextMode="singleLine" runat="server" /></td>
                            </tr>
                            <tr>
                                <td><span id="MoveTop">上</span>： </td>
                                <td>
                                    <asp:TextBox ID="TxtMoveTop" CssClass="form-control text_md" MaxLength="4" Width="80" Text="200" TextMode="singleLine" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>移动平滑度： </td>
                                <td>
                                    <asp:TextBox ID="TxtMoveDelay" CssClass="form-control text_md" MaxLength="7" Text="0.015" TextMode="singleLine" runat="server" Width="80" />
                                    （取值在0.001至1之间） 
                                </td>
                            </tr>
                            <tr>
                                <td>是否显示关闭标签： </td>
                                <td>
                                    <asp:RadioButtonList ID="RadlMoveShowCloseAD" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="true">是</asp:ListItem>
                                        <asp:ListItem Value="false" Selected="True">否</asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr>
                                <td>关闭标签的颜色： </td>
                                <td>
                                    <asp:TextBox ID="TxtMoveCloseFontColor" class="form-control text_md" runat="server" />
                                    <img src="/images/<%=string.IsNullOrEmpty(TxtMoveCloseFontColor.Text) ? "rectNoColor.gif" : "rect.gif" %>"
                                        width="18" height="17" border="0" id="MoveCloseFontColorShow" alt="选取颜色" style="cursor: pointer;" title="选取颜色!" onclick="GetColor($('MoveCloseFontColorShow'),'TxtMoveCloseFontColor');" /></td>
                            </tr>
                        </table>
                    </div>
                    <div id="ZoneTypeSetting4" class="setItem">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <td>广告位置： </td>
                                <td>
                                    <asp:DropDownList ID="DropFixedPosition" CssClass="form-control text_md" Width="150" runat="server">
                                        <asp:ListItem Value="1" Text="左上" Selected="true"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="左下"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="右上"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="右下"></asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td><span id="FixedLeft">左</span>： </td>
                                <td>
                                    <asp:TextBox ID="TxtFixedLeft" CssClass="form-control text_md" MaxLength="4" Text="100" TextMode="singleLine" runat="server" Width="80" /></td>
                            </tr>
                            <tr>
                                <td><span id="FixedTop">上</span>： </td>
                                <td>
                                    <asp:TextBox ID="TxtFixedTop" CssClass="form-control text_md" MaxLength="4" Text="100" TextMode="singleLine" Width="80" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>是否显示关闭标签： </td>
                                <td>
                                    <asp:RadioButtonList ID="RadlFixedShowCloseAD" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="true">是</asp:ListItem>
                                        <asp:ListItem Value="false" Selected="True">否</asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr>
                                <td>关闭标签的颜色： </td>
                                <td>
                                    <asp:TextBox ID="TxtFixedCloseFontColor" class="form-control text_md" runat="server" />
                                    <img src="/images/<%=string.IsNullOrEmpty(TxtMoveCloseFontColor.Text) ? "rectNoColor.gif" : "rect.gif" %>"
                                        width="18" height="17" border="0" id="FixedCloseFontColorShow" alt="选取颜色" style="cursor: pointer; background-color: #<%=TxtFixedCloseFontColor.Text %>;" title="选取颜色!" onclick="GetColor($('FixedCloseFontColorShow'),'TxtFixedCloseFontColor');" /></td>
                            </tr>
                        </table>
                    </div>
                    <div id="ZoneTypeSetting5" class="setItem">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <td>漂浮类型： </td>
                                <td>
                                    <asp:DropDownList ID="DropFloatType" CssClass="form-control text_md" Width="150" runat="server">
                                        <asp:ListItem Value="1">变速漂浮</asp:ListItem>
                                        <asp:ListItem Value="2">匀速漂浮</asp:ListItem>
                                        <asp:ListItem Value="3">上下漂浮</asp:ListItem>
                                        <asp:ListItem Value="4">左右漂浮</asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td>开始位置： </td>
                                <td>
                                    <asp:DropDownList ID="DropFloatPosition" CssClass="form-control text_md" Width="150" runat="server">
                                        <asp:ListItem Value="1" Text="左上" Selected="true"></asp:ListItem>
                                        <asp:ListItem Value="2" Text="左下"></asp:ListItem>
                                        <asp:ListItem Value="3" Text="右上"></asp:ListItem>
                                        <asp:ListItem Value="4" Text="右下"></asp:ListItem>
                                    </asp:DropDownList></td>
                            </tr>
                            <tr>
                                <td><span id="FloatLeft">左</span>： </td>
                                <td>
                                    <asp:TextBox ID="TxtFloatLeft" CssClass="form-control text_md" MaxLength="4" Text="100" TextMode="singleLine" Width="80" runat="server" /></td>
                            </tr>
                            <tr>
                                <td><span id="FloatTop">上</span>： </td>
                                <td>
                                    <asp:TextBox ID="TxtFloatTop" CssClass="form-control text_md" MaxLength="4" Text="100" TextMode="singleLine" Width="80" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>是否显示关闭标签： </td>
                                <td>
                                    <asp:RadioButtonList ID="RadlFloatShowCloseAD" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="true">是</asp:ListItem>
                                        <asp:ListItem Value="false" Selected="True">否</asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr>
                                <td>关闭标签的颜色： </td>
                                <td>
                                    <asp:TextBox ID="TxtFloatCloseFontColor" class="form-control text_md" runat="server" />
                                    <img src="/images/<%=string.IsNullOrEmpty(TxtMoveCloseFontColor.Text) ? "rectNoColor.gif" : "rect.gif" %>"
                                        width="18" height="17" border="0" id="FloatCloseFontColorShow" alt="选取颜色" style="cursor: pointer; background-color: #<%=TxtFloatCloseFontColor.Text %>;" title="选取颜色!" onclick="GetColor($('FloatCloseFontColorShow'),'TxtFloatCloseFontColor');" /></td>
                            </tr>
                        </table>
                    </div>
                    <div id="ZoneTypeSetting7" class="setItem">
                        <table class="table table-striped table-bordered">
                            <tr>
                                <td>左右边距： </td>
                                <td>
                                    <asp:TextBox ID="TxtCoupletLeft" CssClass="form-control text_md" MaxLength="4" Width="80" Text="15" TextMode="singleLine" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>上边距： </td>
                                <td>
                                    <asp:TextBox ID="TxtCoupletTop" CssClass="form-control text_md" MaxLength="4" Width="80" Text="200" TextMode="singleLine" runat="server" /></td>
                            </tr>
                            <tr>
                                <td>移动平滑度： </td>
                                <td>
                                    <asp:TextBox ID="TxtCoupletDelay" CssClass="form-control text_md" MaxLength="7" Text="0.015" TextMode="singleLine" runat="server" Width="80" />
                                    （取值在0.001至1之间） </td>
                            </tr>
                            <tr>
                                <td>是否显示关闭标签： </td>
                                <td>
                                    <asp:RadioButtonList ID="RadlCoupletShowCloseAD" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Value="true">是</asp:ListItem>
                                        <asp:ListItem Value="false" Selected="True">否</asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr>
                                <td>关闭标签的颜色： </td>
                                <td>
                                    <asp:TextBox ID="TxtCoupletCloseFontColor" CssClass="form-control text_md" runat="server" Width="100" />
                                    <img src="/images/<%=string.IsNullOrEmpty(TxtMoveCloseFontColor.Text) ? "rectNoColor.gif" : "rect.gif" %>"
                                        width="18" height="17" border="0" id="CoupletCloseFontColorShow" alt="选取颜色" style="cursor: pointer; background-color: <%=TxtCoupletCloseFontColor.Text %>;" title="选取颜色!" onclick="GetColor($('CoupletCloseFontColorShow'),'TxtCoupletCloseFontColor');" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <th><strong>版位尺寸</strong><br />
				<small class="text-muted">
				IAB：互联网广告联合会标准尺寸。<br />
                带*号的为新增加的标准广告尺寸。 </th>
				</small>
            <td>
                <div class="input-group">
				  <div class="input-group-prepend">
					<span class="input-group-text">版位类型</span>
				  </div>
				  <asp:DropDownList ID="DropAdZoneSize" CssClass="form-control max20rem" runat="server" EnableViewState="False">
                        <asp:ListItem Value="468x60">IAB - 468 x 60 IMU (横幅广告)</asp:ListItem>
                        <asp:ListItem Value="234x60">IAB - 234 x 60 IMU (半幅广告)</asp:ListItem>
                        <asp:ListItem Value="88x31">IAB - 88 x 31 IMU (小按钮)</asp:ListItem>
                        <asp:ListItem Value="120x90">IAB - 120 x 90 IMU (按钮一)</asp:ListItem>
                        <asp:ListItem Value="120x60">IAB - 120 x 60 IMU (按钮二)</asp:ListItem>
                        <asp:ListItem Value="728x90">IAB - 728 x 90 IMU (通栏广告) *</asp:ListItem>
                        <asp:ListItem Value="120x240">IAB - 120 x 240 IMU (竖幅广告)</asp:ListItem>
                        <asp:ListItem Value="125x125">IAB - 125 x 125 IMU (方形按钮)</asp:ListItem>
                        <asp:ListItem Value="180x150">IAB - 180 x 150 IMU (长方形) *</asp:ListItem>
                        <asp:ListItem Value="300x250">IAB - 300 x 250 IMU (中长方形) *</asp:ListItem>
                        <asp:ListItem Value="336x280">IAB - 336 x 280 IMU (大长方形)</asp:ListItem>
                        <asp:ListItem Value="240x400">IAB - 240 x 400 IMU (竖长方形)</asp:ListItem>
                        <asp:ListItem Value="250x250">IAB - 250 x 250 IMU (正方形弹出)</asp:ListItem>
                        <asp:ListItem Value="120x600">IAB - 120 x 600 IMU (摩天大楼)</asp:ListItem>
                        <asp:ListItem Value="160x600">IAB - 160 x 600 IMU (宽摩天大楼) *</asp:ListItem>
                        <asp:ListItem Value="300x600">IAB - 300 x 600 IMU (半页广告) *</asp:ListItem>
                        <asp:ListItem Value="100x100">自定义大小</asp:ListItem>
                    </asp:DropDownList>
				  <div class="input-group-append">
					<span class="input-group-text ">宽度</span>
				  </div>
				  <asp:TextBox ID="TxtZoneWidth"  runat="server" CssClass="form-control max20rem" MaxLength="4" Text="468"/>
				  <div class="input-group-append">
					<span class="input-group-text ">高度</span>
				  </div>
				  <asp:TextBox ID="TxtZoneHeight" runat="server" CssClass="form-control max20rem" MaxLength="4" Text="60"/>
				</div>
            </td>
        </tr>
        <tr>
            <th><p>显示方式</p>
				<small class="text-muted">当版位中有多个广告时按照此设定进行显示（依据广告的权重）。</small>
				</th>
				
            <td>
                <div>
                    <asp:RadioButtonList ID="RadlShowType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">按权重随机</asp:ListItem>
                        <asp:ListItem Value="2">按权重优先</asp:ListItem>
                        <asp:ListItem Value="3">按顺序循环</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div>
                    [注意]<br />
                    1、按权重随机显示，权重越大显示机会越大。<br />
                    2、按权重优先显示，显示权重值最大的广告。<br />
                    3、按顺序循环显示，此方式仅对矩形横幅有效。
                </div>
            </td>
        </tr>
        <tr>
            <td><strong>版位状态：</strong><br />
                设为活动的版位才能在前台显示。</td>
            <td>
                <asp:CheckBox ID="ChkActive" runat="server" Checked="true" Text="活动版位" /></td>
        </tr>
        <tr>
            <td><strong>是否开放用户申请：</strong></td>
            <td><asp:CheckBox ID="Sales_Chk" runat="server" Text="允许申请"/></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="EBtnAdZone" runat="server" OnClick="EBtnAdZone_Click" Text="保存信息" class="btn btn-outline-info" />
                <a href="ADZoneManage.aspx" class="btn btn-outline-info">返回列表</a>
            </td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function ShowZoenTypePanel() {
            $(".setItem").hide();
            var cfgRad = $("#RBLDefaultSetting input[type='radio']:checked");
            if (cfgRad.length < 1 || cfgRad.val() == "1") { return; }
            //=================
            var setRad = $("#radlZonetype input[type='radio']:checked");
            var setItemID = "ZoneTypeSetting" + (parseInt(setRad.val()) + 1);
            if ($("#" + setItemID).length > 0) {
                $("#" + setItemID).show();
            }
            else { $("#ZoneTypeSetting_Empty").show(); }
        }
        function Zone_SelectSize(o) {
            size = o.options[o.selectedIndex].value;
            if (size != '0x0') {
                sarray = size.split('x');
                height = sarray.pop();
                width = sarray.pop();
                $("#TxtZoneWidth").val(width);
                $("#TxtZoneHeight").val(height);
            } else {
                $("#TxtZoneWidth").val(100);
                $("#TxtZoneHeight").val(100);
            }
        }
        ShowZoenTypePanel();
    </script>
</asp:Content>
