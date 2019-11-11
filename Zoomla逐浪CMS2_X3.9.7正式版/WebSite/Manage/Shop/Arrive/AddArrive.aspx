<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddArrive.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Arrive.AddArrive" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.优惠劵 %></title>
		<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/I/Main.aspx",Resources.L.工作台),
	new Bread("../ProductManage.aspx",Resources.L.商城管理),
	new Bread("ArriveManage.aspx",Resources.L.优惠券管理),
	new Bread(){url="", text=Resources.L.优惠券}
	}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive">
<table class="table table-striped table-bordered sys_table">
        <tr>
            <th class="w12rem_lg"><strong><%=Resources.L.卡别名 %> <span class="text-danger">*</span></strong></th>
            <td>
                <ZL:TextBox ID="txtName" runat="server" CssClass="form-control max20rem" AllowEmpty="false" ValidType="String"></ZL:TextBox>
				<small class="text-muted"><%=Resources.L.卡别名_notice %></small>
            </td>
        </tr>
        <tr>
            <th><strong><%=Resources.L.优惠券类型 %></strong></th>
            <td>
                <label><input type="radio" name="type_rad" value="0" checked="checked"/><%=Resources.L.优惠券 %></label>
                <label><input type="radio" name="type_rad" value="1"/><%=Resources.L.折扣券 %></label>
                <label><input type="radio" name="type_rad" value="2"/><%=Resources.L.商品赠券 %></label>
            </td>
        </tr>
        <tr class="view_add">
            <th><strong><%=Resources.L.编码类型 %></strong></th>
            <td>
                <asp:RadioButtonList RepeatDirection="Horizontal" runat="server" ID="EcodeType">
                    <asp:ListItem Value="2" Selected="True" Text="<%$Resources:L,混淆 %>"></asp:ListItem>
                    <asp:ListItem Value="0" Text="<%$Resources:L,数字 %>"></asp:ListItem>
                    <asp:ListItem Value="1" Text="<%$Resources:L,字母 %>"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr class="view_add">
            <th><strong><%=Resources.L.生成数量 %></strong> <span class="text-danger">*</span></th>
            <td>
                <ZL:TextBox ID="txtCreateNum" runat="server" CssClass="form-control max20rem" AllowEmpty="false" ValidType="FloatPostive" Text="10" /></td>
        </tr>
        <tr class="type-tab" id="type0">
            <th><strong><%=Resources.L.优惠金额 %></strong> <span class="text-danger">*</span></th>
            <td>
                <ZL:TextBox ID="Amount_T" runat="server" CssClass="form-control max20rem" ValidType="FloatPostive" Text="1" />
            </td>
        </tr>
        <tr class="type-tab" id="type1">
        <th><strong><%=Resources.L.折扣比率 %></strong></th>
        <td>
            <div class="input-group max20rem">
                <span class="input-group-addon"><%=Resources.L.折扣比率 %></span>
                <ZL:TextBox ID="Amount2_T" runat="server" CssClass="form-control" ValidType="FloatPostive" Text="100" />
                <span class="input-group-addon">%</span>
            </div>
              <div class="input-group max20rem mr-2">
                  <span class="input-group-addon"><%=Resources.L.最大抵扣 %></span>
                  <ZL:TextBox ID="Amount2_Max" runat="server" CssClass="form-control" ValidType="FloatPostive" Text="100" />
                  <span class="input-group-addon"><%=Resources.L.元 %></span>
              </div>
            <div class="rd_green">
                <div><%=Resources.L.折扣比率_notice %></div>
                <div><%=Resources.L.最大抵扣_notice %></div>
            </div>
        </td>
    </tr>
        <tr>
            <th><strong><%=Resources.L.适用金额范围 %> <span class="text-danger">*</span></strong></th>
            <td>
				<div class="input-group max20rem">
				  <asp:TextBox runat="server" ID="minAmount_T" class="form-control" MaxLength="10" Text="0" />
				  <div class="input-group-append">
					<span class="input-group-text"><%=Resources.L.到 %></span>
				  </div>
				  <asp:TextBox runat="server" ID="maxAmount_T" class="form-control" MaxLength="10" />
			  </div>
				
				<small class="text-muted"><%=Resources.L.适用金额范围_notice %></small>
        </tr>
        <tr>
            <th><strong><%=Resources.L.适用店铺 %></strong></th>
            <td>
                <asp:DropDownList runat="server" ID="Store_DP" class="form-control max20rem" DataTextField="Title" DataValueField="GeneralID"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th><strong><%=Resources.L.适用商品 %></strong></th>
            <td>
                <input type="button" value="<%$Resources:L,选择商品 %>" onclick="upro.showdiag();" class="btn btn-outline-info" runat="server" id="selpro_btn" />
                <%--    <asp:Button runat="server" ID="AddUPro_Btn" OnClick="AddUPro_Btn_Click" class="btn btn-info" Text="保存修改" />--%>
                <div id="uprolist" class="uprolist"></div>
                <asp:HiddenField runat="server" ID="UProIDS_Hid" />
                <script>
                    var upro = {};
                    upro.init = function () { $("#uprolist").load("/Common/Comp/ProductList.aspx?ProIDS=" + $("#UProIDS_Hid").val()); }
                    upro.showdiag = function () { ShowComDiag("<%:customPath2%>Shop/ProductsSelect.aspx?callback=selupro", "选择商品"); }
                    upro.del = function (btn, proid) {
                        var ids = $("#UProIDS_Hid").val();
                        ids = ids.replace("," + proid + ",", ",");
                        $("#UProIDS_Hid").val(ids);
                        $(btn).closest(".up_proitem").remove();
                    }
                    function selupro(list) {
                        list = JSON.parse(list);
                        var ids = list.GetIDS("id");
                        ids = $("#UProIDS_Hid").val() + "," + ids;
                        $("#UProIDS_Hid").val(ids);
                        $("#uprolist").load("/Common/Comp/ProductList.aspx?ProIDS=" + ids);
                    }
                    $(function () { upro.init(); })
                </script>
            </td>
        </tr>
    <tr>
        <td><strong><%=Resources.L.日期类型 %></strong></td>
        <td>
            <label><input type="radio" name="date_rad" value="0" checked="checked"/><%=Resources.L.生效与到期时间 %></label>
            <label><input type="radio" name="date_rad" value="1"/><%=Resources.L.用户领取后计时 %></label>
            <label><input type="radio" name="date_rad" value="2"/><%=Resources.L.不限时 %></label>
        </td>
    </tr>
        <tr class="date-tab" id="date0">
            <th><strong><%=Resources.L.有效时间 %></strong></th>
            <td>
				<div class="input-group mb-2">
				  <div class="input-group-append">
					<span class="input-group-text"><%=Resources.L.生效时间 %></span>
				  </div>
				  <asp:TextBox ID="AgainTime_T" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" CssClass="form-control max20rem" />
				</div>
				<div class="input-group mb-2">
				  <div class="input-group-append">
					<span class="input-group-text"><%=Resources.L.到期时间 %></span>
				  </div>
				  <asp:TextBox ID="EndTime_T" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd'});" runat="server" CssClass="form-control max20rem" />
				</div>
               </div>
                <asp:RequiredFieldValidator ID="RV2" runat="server" ForeColor="Red" ControlToValidate="AgainTime_T" ErrorMessage="<%$Resources:L,生效时间不能为空 %> " />
                <asp:RequiredFieldValidator ID="RV3" runat="server" ForeColor="Red" ControlToValidate="EndTime_T" ErrorMessage="<%$Resources:L,到期时间不能为空 %>" />
            </td>
        </tr>
        <tr class="date-tab" id="date1">
                <th><strong><%=Resources.L.有效天数 %></strong></th>
                <td>
                    <div class="input-group max20rem">
                        <asp:TextBox runat="server" ID="DateDays_T" class="form-control" />
                        <span class="input-group-addon"><%=Resources.L.天 %></span>
                    </div>
                </td>
            </tr>
        <tbody id="edit_body" runat="server">
            <tr>
                <th><strong><%=Resources.L.编号 %></strong></th>
                <td>
                    <asp:TextBox ID="txtNo" runat="server" Enabled="false" CssClass="form-control text_md"></asp:TextBox></td>
            </tr>
            <tr>
                <th><strong><%=Resources.L.密码 %></strong></th>
                <td>
                    <asp:TextBox ID="txtPwd" runat="server" Enabled="false" CssClass="form-control text_md"></asp:TextBox></td>
            </tr>
            <tr>
                <th><strong><%=Resources.L.状态 %></strong></th>
                <td>
                    <asp:TextBox ID="txtState" runat="server" Enabled="false" CssClass="form-control text_md"></asp:TextBox></td>
            </tr>
            <tr>
                <th><strong><%=Resources.L.所属用户 %></strong></th>
                <td>
                    <asp:TextBox ID="txtUserID" runat="server" Enabled="false" CssClass="form-control text_md"></asp:TextBox>
                </td>
            </tr>
        </tbody>
        <tr class="view_add">
            <th><strong><%=Resources.L.绑定用户 %></strong></th>
            <td>
                <input type="button" onclick="SelUser();" class="btn btn-outline-info" value="<%=Resources.L.选择用户 %>" />
                <div id="upro_wrap" style="width: 600px; max-height: 400px; overflow-y: auto;"></div>
            </td>
        </tr>
        <tr>
            <th><strong><%=Resources.L.是否激活 %></strong></th>
            <td>
                <input type="checkbox" runat="server" id="state_chk" checked="checked" class="switchChk" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="EBtnSubmit" class="btn btn-info" Text="<%$Resources:L,制作优惠劵 %>" runat="server" OnClick="EBtnSubmit_Click" />
                <a href="ArriveManage.aspx" class="btn btn-outline-info"><%=Resources.L.返回列表 %></a></td>
        </tr>
    </table>
</div>
</div>
<asp:HiddenField runat="server" ID="UserID_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/Controls/Control.js?v=1"></script>
<script>
    function closeDiag() { CloseComDiag(); }
    function SelUser() {
        comdiag.maxbtn = false;
        ShowComDiag("/Common/Dialog/SelGroup.aspx", "选择用户");
    }
    function delUser(btn, uid) {
        var $hid = $("#UserID_Hid");
        $(btn).closest("tr").remove();
        var ids = idshelp.del($hid.val(), uid);
        $hid.val(ids);
    }
    function UserFunc(list, select) {
        var ids = idshelp.merge(list.GetIDS("UserID"), $("#UserID_Hid").val());
        $("#upro_wrap").load("/common/comp/UserList.aspx?del=delUser", { "ids": ids });
        $("#UserID_Hid").val(ids);
        CloseComDiag();
    }
    $(function () {
        if ("<%:Mid%>" != "0") { $(".view_add").hide(); }
    })

    var typeTab = new ZLTab().initByRad({ prefix: "type" });
    var dateTab = new ZLTab().initByRad({prefix:"date"});
</script>
</asp:Content>
