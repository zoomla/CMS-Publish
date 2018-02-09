<%@ Page Language="C#"  MasterPageFile="~/Manage/I/Default.master" AutoEventWireup="true" CodeBehind="CollectionInfoPage.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.CollectionInfoPage" ValidateRequest="false" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title>采集配置字段设置</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div style="min-height:600px;">
    <table class="table table-bordered">
        <tr>
            <td style="width: 600px;">
                <asp:TextBox ID="txtHtml" CssClass="form-control" runat="server" TextMode="MultiLine" Style="width: 98%; height: 500px; max-width: 98%"></asp:TextBox>
            </td>
            <td class="regextd" rowspan="2">
                <div class="input-group">
                    <span class="input-group-addon">字段名</span>
                    <input type="text" class="form-control" disabled="disabled" value="<%:Request["Alias"] %>" />
                    <span class="input-group-btn"><asp:Button runat="server" ID="Reload_Btn" class="btn btn-info pull-right" Text="重新加载" OnClick="Reload_Btn_Click" title="重新加载html"/></span>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">URL</span>
                    <asp:DropDownList runat="server" ID="Link_DP" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="Link_DP_SelectedIndexChanged"></asp:DropDownList>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">元素类型</span>
                    <asp:TextBox runat="server" ID="EType_T" Text="DIV" CssClass="form-control" />
                    <span id="etype_list" class="input-group-btn">
                        <button type="button" class="btn btn-default">DIV</button>
                        <button type="button" class="btn btn-default">TITLE</button>
                        <button type="button" class="btn btn-default">UL</button>
                        <button type="button" class="btn btn-default">BODY</button>
                    </span>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">ID=</span>
                    <asp:TextBox runat="server" ID="ID_T" CssClass="form-control"/>
                </div>
                <div class="input-group">
                    <span class="input-group-addon">Class=</span>
                    <asp:TextBox runat="server" ID="Class_T" CssClass="form-control" />
                </div>
                <div class="divide"><i class="fa fa-flag"></i>内容过滤</div>
                <div class="margin_t5">
                    <asp:CheckBox runat="server" ID="Script_Chk" Text="允许Script脚本" />
                    <asp:CheckBox runat="server" ID="Flash_Chk" Text="允许Flash插件" Checked="true" />
                </div>
                <div class="divide"><i class="fa fa-flag"></i> 值处理</div>
                <div class="margin_t5">
                    <asp:CheckBox runat="server" ID="Ruler_FirstImg_Chk" Text="仅取第一张图片,勾选该值后将不会使用下面的逻辑" />
                </div>
                <div class="input-group">
                    <span class="input-group-addon">开始字符串</span>
                    <asp:TextBox runat="server" ID="Start_T" CssClass="form-control" />
                </div>
                <div class="input-group">
                    <span class="input-group-addon">结束字符串</span>
                    <asp:TextBox runat="server" ID="End_T" CssClass="form-control" />
                </div>
                <div class="divide"><i class="fa fa-flag"></i> 信息提示</div>
                <div><asp:Label runat="server" ID="CurLink_L" Style="color: green;"></asp:Label></div>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button CssClass="btn btn-primary" runat="server" ID="Save_Btn" OnClick="Save_Btn_Click" Text="保存信息"  />
				<input type="button" value="关闭窗口" class="btn btn-primary" onclick="parent.Close();" />
               <asp:Button runat="server" ID="Test_Btn"  class="btn btn-info pull-right" Text="测试获取" OnClick="Test_Btn_Click" ValidationGroup="Add" />
            </td>
            <td> </td>
        </tr>
    </table>
</div>
<asp:HiddenField ID="Json_Hid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.regextd .input-group{margin-bottom:5px;}
.regextd .input-group-addon{min-width:94px;text-align:center;}
.divide{border-bottom:1px solid #ddd;padding-bottom:5px;color:#0076de;}
</style>
    <script src="/JS/ZL_Regex.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#etype_list button").click(function () {
                $("#EType_T").val($(this).text());
            });
        })
        function LoadConfig() {
            var config = $(parent.document).find("#<%:Name%>_hid").val();
            if (!ZL_Regex.isEmpty(config)) {
                var model = JSON.parse(config);
                $("#EType_T").val(model.EType);
                $("#ID_T").val(model.ID);
                $("#Class_T").val(model.CSS);
                $("#Start_T").val(HtmlUtil.htmlDecode(model.Start));
                $("#End_T").val(HtmlUtil.htmlDecode(model.End));
                document.getElementById("Script_Chk").checked = model.AllowScript;
                document.getElementById("Ruler_FirstImg_Chk").checked = model.Ruler_FirstImg;
            }
        }
        function SaveConfig() {//将值保存回父窗口
            var name = "<%:Request.QueryString["name"]%>";
            var json = document.getElementById("Json_Hid").value;
            parent.SaveConfig(name, json);
            parent.Close();
        }
    </script>
</asp:Content>
