<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlowStep.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.AddFlowStep" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程设计</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
		new Bread("AddFlow.aspx?proID="+ proID,"流程设计"),
        new Bread() {url="", text="添加步骤",addon="" }}
		)
    %>
    <div id="Addstep" class="container-fluid pr-0" runat="server">
	<div class="row sysRow list_choice">
        <table class="table table-striped table-bordered table-hover sys_table">
            <tr>
                <th class="w12rem_lg">序号</th>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" ID="stepCodeT" Enabled="false" Width="40" /></td>
            </tr>
            <tr>
                <th>步骤名称 <span  class="text-danger">*</span></th>
                <td>
                    <ZL:TextBox runat="server" CssClass="form-control max20rem" ID="stepNameT" AllowEmpty="false"  />
                </td>
            </tr>
            <tr>
                <th>步骤简述</th>
                <td><asp:TextBox runat="server" ID="remindT" CssClass="form-control max20rem" /></td>
            </tr>
            <tr><th>所属步骤</th>
                <td><asp:DropDownList runat="server" ID="ParentID_DP" DataTextField="StepName" DataValueField="ID" class="form-control max20rem" />
					<small class="text-muted">提示:指定所属父步骤,用于创建分支流程</small>
                </td>
            </tr>
            <tr>
                <th>主办人</th>
                <td>
                    <div>
                        <asp:TextBox runat="server" ID="ReferUser_Alias_T" class="form-control max20rem" placeholder="主办名称" Text="主办人" />
                        <asp:CheckBox runat="server" ID="RUser_ChangeUser" Text="更改协辅办(流程中，主办人可更改协办与辅办人员)" />
                        <asp:CheckBox runat="server" ID="RUser_ManageAttach" Text="主办人可管理附件" />
                    </div>
                    <div class="input-group max20rem" style="display:none;">
                        <asp:TextBox runat="server" ID="ReferUser_T" CssClass="form-control" />
                        <span class="input-group-btn">
                            <input type="button" value="选择" onclick="selRuser();" class="btn btn-info" />
                        </span>
                    </div>
                    <asp:HiddenField runat="server" ID="ReferUser_Hid" />
                </td>
            </tr>
            <tr>
                <th>协办人<br />(可查看与批复)</th>
                <td>
                    <div>
                        <asp:TextBox runat="server" ID="CCUser_Alias_T" class="form-control max20rem" placeholder="协办名称" Text="协办人" />
                        <asp:CheckBox runat="server" ID="CCUser_Allow_Chk" Text="允许协办" Checked="true" />
                        <asp:CheckBox runat="server" ID="CCUser_Write" Text="协办允许批复" Checked="true" />
                        <asp:CheckBox runat="server" ID="CCUser_HQ" Text="协办会签(协办必须完成会签才能进入下一步)" />
                    </div>
                    <div style="display:none;">
                        <div class="input-group max20rem">
                            <asp:TextBox runat="server" ID="CCUser_T" CssClass="form-control" />
                            <span class="input-group-btn">
                                <input type="button" value="选择" onclick="selCUser();" class="btn btn-info" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="CCUser_Hid" />
                    </div>
                </td>
            </tr>
            <tr><th>辅办人<br />(权限同于协办)</th><td>
                <div>
                    <asp:TextBox runat="server" ID="HelpUser_Alias_T" class="form-control max20rem" placeholder="辅办名称,无则为辅办人" />
                    <asp:CheckBox runat="server" ID="HelpUser_Allow_Chk" Text="允许辅办" />
                    <asp:CheckBox runat="server" ID="HUser_Write" Text="辅办允许批复"  />
                </div>
            </td>
            </tr>
            <tr>
                <th>会签选项</th>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control max20rem" ID="hqOptionDP">
                        <asp:ListItem Value="0">任意一人即可</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">必须全部审核</asp:ListItem>
                    </asp:DropDownList>
					<small class="text-muted">提示:选择必须全部审核,则需要所有经办人审核并同意,才能进入下一步骤</small>
                </td>
            </tr>
            <tr>
                <th>转交</th>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control max20rem" ID="qzzjDP">
                        <asp:ListItem Value="1">允许</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                    </asp:DropDownList>
					<small class="text-muted">提示:经办人未办理完毕时是否允发起人强制转交</small>
					</td>
            </tr>
            <tr>
                <th>是否允许回退</th>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control max20rem" ID="htDP">
                        <asp:ListItem Value="0">不允许</asp:ListItem>
                        <asp:ListItem Value="1">允许回退上一步骤</asp:ListItem>
                        <asp:ListItem Value="2">允许回退之前步骤</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr runat="server" visible="false">
                <th>转交时,邮件自动通知以下人员</th>
                <td>
                    <div class="mb-3">
                        <span class="pull-left text-right">会员：</span>
                        <div class="input-group max20rem">
                            <asp:TextBox runat="server" CssClass="form-control" ID="emailAlertT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="emailSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'emailAlert');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="emailAlertD" />
                    </div>
                    <div>
                        <span class="pull-left text-right">会员组：</span>
                        <div class="input-group max20rem">
                            <asp:TextBox runat="server" CssClass="form-control" ID="emailGroupT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button3" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'emailGroup');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="emailGroupD" />
                    </div>
                </td>
            </tr>
            <tr runat="server" visible="false">
                <th>转交时,短信通知以下人员</th>
                <td>
                    <div class="mb-3">
                        <span class="pull-left text-right">会员：</span>
                        <div class="input-group max20rem">
                            <asp:TextBox runat="server" CssClass="form-control" ID="smsAlertT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="smsSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'smsAlert');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="smsAlertD" />
                    </div>
                    <div>
                        <span class="pull-left text-right">会员组：</span>
                        <div class="input-group max20rem">
                            <asp:TextBox runat="server" CssClass="form-control" ID="smsGroupT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="Button4" value="选择" class="btn btn-primary" onclick="showdiv('div_group', 'smsGroup');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="smsGroupD" />
                    </div>
                </td>
            </tr>
            <tr>
                <th>步骤完成后,下一步权限</th>
                <td>
                    <label><input type="radio" name="next_rad" value="refer"/>主办人</label>
                    <label><input type="radio" name="next_rad" value="sender" />发起人</label>
                    <label><input type="radio" name="next_rad" value="all" checked="checked"/>主办人和发起人</label>
                </td>
            </tr>
            <tr>
                <th>步骤完成后,下一步可操作</th>
                <td>
                    <label><input type="checkbox" name="nextop_chk" value="文件归档" />文件归档</label>
                    <label><input type="checkbox" name="nextop_chk" value="文件传阅" />文件传阅</label>
            <%--        <label><input type="checkbox" name="nextop_chk" value="文件呈阅" />文件呈阅</label>--%>
                </td>
            </tr>
            <%--            <tr>
                <th>公共附件选项</th>
                <td>
                    <asp:DropDownList runat="server" ID="PublicAttachOptionDP" CssClass="form-control text_md">
                        <asp:ListItem Value="0">不允许附件</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">允许附件</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>--%>
            <tr>
                <th>操作</th>
                <td>
                    <asp:Button runat="server" ID="saveBtn" Text="添加步骤" OnClick="saveBtn_Click" CssClass="btn btn-info" />
                    <a href="AddFlow.aspx?proID=<%:proID %>" class="btn btn-outline-info">返回列表</a>
                </td>
            </tr>
        </table>
	</div>
    </div>
    <asp:HiddenField runat="server" ID="referUserDatas_Hid" />
    <asp:HiddenField runat="server" ID="ccUserDatas_Hid" />

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script>
        //user.hook["ReferUser"] = userdeal;
        //user.hook["CCUser"] = userdeal;
        //function userdeal(list, select) {
        //    var names ="" ,ids="";
        //    for(var i =0;i<list.length;i++){
        //        names += list[i].UserName + ",";
        //        ids += list[i].UserID + ",";
        //    }
        //    $("#" + select + "_T").val(names);
        //    $("#" + select + "_Hid").val(ids);
        //    if (comdiag != null) { CloseComDiag(); }
        //}
        function selRuser() {
            ShowComDiag("/Common/Dialog/SelStructure.aspx?Type=AllInfo#ReferUser", "选择主办人");
        }
        function selCUser()
        {
            ShowComDiag("/Common/Dialog/SelStructure.aspx?Type=AllInfo#CCUser", "选择协办人");
        }
        function UserFunc(json, select) {
            return user.deal_def(json, select);
        }

    </script>
</asp:Content>
