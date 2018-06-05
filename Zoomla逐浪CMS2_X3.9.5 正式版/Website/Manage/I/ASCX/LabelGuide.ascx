<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LabelGuide.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.LabelGuide" %>
<div class="m_left_ul open">  
<div class="menu_tit"><i class="zi zi_forDown"></i> <%=Resources.L.标签管理 %></div>
<ul>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/TemplateSet.aspx');"><%=Resources.L.方案设置 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/TemplateManage.aspx')"><%=Resources.L.模板管理 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/LabelManage.aspx')"><%=Resources.L.标签管理 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/CSSManage.aspx')"><%=Resources.L.风格管理 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/SPage/Default.aspx')">可视设计</a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/TemplateSetOfficial.aspx')"><%=Resources.L.云端下载 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/LabelCallTab.aspx')"><%=Resources.L.标签助手 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/ExternDS/DSList.aspx')"><%=Resources.L.外部数据源 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Template/GetPageHtml.aspx')"><%=Resources.L.源码查看器 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Content/Addon/MNBakList.aspx')"><%=Resources.L.元数据备份 %></a></li>
    <li><a href="javascript:;" onclick="ShowMain('','{$path}Design/Addon/Restore.aspx')">加载动力版</a></li>
</ul>
<div class="input-group" >
<input type="text" id="keyWord" class="form-control ascx_key" placeholder="<%=Resources.L.请输入标签名称 %>"  onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"Template/LabelManage.aspx?keyWord=" %>',this);"/>
<div class="input-group-append">
    <button class="input-group-text" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"Template/LabelManage.aspx?keyWord=" %>','keyWord');"> <i class="zi zi_search"></i></button>
</div>
</div>
</div>