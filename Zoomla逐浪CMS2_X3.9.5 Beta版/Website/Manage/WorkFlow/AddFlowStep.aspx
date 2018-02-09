<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlowStep.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.AddFlowStep" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程设计</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="Addstep" runat="server">
        <table class="table table-striped table-bordered table-hover">
            <tr>
                <td style="width: 200px;">序号:</td>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control" ID="stepCodeT" Enabled="false" Width="40" Style="text-align: center;" /></td>
            </tr>
            <tr>
                <td>步骤名称:</td>
                <td>
                    <ZL:TextBox runat="server" CssClass="form-control text_300" ID="stepNameT" AllowEmpty="false"  />
                    <span style="color: #f00;">*</span>
                </td>
            </tr>
            <tr>
                <td>步骤简述：</td>
                <td><asp:TextBox runat="server" ID="remindT" CssClass="form-control text_300" /></td>
            </tr>
            <tr><td>所属步骤：</td>
                <td><asp:DropDownList runat="server" ID="ParentID_DP" DataTextField="StepName" DataValueField="ID" class="form-control text_300" />
                    <span>提示:指定所属父步骤,用于创建分支流程</span>
                </td>
            </tr>
            <tr>
                <td>主办人:</td>
                <td>
                    <div>
                        <asp:TextBox runat="server" ID="ReferUser_Alias_T" class="form-control text_300" placeholder="主办名称" Text="主办人" />
                        <asp:CheckBox runat="server" ID="RUser_ChangeUser" Text="更改协辅办(流程中，主办人可更改协办与辅办人员)" />
                        <asp:CheckBox runat="server" ID="RUser_ManageAttach" Text="主办人可管理附件" />
                    </div>
                    <div class="input-group text_300 margin_t5" style="display:none;">
                        <asp:TextBox runat="server" ID="ReferUser_T" CssClass="form-control" />
                        <span class="input-group-btn">
                            <input type="button" value="选择" onclick="selRuser();" class="btn btn-info" />
                        </span>
                    </div>
                    <asp:HiddenField runat="server" ID="ReferUser_Hid" />
                </td>
            </tr>
            <tr>
                <td>协办人：<br />(可查看与批复)</td>
                <td>
                    <div>
                        <asp:TextBox runat="server" ID="CCUser_Alias_T" class="form-control text_300" placeholder="协办名称" Text="协办人" />
                        <asp:CheckBox runat="server" ID="CCUser_Allow_Chk" Text="允许协办" Checked="true" />
                        <asp:CheckBox runat="server" ID="CCUser_Write" Text="协办允许批复" Checked="true" />
                        <asp:CheckBox runat="server" ID="CCUser_HQ" Text="协办会签(协办必须完成会签才能进入下一步)" />
                    </div>
                    <div class="margin_t5" style="display:none;">
                        <div class="input-group text_300">
                            <asp:TextBox runat="server" ID="CCUser_T" CssClass="form-control" />
                            <span class="input-group-btn">
                                <input type="button" value="选择" onclick="selCUser();" class="btn btn-info" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="CCUser_Hid" />
                    </div>
                </td>
            </tr>
            <tr><td>辅办人：<br />(权限同于协办)</td><td>
                <div>
                    <asp:TextBox runat="server" ID="HelpUser_Alias_T" class="form-control text_300" placeholder="辅办名称,无则为辅办人" />
                    <asp:CheckBox runat="server" ID="HelpUser_Allow_Chk" Text="允许辅办" />
                    <asp:CheckBox runat="server" ID="HUser_Write" Text="辅办允许批复"  />
                </div>
            </td>
            </tr>
            <tr>
                <td>会签选项:</td>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control text_300" ID="hqOptionDP">
                        <asp:ListItem Value="0">任意一人即可</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">必须全部审核</asp:ListItem>
                    </asp:DropDownList>
                    <span>提示:选择必须全部审核,则需要所有经办人审核并同意,才能进入下一步骤</span>
                </td>
            </tr>
            <tr>
                <td>转交:</td>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control text_300" ID="qzzjDP">
                        <asp:ListItem Value="1">允许</asp:ListItem>
                        <asp:ListItem Value="0" Selected="True">不允许</asp:ListItem>
                    </asp:DropDownList>
                    <span>提示:经办人未办理完毕时是否允发起人强制转交</span></td>
            </tr>
            <tr>
                <td>是否允许回退：</td>
                <td>
                    <asp:DropDownList runat="server" CssClass="form-control text_300" ID="htDP">
                        <asp:ListItem Value="0">不允许</asp:ListItem>
                        <asp:ListItem Value="1">允许回退上一步骤</asp:ListItem>
                        <asp:ListItem Value="2">允许回退之前步骤</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr runat="server" visible="false">
                <td>转交时,邮件自动通知以下人员：</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="emailAlertT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="emailSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'emailAlert');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="emailAlertD" />
                    </div>
                    <div>
                        <span class="pull-left text-right" style="width: 100px;">会员组：</span>
                        <div class="input-group" style="width: 300px;">
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
                <td>转交时,短信通知以下人员：</td>
                <td>
                    <div style="margin-bottom: 10px;">
                        <span class="pull-left text-right" style="width: 100px;">会员：</span>
                        <div class="input-group" style="width: 300px;">
                            <asp:TextBox runat="server" CssClass="form-control" ID="smsAlertT" Enabled="false" />
                            <span class="input-group-btn">
                                <input type="button" id="smsSelBtn" value="选择" class="btn btn-primary" onclick="showdiv('div_share', 'smsAlert');" />
                            </span>
                        </div>
                        <asp:HiddenField runat="server" ID="smsAlertD" />
                    </div>
                    <div>
                        <span class="pull-left text-right" style="width: 100px;">会员组：</span>
                        <div class="input-group" style="width: 300px;">
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
                <td>步骤完成后,下一步权限：</td>
                <td>
                    <label><input type="radio" name="next_rad" value="refer"/>主办人</label>
                    <label><input type="radio" name="next_rad" value="sender" />发起人</label>
                    <label><input type="radio" name="next_rad" value="all" checked="checked"/>主办人和发起人</label>
                </td>
            </tr>
            <tr>
                <td>步骤完成后,下一步可操作</td>
                <td>
                    <label><input type="checkbox" name="nextop_chk" value="文件归档" />文件归档</label>
                    <label><input type="checkbox" name="nextop_chk" value="文件传阅" />文件传阅</label>
            <%--        <label><input type="checkbox" name="nextop_chk" value="文件呈阅" />文件呈阅</label>--%>
                </td>
            </tr>
            <%--            <tr>
                <td>公共附件选项：</td>
                <td>
                    <asp:DropDownList runat="server" ID="PublicAttachOptionDP" CssClass="form-control text_md">
                        <asp:ListItem Value="0">不允许附件</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">允许附件</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>--%>
            <tr>
                <td>操作：</td>
                <td>
                    <asp:Button runat="server" ID="saveBtn" Text="添加步骤" OnClick="saveBtn_Click" CssClass="btn btn-primary" />
                    <a href="AddFlow.aspx?proID=<%:proID %>" class="btn btn-default">返回列表</a>
                </td>
            </tr>
        </table>
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
