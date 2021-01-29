<template>
<b-col :cols="cols" :md="md" class="">{{con}} <a href="http://beian.miit.gov.cn" target="_blank" v-if="icpOpen"><i class="zi zi_icp" zico="ICP备案"></i> {{icp}}</a></b-col>
</template>
<script>
export default {
	name:"ZoomlaFoot",
  props: {
	cols:Number,
	md: Number,
	className: String,
  con: String,
	icpOpen: Boolean,
	icp:String,
	fff:Number
  }
}
</script>
<!-- 使用方法：<ZoomlaFoot cols="12" md="12" class="bg-info" con="2020年逐浪软件科技" :icpOpen="true" icp="沪ICP200800号"/> -->