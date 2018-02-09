<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="send.ascx.cs" Inherits="ZoomLaCMS.MIS.OA.Tlp.send" %>
<link href="/Office/Tlp/SpecialForm.css" rel="stylesheet" />
<asp:TextBox runat="server" ID="SendDate_T" Style="display: none;"></asp:TextBox>
<table class="table formtb table_red">
    <tr>
        <th style="border-color: #f00; text-align: center;" colspan="2">
            <h1>江西省人民政府金融办公室发文稿纸</h1>
        </th>
    </tr>
    <tr>
        <td colspan="2">
            <span>编号：</span>
            <asp:DropDownList CssClass="form-control text_x" runat="server" ID="bhxx"></asp:DropDownList>
            <asp:TextBox runat="server" ID="No_T" disabled="disabled" CssClass="form-control text_md" />
            <span>号</span>
            <button type="button" class="btn btn-default">产生文号</button>
            <button type="button" class="btn btn-default">文号查看</button>
            <span>等级</span>
            <asp:DropDownList runat="server" ID="dj" CssClass="form-control text_x"></asp:DropDownList>
            <span>密级</span>
            <asp:DropDownList runat="server" ID="mj" CssClass="form-control text_x"></asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top; height: 200px;">
            <span>签发：</span>
            <div class="labelfont"><%=GetHQInfo(4) %></div>
        </td>
        <td style="vertical-align: top;">
            <span>拟稿：</span>
            <div class="labelfont"><%=oaMod.UserName %></div>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top; height: 200px;"><span>审批：</span>
            <div class="labelfont"><%=GetHQInfo(1)+GetHQInfo(2) %></div>
        </td>
        <td style="vertical-align: top;">
            <span>核稿：</span>
            <div class="labelfont"><%=GetHQInfo(3) %></div>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top; height: 200px;" colspan="2">
            <span>会签：</span>
            <div style="color: #666;"></div>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div class="media">
                <div class="media-left"><span>标题：</span></div>
                <div class="media-body">
                    <asp:TextBox runat="server" ID="Title_T" TextMode="MultiLine" class="form-control" Rows="4"></asp:TextBox>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div class="media">
                <div class="media-left"><span>主送：</span></div>
                <div class="media-body">
                    <asp:TextBox runat="server" ID="zs" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                </div>
            </div>
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <div class="media">
                <div class="media-left"><span>抄送：</span></div>
                <div class="media-body">
                    <asp:TextBox runat="server" ID="cs" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                </div>
            </div>

        </td>
    </tr>
    <tr>
        <td>
            <span>收文日期：</span>
            <asp:TextBox runat="server" ID="swrq" name="swrq" CssClass="form-control text_300" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" />
        </td>
        <td>
            <span>发文日期：</span>
            <asp:TextBox runat="server" ID="fwrq" name="fwrq" class="form-control text_300" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" />
        </td>
    </tr>
</table>
