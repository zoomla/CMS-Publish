<template>
<div class="kefu">
<ul>
<li><a :href="'tel:'+tel"><span>联系我们</span><i class="zi zi_phone zi_rotate90"></i></a></li>
<li><a :href="'http://wpa.qq.com/msgrd?v=3&amp;uin='+qq+'&amp;site=qq&amp;menu=yes'" target="_blank"><span>QQ在线客服</span><i class="zi zi_tmQq" zico="qq"></i></a></li>
<li class="kefu_wechat"><a href="javascript:;"><span><img src="../assets/images/logo.svg" alt="微信二维码"></span><i class="zi zi_tmWeixin" zico="微信"></i></a></li>
<li><a href="/Guest" target="_blank"><span>留言咨询</span><i class="zi zi_msgchat"></i></a></li>
<li class="kefu_qrcode"><a :href="'http://app.z01.com/Class_2/NodePage?Url='+url" target="_blank"><span>☞ 手机浏览体验</span><i class="zi zi_qrcode"></i></a></li>
</ul>
</div>
</template>

<script>
export default {
  name: "ZoomlaKefu",
  props: {
	tel:String,
	qq: Number,
    url: String,
	// icpOpen: Boolean,
	// icp:String,
	// fff:Number
  },  
  data(){
    return {}
  },
  components: {},
  created(){},
  mounted(){},
  methods: {}
}
</script>
<style lang='scss' scoped>
</style>
// 使用方法： <ZoomlaKefu tel="13177777714" qq="1799661890" url="http://www.z01.com" />