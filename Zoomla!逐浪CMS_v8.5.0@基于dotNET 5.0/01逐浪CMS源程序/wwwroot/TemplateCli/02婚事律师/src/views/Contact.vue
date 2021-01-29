<template>
<div class="contact">
<div class="contact_banner">
<h1>盈家律师团队，婚姻家事专业法律服务提供者</h1>
离婚请谨慎，维权找我们
</div>
<!-- contact_banner end -->


<b-container class="contace_tel">
<b-card
title="留下您的电话" tag="article" style="max-width: " class="mb-2" >
<b-card-text>
让我们专业的律师团队联系您
</b-card-text>
<!-- <b-button href="#" variant="primary">Go somewhere</b-button> -->
<p>
咨询电话：15879010591<br/>
地址：南昌市西湖区洪池路2号汇景国际综合楼3A层 江西朗秋律师事务所<br/>
（百度、高德地图中搜索汇景国际即可找到）<br/>
公交站点：抚生路口<br/>
线路：26路、38路、146路、169路、221路、228路、238路、251路、864路、高铁巴士1线
</p>
</b-card>
</b-container>



<b-container fluid="xl" class="contace_map">
  <baidu-map class="contace_mapBox" :center="{lng: 115.886466, lat: 28.65921}" :zoom="18">
    <bm-marker :position="{lng: 115.886466, lat: 28.65921}" :dragging="true" animation="BMAP_ANIMATION_BOUNCE">
		<bm-navigation anchor="BMAP_ANCHOR_TOP_RIGHT"></bm-navigation>
      <bm-label content="联系盈家律师团队<br/><small>电话：15879010591</small>" :labelStyle="{color: 'red', fontSize : '24px'}" :offset="{width: -35, height: 30}"/>
    </bm-marker>
  </baidu-map>
</b-container>
<!-- contace_map end -->






<b-container fluid="xl" class="contace_put" hidden>
	
<!-- <b-form-input v-model="PubTitle" placeholder="PubTitle- your name"></b-form-input>
<b-form-input v-model="PubContent" placeholder="PubContent- your name"></b-form-input> -->
<hr>

<b-form-input v-model="form.PubTitle" placeholder="客户留言" value=""></b-form-input>
<b-form-input v-model="form.name" placeholder="敬请下尊姓大名我们将严格保证你的隐私"></b-form-input>
<b-form-input v-model="form.mobile" placeholder="请输入手机号方便我们联系您"></b-form-input>
<!-- <x-input title="姓名" placeholder="请输入姓名" v-model="form.name"></x-input>
<x-input title="手机" placeholder="请输入手机号" v-model="form.mobile"></x-input> -->
  <b-button @click="submit()" variant="info btn-block"><i class="zi zi_click"></i> 点此立即提交您的法务诉求</b-button>
</b-container>







<footer>
	<b-container fluid="xl">
	<b-row>
	<b-col md="4">
		<i class="zi zi_phonevolume"></i>
		免费客服热线:(周一至周日 9:00-18:00）
		15879010591
	</b-col>
	<b-col md="4">
		<i class="zi zi_map"></i>
		联系地址：南昌市西湖区洪池路2号汇景国际综合楼3A层   江西朗秋律师事务所
	</b-col>
	<b-col md="4">
		<b-img src="../assets/images/qrcode.jpg" alt="微信关注我们"></b-img>
		微信关注我们
	</b-col>
	</b-row>
	</b-container>
</footer>

<b-container fluid="xl">
<ZoomlaFoot :cols="12" :md="12" class="" con="2020年江西朗秋律师团队" :icpOpen="true" icp="赣ICP备14007249号"/>	
</b-container>	
<ZoomlaKefu tel="15879010591" qq="405565053" url="http://tl.lqlawyer.com" />
</div>
</template>
<script>
	export default{
		data(){
			var ref=this;
			var model={form:{}};
			return model;
		},
		metaInfo: {
			title: '联系我们',
			meta: [
				{ charset: 'utf-8' },
				{ name: 'viewport', content: 'width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no' },
				{ vmid: 'description', name: 'description', content: '联系盈家律师最快方式' },
				{ vmid: 'keywords',name: 'keywords',content: '联系唐乐婚姻,家事,离婚,南昌法院,南昌小三案件,南昌夫妻财产' }
			]
			},		
		methods:{
			submit:function(){
				var ref=this;
				if(ref.Regex.isEmpty(ref.form.name)){ref.util.alert("姓名不能为空");return false;}
				if(!ref.Regex.isMobilePhone(ref.form.mobile)){ref.util.alert("手机号格式不正确 ");return false;}
				ref.jsp("pub_add&pubid=7",{"model":JSON.stringify(ref.form)}).then((ret)=>{
					if(ret.retcode!=1){ref.util.alert(ret.retmsg);return false;}
					ref.util.alert("加盟代理申请已提交成功,请等待管理员审核");
				})
			}
		},
		

	}
</script>	
