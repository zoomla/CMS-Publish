<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Tools.Default" MasterPageFile="~/Common/Common.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>系统维护工具</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="SupperGavel" class="sys_loginBox" runat="server" visible="false">
        <h1><i class="zi z01-icon190"></i>系统维护工具</h1>
        <div class="form-label-group">
            <asp:TextBox ID="UserName_T" placeholder="管理员" runat="server" CssClass="form-control" data-enter="0" />
        </div>
        <div class="form-label-group">
            <asp:TextBox TextMode="Password" ID="UserPwd_T" placeholder="口令" runat="server" CssClass="form-control" data-enter="1" />
        </div>
        <div class="input-group" runat="server" id="VCode_Wrap" visible="false">
            <asp:TextBox ID="VCode" runat="server" placeholder="验证码" class="form-control code" data-enter="2" />
            <span class="input-group-append">
                <img id="VCode_img" title="点击刷新验证码" class="code" />
            </span>
            <asp:HiddenField runat="server" ID="VCode_hid" />
        </div>
        <div style="margin-top: 5px;">
            <asp:Button ID="Login_Btn" runat="server" CssClass="btn btn-outline-info btn-block" OnClick="Login_Btn_Click" Text=" 登录 " data-enter="3" />
        </div>
    </div>	
<div id="SupperGavelCon" runat="server">
        <div class="jumbotron">
            <div class="container tools_banner_main">
                <h1 class="display-4">超级维护工具箱</h1>
                <p class="lead">这是提供给超级管理员的维护工具级，您还可进一步使用 <a href="//code.z01.com" target="_blank">code.z01.com</a>工具集。</p>
                <hr class="my-4">
                <a href="<%:CustomerPageAction.customPath2 %>Default.aspx" class="btn btn-sm btn-info"><i class="zi zi_forLeft" aria-hidden="true"></i> 返回后台</a> 
                <a href="../help.html" class="btn btn-sm btn-info"><i class="zi zi_forLeft" aria-hidden="true"></i> 快速帮助</a>
                <a href="<%:CustomerPageAction.customPath2 %>SignOut.aspx" class="btn btn-sm btn-info"><i class="zi z01-icon153"></i> 退出登录</a>
            </div>
        </div>
        <div class="jumbotron admintop" id="admintop" runat="server" visible="false" hidden>
            <div class="container"><a href="<%:CustomerPageAction.customPath2 %>Default.aspx" class="btn btn-sm btn-info"><i class="zi zi_forLeft" aria-hidden="true"></i> 返回后台</a> <a href="<%:CustomerPageAction.customPath2 %>SignOut.aspx" class="btn btn-sm btn-info"><i class="zi z01-icon153"></i> 退出登录</a> </div>
        </div>
        <div class="container">
            <ul class="nav nav-tabs">
                <li class="nav-item"><a class="nav-link active" href="#tab0" data-toggle="tab">基本配置</a></li>
                <li class="nav-item"><a class="nav-link" href="#tab1" data-toggle="tab">高级配置</a></li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tab0">
                    <table class="table table-striped table-bordered table-hover">
                        <tr>
                            <th class="w12rem_lg">配置文件检测:</th>
                            <td>
                                <asp:Button ID="Check_Btn" runat="server" class="btn btn-outline-info" OnClick="Check_Btn_Click" Text="开始检测" /></td>
                        </tr>
                        <tr>
                            <th>网站配置:</th>
                            <td>
                                <asp:Button ID="Update_Btn" runat="server" OnClick="Update_Btn_Click" class="btn btn-outline-info" Text="恢复初始" OnClientClick="return confirm('确定要恢复初始配置吗,后台路径,网站名称等均会初始化');" />
                                <asp:Button ID="Repair_Btn" runat="server" OnClick="Repair_Btn_Click" class="btn btn-outline-info" Text="修复配置" /></td>
                        </tr>
                        <tr>
                            <th>开发调试模式:</th>
                            <td>
                                <asp:Button runat="server" ID="Develop_Btn" Text="开启调试" class="btn btn-outline-info" OnClick="Develop_Btn_Click" />
                                <asp:Button runat="server" ID="ColseDevlop_Btn" Text="关闭调试" class="btn btn-outline-info" OnClick="ColseDevlop_Btn_Click" /></td>
                        </tr>
                        <tr>
                            <th>导入模板生成:</th>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-prepend"><span class="input-group-text">表名</span></span>
                                    <asp:TextBox runat="server" ID="Import_Tbname_T" class="form-control" placeholder="请输入数据表名"/>
                                    <span class="input-group-append">
                                        <asp:Button runat="server" ID="Import_Btn" OnClick="Import_Btn_Click" class="btn btn-info" Text="生成导入配置"/>
                                    </span>
                                </div>
                                <small class="text-muted">请手动将配置文件放入/Config/Import/目录,并修改后缀名为xml，使用方法详见,<a href="http://www.z01.com/help/DBA/3284.shtml" target="_blank">超级导表工具使用教程</a></small>
                            </td>
                        </tr>
                    <%--    <tr>
                            <th>数据库脚本修复</th>
                            <td>
                                <asp:Button runat="server" ID="RepairData_Btn" OnClick="RepairData_Btn_Click" Text="修复脚本" /></td>
                        </tr>--%>
                        <tr>
                            <th class="text-center">
                                <p class="mt-2 mb-2">文本加密/解密:</p>
                                <div>
                                    <asp:Button runat="server" ID="Encry_Btn" Text="文本加密" class="btn btn-outline-info" OnClick="Encry_Btn_Click" />
                                    <asp:Button runat="server" ID="Decry_Btn" Text="文本解密" class="btn btn-outline-info mt-1" OnClick="Decry_Btn_Click" />
                                </div>
                            </th>
                            <td>
                                <asp:TextBox runat="server" ID="Before_T" TextMode="MultiLine" CssClass="form-control Maintain_input" placeholder="需要处理的字符串" />
                                <asp:TextBox runat="server" ID="After_T" TextMode="MultiLine" CssClass="form-control Maintain_input" placeholder="字符串加密/解密结果" Style="margin-top: 5px;" /></td>
                        </tr>
                    </table>
                </div>
                <div class="tab-pane" id="tab1">
                    <table class="table table-bordered table-striped">
                        <tr>
                            <th class="w12rem_lg">关闭HTTPS重写:</th>
                            <td>
                                <asp:Button runat="server" ID="Close_Btn" Text="关闭HTTPS" class="btn btn-outline-info" OnClick="Close_Btn_Click" /></td>
                        </tr>
                        <tr>
                            <th>关闭域名归并</th>
                            <td>
                                <asp:Button runat="server" ID="CloseDomainMerge_Btn" Text="关闭域名归并" class="btn btn-outline-info" OnClick="CloseDomainMerge_Btn_Click" />
                            </th>
                        </tr>
                        <tr>
                            <th>取消管理员动态口令:</th>
                            <td>
                                <asp:Button runat="server" ID="Close_Code_Btn" Text="取消口令" class="btn btn-outline-info" OnClick="Close_Code_Btn_Click" /></td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="mt-3 mb-3"><a href="PPCTools.aspx" class="btn btn-outline-dark">省市县数据字典维护工具</a> <a href="HtmlToJS.aspx" class="btn btn-outline-dark">HTML5与JS转换工具</a> <a href="BarContent.aspx" class="btn btn-outline-dark">贴吧内容解密</a>
                <abbr>*诸多操作不可逆，请进行全站和数据备份后操作！</abbr>
            </div>
            <div class="alert alert-info" role="alert" runat="server" id="FileInfo_Div" visible="false">
                <table class="table">
                    <thead>
                        <tr>
                            <td class="td_lg">文件名</td>
                            <td>是否存在</td>
                        </tr>
                    </thead>
                    <asp:Literal ID="Files_Li" runat="server" EnableViewState="false"></asp:Literal>
                </table>
            </div>
        </div>
        <div class="container SupperGavelTool">
            <ins>扩展工具:</ins>
            <ul class="row">
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://ico.z01.com" target="_blank"><i class="zi zi_tmZiti163"></i><span class="glyphicon-class">zico图标</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://code.z01.com" target="_blank"><i class="zi zi_bold"></i><span class="glyphicon-class">BootStarp框架</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://app.z01.com" target="_blank"><i class="zi zi_mobilealt"></i><span class="glyphicon-class">微首页</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://app.z01.com/Class_1/Default.aspx" target="_blank"><i class="zi zi_tmWeixin"></i><span class="glyphicon-class">场景列表</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://www.z01.com/tool/" target="_blank"><i class="zi zi_cog"></i><span class="glyphicon-class">站长工具</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://www.ziti163.com/webfont" target="_blank"><i class="zi zi_fonts"></i><span class="glyphicon-class">WebFont</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://ad.z01.com/" target="_blank"><i class="zi zi_fileImage" zico="图片文件黑"></i><span class="glyphicon-class">广告源码</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://ad.z01.com/color.html" target="_blank"><i class="zi zi_alignjustify"></i><span class="glyphicon-class">网页配色</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://code.z01.com/" target="_blank"><i class="zi zi_laptop"></i><span class="glyphicon-class">响应式工具</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://v.z01.com/mb/" target="_blank"><i class="zi zi_briefcase"></i><span class="glyphicon-class">免费模板</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://www.z01.com/pub/" target="_blank"><i class="zi zi_download"></i><span class="glyphicon-class">下载逐浪CMS</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://bbs.z01.com/index" target="_blank"><i class="zi zi_users"></i><span class="glyphicon-class">技术社区</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="http://www.z01.com/mtv/" target="_blank"><i class="zi zi_video"></i><span class="glyphicon-class">视频教程</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="https://www.z01.com/blog/techs/2975.shtml" target="_blank"><i class="zi zi_child"></i><span class="glyphicon-class">Emmet</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="https://www.ziti163.com" target="_blank"><i class="zi ZoomlaICO2015"></i><span class="glyphicon-class">字体网</span> </a></li>
                <li class="col-4 col-sm-3 col-md-2"><a class="d-flex flex-column" href="https://v.ziti163.com" target="_blank"><i class="zi zi_paintbrush"></i><span class="glyphicon-class">在线做字</span> </a></li>
            </ul>
        </div>
    </div>
<header class="home_header fixed-top" id="home_header">
<div class="container">
<nav class="navbar navbar-expand-sm navbar-dark pl-0"> <a class="navbar-brand API_title" href="../../help.html">服务导航</a>
  <button class="navbar-toggler" type="button" id="top_pwabtn" data-toggle="collapse" data-target="#top_nav" aria-controls="top_nav" aria-expanded="false" aria-label="Toggle navigation"> 
  <i class="zi z01-icon106 text-muted"></i></button>
  <div class="collapse navbar-collapse top_nav" id="top_nav">
    <ul class="navbar-nav mr-auto text-center Tools_nav_l">
      <li class="nav-item"><i class="zi zi_times nav_close_btn" aria-hidden="true"></i>
	  <a class="nav-link" href="../../help.html">快速帮助 <span class="sr-only">(current)</span></a> </li>
      <li class="nav-item active"> <a class="nav-link" href="../tools/">站长工具</a> </li>
      <li class="nav-item"> <a class="nav-link" href="/Tools/API.html">移动API</a> </li>
    </ul>
      <div class="form-inline" role="search">
              <div class="form-group d-flex flex-row Tools_searchbox mt-1">
                  <input name="KeyWord" class="form-control mr-sm-2 searchs_input" id="searchs_input" type="text" placeholder="搜索线上支持">
                  <button class="btn my-2 my-sm-0" type="button" onclick="openSearch();" style="background: none; margin-left: -3rem; color: #ff9d00;"><i class="zi zi_search"></i></button>
              </div>
              <ul class="navbar-nav ml-auto text-center Tools_nav_r">
                  <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">开发资源</a>
                      <div class="dropdown-menu" aria-labelledby="dropdown04">
                          <a class="dropdown-item" href="//www.ziti163.com/webfont/">Webfont</a>
                          <a class="dropdown-item" href="//v.ziti163.com/">在线做字</a>
                          <a class="dropdown-item" href="//www.z01.com/">逐浪CMS</a>
                          <a class="dropdown-item" href="//code.z01.com/v4/">Bootstrap 中文站</a>
                          <a class="dropdown-item" href="//code.z01.com/Sass/">Sass语言</a>
                          <a class="dropdown-item" href="//code.z01.com/Emmet/">Emmet语法</a>
                          <a class="dropdown-item" href="//www.z01.com/tool/" target="_blank">IIS站长工具</a>
                          <a class="dropdown-item" href="//ad.z01.com/" target="_blank">广告源码</a>
                          <a class="dropdown-item" href="//v.z01.com/mb/" target="_blank">免费模板</a>
                          <a class="dropdown-item" href="//v.z01.com/" target="_blank">H5移动创作</a>
                          <a class="dropdown-item" href="//www.z01.com/help/web/3234.shtml" target="_blank">Flexbox布局</a>
                      </div>
                  </li>
                  <li class="nav-item"><a class="nav-link" href="//bbs.z01.com" target="_blank">社区</a> </li>
              </ul>
      </div>
  </div>
</nav>
</div>
</header>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Controls/Control.js"></script>
<script src="/JS/ZL_ValidateCode.js"></script>
<script>
    function openSearch() {
        var win = window.open("/design/wait.html?ver=" + Math.random(), "_blank");
        setTimeout(function () {
            win.location = "/Search/SearchList?KeyWord=" + encodeURI($("#searchs_input").val());
        }, 50);
    }
    function EnableCode() {
        $("#VCode_img").click();
        $("#VCode").ValidateCode();
    }
    $(function () { Control.EnableEnter(); })

    $(function () {
        Control.EnableEnter();
        $("#home_header").find("[data-target='#top_nav']").click(
        function () {
            if ($("#home_header").find("[data-target='#top_nav']").attr("aria-expanded") == "false") {
                $("#home_header").find(".navbar-collapse").animate({ right: "0" }, 100);
            } else {
                $("#home_header").find(".navbar-collapse").animate({ right: "-200px" }, 100);
            }
        })

        $(".nav_close_btn").click(function () {
            $("#top_pwabtn").click()
        })
    })

    $("#searchs_input").focus(function () {
        $(this).animate({ width: "20rem" });
    });
    $("#searchs_input").blur(function () {
        $(this).animate({ width: "10rem" });
    });
</script>
</asp:Content>