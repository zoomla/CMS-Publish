<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Tools.svg.Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
<meta charset="utf-8"/>
<title>矢量创作工具</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit|ie-comp|ie-stand" />
<link href="/dist/css/bootstrap4.min.css" rel="stylesheet"/>
<script src="/JS/jquery.min.js" ></script>
<script src="/dist/js/popper.min.js"></script>
<script src="/dist/js/bootstrap4.min.js"></script>
<script src="/dist/js/zico.min.js"></script>
<link href="/App_Themes/V4.css" rel="stylesheet"/>
<link  href="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.css" rel="stylesheet" />
<script src="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.js"></script>

<style>   
#editor_item svg{max-height:50vh;padding:1rem;padding-top:0; text-align:center;}
#editor_cog div{margin-top: 1rem;}
.width960{width:1024px;}
.width960 .modal-content{width:1024px;}
.width960 .modal-body{width:1024px;}
</style>
</head>
<body>
<form id="form1" runat="server" action="./default.aspx" enctype="multipart/form-data">
<header class="navbar navbar-expand flex-column flex-md-row fixed-top yunHead">
<a class="navbar-brand mr-0 mr-md-2" href="/" aria-label="LOGO"><i class="zi zi_home"></i></a><small class="text-muted"><a href="<%=Request.RawUrl %>">矢量创作</a></small>
  <div class="navbar-nav-scroll" hidden="">
    <ul class="navbar-nav bd-navbar-nav flex-row">
      <li class="nav-item">
        <a class="nav-link " href="/" onclick="ga('send', 'event', 'Navbar', 'Community links', 'Bootstrap');">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="/docs/4.0/getting-started/introduction/" onclick="ga('send', 'event', 'Navbar', 'Community links', 'Docs');">云计算</a>
      </li>
      <li class="nav-item">
        <a class="nav-link " href="#" onclick="ga('send', 'event', 'Navbar', 'Community links', 'Examples');">Examples</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="ga('send', 'event', 'Navbar', 'Community links', 'Themes');" target="_blank" rel="noopener">机房</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="ga('send', 'event', 'Navbar', 'Community links', 'Jobs');" target="_blank" rel="noopener">安全</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="ga('send', 'event', 'Navbar', 'Community links', 'Expo');" target="_blank" rel="noopener">Expo</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="ga('send', 'event', 'Navbar', 'Community links', 'Blog');" target="_blank" rel="noopener">Blog</a>
      </li>
    </ul>
  </div>

  <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
	<%if (mu.IsNull)
        {%>
      <div class="btn-group ml-1">
		<a href="javascript:;" onclick='$("#modal_login").modal("show");' style="border: none;">
			<img src="/Images/userface/noface.png" class="uimg img_xs" onerror="shownoface(this);">
			<span>游客</span>
		</a>
	</div>
      <%}
          else{ %>
      <div class="btn-group ml-1">
		<a class="dropdown-toggle" data-toggle="dropdown" href="javascript:;" style="border: none;">
			<img src="<%:mu.UserFace %>" class="uimg img_xs" onerror="shownoface(this);">
			<span><%:mu.UserName %></span>
		</a>
		<ul class="dropdown-menu">
			<li class="dropdown-item"><a href="/user">会员中心</a></li>
			<li class="dropdown-item"><a href="/Plat/UPCenter.aspx">个人信息</a></li>
			<li class="dropdown-item"><a href="/Plat/Blog/Contact.aspx">通讯录</a></li>
			<li class="dropdown-item"><a href="/Plat/Mail/">站内信</a></li>
			<li class="dropdown-item"><a href="/Plat/Doc/">云盘</a></li>
			<li class="dropdown-item"><a href="/User/User/Logout">退出登录</a></li>
		</ul>
	</div>
      <%} %>
  </ul>
</header>
<!--header end-->

<div class="container-fluid yunMain">
  <div class="row flex-xl-nowrap">
    <div class="col-12 col-md-3 col-xl-2 yunSidebar">	
     <%--   method="get" action="/Search/SearchList" target="_blank"--%>
        <div class="form-inline" role="search" >
            <div class="input-group">
                <input type="text" class="form-control" name="keyword" placeholder="全站检索">
                <div class="input-group-append">
                    <button type="submit" class="nput-group-text btn btn-secondary"><i class="zi zi_search"></i></button>
                </div>
            </div>
            <!-- /input-group -->
        </div>
	      <nav class="collapse yunLeft">
        <div class="yunLeft_item"><strong>快速导航</strong>
          <ul>
            <li class="active"><a href="http://ico.z01.com">SVG大师</a></li>
            <li><a href="http://ico.z01.com">zico图标</a></li>
            <li><a href="http://f.ziti163.com">逐浪字库</a></li>
            <li><a href="http://bbs.z01.com">技术社区</a></li>
            <li><a href="#">Markdown</a></li>
            <li><a href="#">在线拍照</a></li>
            <li><a href="#">教育组卷</a></li>
            <li><a href="/office">OA系统</a></li>
            <li><a href="/plat">能力办公</a></li>
            <li><a href="/User/UserFunc/Watermark">证书生成</a></li>
            <li><a href="/User/UserFunc/UserSignin">每日签到</a></li>
            <li><a href="http://v.ziti163.com">H5创作</a></li>
            <li><a href="/Plugins/Third/wordPanel.html">智写</a></li>
			<li><a href="http://ico.z01.com">MR混合现实</a></li>
          </ul>
        </div>
      </nav>
    </div><!--left end-->

      <main class="container yunCon" role="main">
          <h1>图标创作平台<span class="float-right"><button type="button" class="btn btn-link btn-sm" onclick="showIcons();"><i class="zi zi_pluscircle"></i> 选择图标</button><button type="button" onclick="chooseFile();" class="btn btn-link btn-sm"><i class="zi zi_upload"></i> 上传图片转SVG</button> </span></h1>
	  <div  id="editor_wrap">	  
	  <div id="editor_item"></div>
              <div id="editor_cog">
			  <div class="row">
			  <div class="col-12 col-sm-6">
					<div class="input-group">
                       <span class="input-group-prepend"><span class="input-group-text">色彩</span></span>
                       <input type="text" id="color_t" class="form-control"/>
                  </div>
			  </div>
			  <div class="col-12 col-sm-6">
                  <div class="input-group">
                      <span class="input-group-prepend"><span class="input-group-text">角度</span></span>
                      <input type="text" id="angle_t" class="form-control" value="0"/>
                      <span class="input-group-append">
                          <button type="button" class="btn btn-info" onclick="zico.rotate();">旋转</button>
                          <button type="button" class="btn btn-info" onclick="zico.rotate(45);">45度</button>
                          <button type="button" class="btn btn-info" onclick="zico.rotate(180);">180度</button>
                          <button type="button" class="btn btn-info" onclick="zico.rotate(270);">270度</button>
                      </span>
                  </div>			  
			  </div>
			  </div>
			  <div>
                 <textarea class="form-control" rows="11" style="resize:none; height: 5rem;" id="svg_t"></textarea>
                  </div>
                <div>                      
                  </div>
              </div>
               </div>
          <div class="svgBtn">
              <button type="button" class="btn btn-info" onclick="zico.downTo('EPS');">下载为EPS</button>
              <button type="button" class="btn btn-info" onclick="zico.downTo('SVG');">下载为SVG</button>
              <button type="button" class="btn btn-info" onclick="zico.downTo('PNG');">下载为PNG</button>
              <button type="button" class="btn btn-info" onclick="zico.downTo('WebP');">下载为WebP</button>
              <button id="copybtn" type="button" class="btn btn-info" onclick="#">复制为SVG代码</button>
              <button type="button" class="btn btn-info" onclick="zico.downTo('Base64');">下载为Base64</button>

              <button type="button" class="btn btn-primary" style="float: right;" onclick="$('#webp_up').click();">WebP转JPG</button>
              
              <div style="display: none;">
                  <input type="file" accept=".webp" name="webp_up" id="webp_up" />
<asp:Button runat="server" ID="webpToJPG" OnClick="webpToJPG_Click" Text="Test" />

                  <script>
                      $("#webp_up").change(function () {
                          if (this.value == "") { return; }
                          $("#webpToJPG").click();
                      });
                  </script>
              </div>
          </div>
		  
		  <div class="container svgAbout">
		  <span>说明：</span>
		  <p>1、支持以get方式编辑任意zico图标系统,如<a href="http://ico.z01.com/tools/Default.aspx?n=zi_user">http://ico.z01.com/tools?n=zi_user</a>。<br/>
		  2、EPS格式支持AI(Adobe Illustrator)创作；SVG是矢量格式，但不兼容IE8-等旧版浏览器；PNG格式是点阵图，兼容性高。<br/>
		  3、复制为SVG代码可获得完整的SVG文件代码，直接在HTML中引用即可。<br/>
		  4、上传图片转SVG目前只能做到黑白描绘。<br/>
		  5、webP格式：Google开发的一种旨在加快图片加载速度的图片格式。图片压缩体积大约只有JPEG的2/3，能节省大量的服务器宽带资源和数据空间，WebP是一种有损压缩。相比JPEG同样质量的WebP文件需要更多计算资源，桌面版Chrome可打开WebP格式。<br/>
		  6、Base64格式为png的代码模式，即将图片转换base64格式,data:image/png，<a href="http://www.z01.com/help/web/3311.shtml">进一步了解</a>。
		  </p>		  
		  </div>
      </main>
  </div><!-- main end-->
  
</div>
<!--yunMain end-->
<nav class="navbar fixed-bottom yunFoot">
    <ul class="list-inline mb-0">
	<%Call.Label("{$Copyright/}"); %>
    </ul>
</nav>

<div class="modal fade" id="modal_login" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">登陆就能将JPG\PNG\GIF图片转成SVG格式！</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
          <a href="/User/Login?ReturnUrl=/Tools/svg/" target="_blank" class="btn btn-info">马上登录</a>
          <a href="/User/Register?ReturnUrl=/Tools/svg/" class="btn btn-light">注册新会员</a>
      </div>
    </div>
  </div>
</div>
       </form>
<script src="/Design/JS/Plugs/color/tinycolor-min.js"></script>
<script src="/Plugins/Third/potrace.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/Plugs/base64.js"></script>
<script>
    /*
    旋转:中心旋转
    X=1800/2+(-150) ,Y=2000/2+(-280)==rotate(180,750,720)
    */
    //fa 是使用css附加的动画效果,达成旋转
    //transform="rotate(180,0,900) scale(-1,1)"  Angle,X,Y  ,旋转后X与Y轴根据角度,方向也不同了
    //fill="red"

    function showIcons() {
        comdiag.width = "width960";
        ShowComDiag("icons.aspx", "Svg图标");
        comdiag.reload = false;
    }
    var chooseFile = function () {
        var uid = "<%:mu.UserID%>";
        if (uid == "0") {
            $("#modal_login").modal("show");
        }
        else { picup.sel(); }
    }
    var picup = new fileup({
        accept: "image", up_after: function (url) {
            zico.imgToSvg(url);
        }
    });
    //----------------------------
    var zico = {};
    //获取当前需要修改的svg对象
    zico.getSvg = function () {
        return $("#editor_wrap svg");
    }
    zico.rotate = function (angle) {
        var ref = this;
        var $svgArr = ref.getSvg();
        if (angle >= 0) {
            $("#angle_t").val(angle);
        }
        else {
            angle = parseInt($("#angle_t").val());
        }
        for (var i = 0; i < $svgArr.length; i++) {
            $svg = $($svgArr[i]);
            var viewBox = $svg.attr("viewBox").split(" ");
            var left = parseInt(viewBox[2]) / 2 + (parseInt(viewBox[0]));
            var right = parseInt(viewBox[3]) / 2 + (parseInt(viewBox[1]));
            $svg.find("path").attr("transform", "rotate(" + angle + "," + left + "," + right + ")");
        }
        ref.toText();
    }
    zico.color = function (color) {
        var ref = this;
        var $svgArr = ref.getSvg();
        for (var i = 0; i < $svgArr.length; i++) {
            $svg = $($svgArr[i]);
            $svg.find("path").attr("fill", color);
        }
        ref.toText();
    }
    //将图片转为矢量图
    zico.imgToSvg = function (imgUrl) {
        Potrace.loadImageFromUrl(imgUrl);
        Potrace.process(function () {
            var svg = Potrace.getSVG(1);
            $("#editor_item").html(svg);
        });
    }
    //加載path进入编辑器|或插入编辑器
    zico.loadSvg = function (path) {
        var ref = this;
        var svgTlp = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2000 2200"><path fill="currentColor" d="@path"></path></svg>';
        var html = svgTlp.replace("@path", path);
        $("#editor_item").html(html);
        CloseComDiag();
        ref.toText();
    }
    //svg|png|eps|base64
    zico.downTo = function (type) {
        var ref = this;
        var base64 = Base64.encode(document.getElementById("editor_item").innerHTML);
        var $form = $('<form method="post" action="?action=downTo' + type + '"></form>');
        $form.append('<input type="hidden" name="base64_hid" value=' + base64 + '>');
        $("body").append($form);//兼容IE
        $form.submit();
        $form.remove();
    }


    zico.toText = function () {
        var html = document.getElementById("editor_item").innerHTML;
        $("#svg_t").val(html);
    }
    zico.init = function () {
        $("#color_t").ColorPickerSliders({
            size: 'sm', placement: 'top', swatches: false, sliders: false, hsvpanel: true, previewformat: "hex",
            color: "#000000",
            onchange: function (container, color) {
                var hex = color.tiny.toHexString()
                zico.color(hex);
            }
        });
        var name = "<%:Request.QueryString["n"]%>";//zi_glass
        if (!name) { name = "zi_tmZiti163"; }
        if (name && name.indexOf("_") > 0) {
            icon = icons[ name.split('_')[1]];
            if (!icon) { alert(name + "图标不存在"); }
            else { zico.loadSvg(icon[4]); }
        }
    }
    zico.init();
	
	

    var clipboard = new ClipboardJS('#copybtn', {
        text: function() {
			//var titles = $("#PostName_L").text();
			//var webname = '逐浪CMS开发者社区';
            //return titles +" "+ window.location.href + " " + "(分享自" +webname + "社区)";
            return $("#svg_t").val();
        }
    });
    clipboard.on('success', function(e) {
		alert("复制完成");
    });
    clipboard.on('error', function(e) {
        //console.log(e);
		alert("复制失败");
    });
</script>
</body>
</html>