<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QrCode.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.QrCode" MasterPageFile="~/Manage/I/Default.master" ValidateRequest="false" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>二维码</title>
    <style>
    #CartDiv .input-group { margin:5px 0;width:700px; }
    #CartDiv .input-group-addon { width:82px;text-align:center; }
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">

    <asp:HiddenField ID="contain" runat="server" />
    <%--页面保持--%>

    <ul class="nav nav-tabs">
        <li class="active"><a href="#Tabs0" data-toggle="tab">文本二维码</a></li>
        <li><a href="#Tabs1" data-toggle="tab">名片信息</a></li>
    </ul>
    <div class="panel">
        <div class="tab-content panel-body padding0">
            <div class="tab-pane active" id="Tabs0">
                <table class="table table-striped table-bordered table-hover">
                    <tr class="tdbg">
                        <td style="padding-top: 10px;">
                            <div class="input-group" style="width: 359px;margin:5px 0;  ">
                                <span class="input-group-addon">纠错等级</span>
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" Width="60px">
                                    <asp:ListItem Selected="True">L</asp:ListItem>
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>Q</asp:ListItem>
                                    <asp:ListItem>H</asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">版本</span>
                                <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" Width="60px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem Selected="True">7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">大小</span>
                                <asp:TextBox CssClass="form-control" ID="TextBox1" Text="4" runat="server" Width="50px"></asp:TextBox>
                            </div>
                            <div>
                                <asp:TextBox ID="TxtContent" class="form-control" runat="server" Style="max-width: 578px; min-height: 60px; padding: 5px;" TextMode="MultiLine"></asp:TextBox>
                                <br />
                                <div id="img1div"></div>
                                <span style="color: #808000;">如需生成网址则须在开头加上http:// 如(http://www.baidu.com)</span>
                                <br />
                                <asp:Button ID="BtnCreate" CssClass="btn btn-info" Text="创建并保存" runat="server" OnClick="BtnCreate_Click" />
                                <asp:Button ID="BtnSave" Text="下载到本地" CssClass="btn btn-info" runat="server" OnClick="BtnSave_Click" />
                                <input name="Cancel" type="button" class="btn btn-info" id="Button1" value="返回列表" onclick="javescript: history.go(-1)" />
                            </div>
                            <div id="Div1" runat="server" visible="false" style="display: none;">
                                <table class="table table-striped table-bordered table-hover">
                                    <tr class="tdbg">
                                        <td align="left" style="height: 30px; padding-left: 60px; padding-bottom: 20px; padding-top: 10px;">
                                            <asp:Image ID="Image1" runat="server" /><br />
                                        </td>
                                    </tr>
                                    <tr class="tdbg">
                                        <td align="left">
                                            <asp:TextBox TextMode="MultiLine" ID="TextBox3" runat="server" class="form-control" Style="max-width: 578px; min-height: 60px; padding: 5px;"></asp:TextBox><br />
                                        </td>
                                    </tr>
                                    <tr class="tdbg">
                                        <td align="left">
                                            <input id="" type="button" value="获取调用代码" class="btn btn-primary" onclick="copy()" />
                                        </td>
                                    </tr>
                                    <tr class="tdbg">
                                        <td align="left">
                                            <span style="color: Grey">调用方法：点击按钮复制代码，粘贴到网页中的指定位置即可。</span></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="tab-pane" id="Tabs1">
                <table class="table table-striped table-bordered table-hover">
                    <tr class="tdbg">
                        <td style="padding-top: 10px;">
                            <div class="input-group" style="width:359px;margin:5px 0;">
                                <span class="input-group-addon">纠错等级</span>
                                <asp:DropDownList ID="Level" CssClass="form-control" runat="server" Width="60px">
                                    <asp:ListItem Selected="True">L</asp:ListItem>
                                    <asp:ListItem>M</asp:ListItem>
                                    <asp:ListItem>Q</asp:ListItem>
                                    <asp:ListItem>H</asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">版本</span>
                                <asp:DropDownList ID="Version" CssClass="form-control" runat="server" Width="60px">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem Selected="True">7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                                <span class="input-group-addon">大小</span>
                                <asp:TextBox CssClass="form-control" ID="TxtSize" Text="4" runat="server" Width="50px"></asp:TextBox>
                            </div>
                            <div id="CartDiv">
                                <div class="input-group">
                                    <span class="input-group-addon">姓名</span>
                                    <input class="form-control text_300" runat="server" id="FN">
                                    <span class="input-group-addon">个人主页</span>
                                    <input class="form-control text_300" id="URL" value="http://" runat="server">
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon">MSN</span>
                                    <input class="form-control text_300" id="MSN" runat="server">
                                    <span class="input-group-addon">邮箱</span>
                                    <input class="form-control text_300" id="EMAIL" runat="server" />
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon">QQ</span>
                                    <input class="form-control text_300" id="QQ" runat="server">
                                    <span class="input-group-addon">手机</span>
                                    <input class="form-control text_300" runat="server" id="TEL">
                                </div>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="请输入正确的邮箱格式" ForeColor="red" ControlToValidate="EMAIL" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>&nbsp;&nbsp;
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="请输入正确的手机号码" ForeColor="red" ControlToValidate="TEL" ValidationExpression="^1\d{10}$"></asp:RegularExpressionValidator>
                                <div id="img2div"></div>
                                <span style="color: #808000;">注：当前内容总长度不能超过154个字符</span>
                                <br />
                                <asp:Button ID="BtnCreates" OnClick="BtnCreates_Click" CssClass="btn btn-info" Text="创建并保存" runat="server" />
                                <asp:Button ID="BtnSaves" Text="下载到本地" CssClass="btn btn-info" OnClick="Button1_Click" runat="server" />
                                <input name="Cancel" type="button" class="btn btn-info" id="Cancel" value="返回列表" onclick="javescript: history.go(-1)" />
                            </div>
                            <div id="ShowImgs" runat="server" visible="false" style="display: none;">
                                <table class="table table-striped table-bordered table-hover">
                                    <tr class="tdbg">
                                        <td align="left" style="height: 30px; padding-left: 60px; padding-bottom: 20px; padding-top: 10px;">
                                            <asp:Image ID="ImgCode" runat="server" /><br />
                                        </td>
                                    </tr>
                                    <tr class="tdbg">
                                        <td align="left">
                                            <asp:TextBox TextMode="MultiLine" ID="TxtZoneCode" runat="server" class="form-control" Style="max-width: 578px; min-height: 60px; padding: 5px;"></asp:TextBox><br />
                                        </td>
                                    </tr>
                                    <tr class="tdbg">
                                        <td align="left">
                                            <input id="" type="button" value="获取调用代码" class="btn btn-primary" onclick="copy()" />
                                        </td>
                                    </tr>
                                    <tr class="tdbg">
                                        <td align="left">
                                            <span style="color: Grey">调用方法：点击按钮复制代码，粘贴到网页中的指定位置即可。</span></td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        window.onload = function () {
            var type = '<%=Request["Type"]%>';

            if (type != '') {
                if (type == '1') {
                    ShowCreate('crt2', 'TabTitle2');
                }
            }
            //页面状态保持
            if (document.getElementById("contain").value == "2") {
                ShowCreate('crt2', 'TabTitle2');
            }
        }


        if (document.getElementById("img1div"))
            document.getElementById("img1div").innerHTML = document.getElementById("ShowImgs").innerHTML;
        if (document.getElementById("img2div"))
            document.getElementById("img2div").innerHTML = document.getElementById("ShowImgs").innerHTML;
        function copy() {
            var innerHTML = "复制代码失败您的浏览器不支持复制，请手动复制代码。";
            if (window.clipboardData) {
                innerHTML = "复制代码成功您现在可以将代码粘贴（ctrl+v）到网页中预定的位置。";

                var str = $("#TxtZoneCode").html();
                while (str.indexOf("&lt;") >= 0) {
                    str = str.replace("&lt;", "<");
                }
                while (str.indexOf("&gt;") >= 0) {
                    str = str.replace("&gt;", ">");
                }

                window.clipboardData.setData("Text", str);
                alert(innerHTML);

            }
            else { alert(innerHTML); }
        }
    </script>
</asp:Content>
