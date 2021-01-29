<template>
<div class="home17_kefu">
<ul>
<li>
<a href="javascript:;"><i class="zi zi_tmQq"></i></a>
<div class="home17_kefu_c" style="bottom:13rem;">
<div class="home17_kefu_ct">在线客服<i class="zi zi_times"></i></div>
<div class="home17_kefu_cq">
<ul>
<li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=184886758&amp;site=qq&amp;menu=yes"><i class="zi zi_tmQq"></i>京沪苏粤售前</a></li>
<li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=1799661890&amp;site=qq&amp;menu=yes"><i class="zi zi_tmQq"></i>软件授权售前</a></li>
<li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=524979923&amp;site=qq&amp;menu=yes"><i class="zi zi_tmQq"></i>高端订制售前</a></li>
<li><a href="http://wpa.qq.com/msgrd?v=3&amp;uin=745151353&amp;site=qq&amp;menu=yes"><i class="zi zi_tmQq"></i>教育系统集成</a></li>
</ul>
</div>
<div class="home17_kefu_cb">
<a href="tel:021-50391046">
<h3><i class="zi zi_phone"></i>服务热线</h3>
<p>021-50391046</p>
</a>
</div>
</div>
</li>
<li class="">
<a href="javascript:;"><i class="zi zi_tmWeixin"></i></a>
<div class="home17_kefu_c" style="bottom:10.4rem;">
<div class="home17_kefu_ct">扫码官方微信↓<i class="zi zi_times"></i></div>
<div><img src="../assets/images/qrcode.jpg" alt="微信二维码" style="max-width:100%;"></div>
</div>
</li>
<li class=""><a href="javascript:;" title="快速获取逐浪CMS官方资源"><i class="zi zi_tmGit"></i></a>
<div class="home17_kefu_c" style="bottom:8rem;">
<div class="home17_kefu_ct">获取逐浪源码<i class="zi zi_times"></i></div>
<div class="home17_kefu_cq">
<ul>
<li class=""><a href="http://github.z01.com/" target="_blank"><i class="zi zi_tmQq"></i>GitHub主页</a></li>
<li class=""><a href="https://gitee.com/zoomla" target="_blank"><i class="zi zi_tmGoogleplusg"></i>Gitee码云主页</a></li>
</ul>
</div>
</div>
</li>
<li class=""><a href="javascript:;" @click="gotop"><i class="zi zi_forUp"></i></a></li>
</ul>
</div>
</template>
<script>


export default {
 name:"ZoomlaKefu_top",
  props: {
	cols:Number,
	md: Number,
	className: String,
  con: String,
	icpOpen: Boolean,
	icp:String,
	fff:Number
  },
  methods: {
    gotop:function() {
        scrollTo(0,0);
    }
  }
}


$(function(){
//在线客服
$(".home17_kefu li").mouseover(function(){
	$(this).siblings("li").removeClass("active");
	$(this).addClass("active");
}).mouseout(function(){
	$(this).removeClass("active");
});
$(".home17_kefu_ct i").click(function(){
	$(this).parent().parent().parent().removeClass("active");
});
// $(".home17_kefu li:nth-child(4) a").click(function(){
// 	$body=(window.opera)? (document.compatMode=="CSS1Compat"? $('html') : $('body')) : $('html,body')
// 	$body.animate({scrollTop:0},1000);
// });

});

</script>
<!-- 使用方法：<ZoomlaKefu_top cols="12" md="12" class="bg-info" con="2020年逐浪软件科技" :icpOpen="true" icp="沪ICP200800号"/> -->