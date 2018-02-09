<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WordList.aspx.cs" Inherits="ZoomLaCMS.webfont.write.WordList" MasterPageFile="~/Common/Master/Empty.master" EnableViewState="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=wrMod.FontName %>_文字列表</title>
    <link type="text/css" rel="stylesheet" href="/App_Themes/Guest.css" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="container margin_t10">
        <div class="panel panel-info">
            <div class="panel-heading">
                <div class="input-group" style="width:280px;">
                    <span class="input-group-addon"><a href="/webfont/write/"><i class="fa z01-icon106"></i></a></span>
                    <asp:TextBox runat="server" ID="FontName_T" class="form-control text_md" MaxLength="15" />
                    <span class="input-group-btn">
                        <asp:Button runat="server" ID="Save_Btn" class="btn btn-info" Text="修改" OnClick="Save_Btn_Click" />
                    </span>
                </div>
                <span class="pull-right"></span>
            </div>
            <div class="panel-body">
                <asp:Repeater runat="server" ID="RPT">
                    <ItemTemplate>
                        <a href="wordPanel.aspx?id=<%#Eval("ID") %>" data-code="<%#Eval("Unicode") %>" class="word_item <%#Eval("ZStatus","").Equals("99")?"completed":"writing" %>">
                            <span style="padding: 4px;"><%#"&#"+Eval("Unicode") %></span>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
    <div style="height: 55px;"></div>
    <div class="word_btns">
        <asp:Button runat="server" ID="CreateFont_Btn" Text="OK,点我发布字体!" OnClick="CreateFont_Btn_Click" class="btn btn-info" OnClientClick="return confirm('确定要生成字库吗?');" />
        <a href="/webfont/write/" class="btn btn-default">返回首页</a>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
</asp:Content>
