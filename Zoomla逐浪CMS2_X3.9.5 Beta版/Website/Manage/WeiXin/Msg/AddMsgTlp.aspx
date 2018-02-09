<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMsgTlp.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.Msg.AddMsgTlp" MasterPageFile="~/Manage/I/Default.Master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>消息模板</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered">
        <tr><td class="td_l">所属公众号</td><td><asp:DropDownList runat="server" ID="WXAPP_DP" DataTextField="Alias" DataValueField="ID" class="form-control text_300"></asp:DropDownList></td></tr>
        <tr><td>信息名称</td><td><ZL:TextBox runat="server" ID="Alias_T" class="form-control text_300" AllowEmpty="false"/></td></tr>
        <tr>
            <td>信息类型</td>
            <td>
                <label>
                    <input type="radio" name="msgtype_rad" class="msgtype" value="text" checked="checked" />文字</label>
                <label>
                    <input type="radio" name="msgtype_rad" class="msgtype" value="image" />图片</label>
      <%--          <label>
                    <input type="radio" name="msgtype_rad" class="msgtype" value="html" />多图文</label>--%>
                <div class="rd_green">
                    <div>文字信息支持超链接,格式:<%:"<a href=\"http://链接URL\">链接名</a>" %></div>
                    <div>图片信息可定义超链接,点击完成跳转</div>
     <%--               <div>多图文支持html</div>--%>
                </div>
            </td>
        </tr>
        <tbody class="content_tb" id="text_tb">
            <tr>
                <td>信息内容:</td>
                <td>
                    <asp:TextBox ID="Content_T" runat="server" TextMode="MultiLine" CssClass="form-control m715-50" Style="height: 120px;" />
                    <asp:RequiredFieldValidator ID="v1" runat="server" ControlToValidate="Content_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="内容不能为空!" ValidationGroup="text" />
                </td>
            </tr>
        </tbody>
        <tbody class="content_tb" id="image_tb">
            <tr>
                <td>标题</td>
                <td>
                    <asp:TextBox runat="server" ID="Image_Title_T" class="form-control m715-50" /></td>
            </tr>
            <tr>
                <td>描述</td>
                <td>
                    <asp:TextBox runat="server" ID="Image_Desc_T" class="form-control  m715-50" /></td>
            </tr>
            <tr>
                <td>图片</td>
                <td>
                    <ZL:SFileUp runat="server" ID="Img_UP" FType="Img" />
                    <div class="rd_green margin_t5">图片链接,支持JPG、PNG格式，较好的效果为大图360*200</div>
                    <div class="rd_green margin_t5">如未上传图片,则以文本格式返回信息(文本格式可支持超链接)</div>
                </td>
            </tr>
            <tr>
                <td>链接</td>
                <td>
                    <asp:TextBox runat="server" ID="Image_Url_T" CssClass="form-control m715-50" placeholder="请输入链接" />
                    <div class="rd_green margin_t5">点击图文消息跳转链接</div>
                </td>
            </tr>
        </tbody>
        <tr>
            <td></td>
            <td>
                <asp:Button runat="server" ID="Save_Btn" Text="保存信息" class="btn btn-info" OnClick="Save_Btn_Click" />
                <a href="MsgTlpList.aspx" class="btn btn-info">返回列表</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
    .content_tb{display:none;}
</style>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script>
    $(function () {
        $(".msgtype").click(function () {
            if (this.value == "html")
            {
             <%--   if (confirm("页面需要跳转至多图文编辑页,未保存的信息将会丢失")) { location = "MsgsSend.aspx?appid=<%:AppID%>"; }
                else { return; }--%>
            }
            $(".content_tb").hide();
            $("#" + this.value + "_tb").show();
        });
        $(".msgtype:checked").click();
    })
</script>
</asp:Content>