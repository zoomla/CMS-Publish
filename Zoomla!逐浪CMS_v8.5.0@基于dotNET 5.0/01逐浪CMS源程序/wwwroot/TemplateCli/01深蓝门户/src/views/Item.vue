<template>
<div class="item">
<div class="class_banner">
<h1>当前栏目:{{this.node.NodeName}}</h1>
</div>

<!-- +model.node.NodeID -->
<b-breadcrumb :items="breadcrumb" class="container-xl ibread"></b-breadcrumb>

<b-container fluid="xl" class="item_title">
	<h1>{{conMod.title}}</h1>
	<abbr>
	<span id="CreateTime">关键字：{{conMod.tagkey}} 发表：{{conMod.createTime.split('T')[0]}}</span> <span id="Hits">浏览数：{{conMod.hits}}</span>
	</abbr>
</b-container>

<div class="container-xl myContent" v-html="conMod.content"></div>

<div class="pt-2 text-center"><button type="button" class="copyBtn btn btn-dark btn-lg" @click="copyShareLink()"><i class="zi zi_sharealt"></i> 看完本文，点此复制/分享当前网址</button></div>

<footer>
  <div class="bv-section bv-gray" data-v-555a030c=""></div>
    <div class="footer_con">
      <b-container fluid="xl">
        <div class="row">
          <div class="col-md-6 offset-md-3 footer_con_list">
            <ul>
              <li><strong>开始</strong></li>
              <li v-for="newsNodes in newsNode" :key="newsNodes.GeneralID"><a :href="'#/Item/'+newsNodes.GeneralID" class="">{{newsNodes.Title}}</a></li>
            </ul>
            <ul>
              <li><strong>使用</strong></li>
              <li><a href="#">CDN使用</a></li>
              <li><a href="#">下载本地目录</a></li>
              <li><a href="#">扩展资源</a></li>
              <li><a href="#">扩展资源</a></li>
              <li><a href="#">扩展资源</a></li>
            </ul>
            <ul>
              <li><strong>文摘</strong></li>
              <li v-for="parentlist2s in parentlist2" :key="parentlist2s.NodeID"><a :href="'#/Item/'+parentlist2s.NodeID" class="">{{parentlist2s.NodeName}}</a></li>
            </ul>
            <ul>
              <li><strong>其他</strong></li>
              <li><a href="#">逐浪字库</a></li>
              <li><a href="#">扩展资源</a></li>
              <li><a href="#">Bootstrap中国站</a></li>
              <li><a href="#">扩展资源</a></li>
              <li><a href="#">扩展资源</a></li>
            </ul>
          </div>
        </div>
      </b-container>
    </div>
    <b-container fluid="xl" class="Copyright">
      <p>Copyright &copy; 2020 Zoomla!CMS. All Rights Reserved 版 权所有<br/>
      <a href="http://www.z01.com" target="_blank">基于Zoomla!逐浪CMS&reg; Cli studio构建</a> <a href="http://www.73ic.com" target="_blank">73ic去上</a> 提供云计算服务 <a href="/Item/1353.aspx">[版权申明]</a><br><a href="https://opensource.org/licenses/MIT" target="_blank">遵循 MIT 开源协议</a></P>
    </b-container>
</footer>

<b-modal id="my-modal" centered title="成功提示">
<p class="my-4">您已成功将本文网址复制到剪贴板中，现在只要使用Ctrl+V就能轻松将本文资讯粘贴-分享到你的QQ/微信/微博上，获取更多流量!</p>
</b-modal>

<b-alert class="b-alert"
	:show="dismissCountDown"
	dismissible
	variant="dark"
	@dismissed="dismissCountDown=0"
	@dismiss-count-down="countDownChanged">
	成功复制 {{ dismissCountDown }} 秒自动消失...
</b-alert>

</div>
</template>
<script>
import Clipboard from 'clipboard'
import hljs from 'highlight.js'
import 'highlight.js/styles/mono-blue.css'
import 'highlightjs-line-numbers.js'
let clipBtn = {};

export default {
name: 'myContent',
 data(){
	var ref = this;
  var model = {conMod: {createTime:""}, node:{},breadcrumb:[],newsNode:[],parentlist2:[],dismissSecs: 5,dismissCountDown: 0};
  var id = ref.$route.params.id,newnid=22,pid=1;
	const that = this
	this.jsp("content_get",{"id":id}).then((ret)=>{
    model.conMod=JSON.parse(ret.result)[0];
    this.jsp("node_get",{"id":model.conMod.nodeId}).then((ret)=>{
		model.node=JSON.parse(ret.result);
    window.console.log(model.node);
    model.breadcrumb = [
			{
				text: '首页',
				href: '/'
			},
			{
				text: model.node.NodeName,
				href: '#/class/'+model.node.NodeID
			},
			{
				text: model.conMod.title,
				active: true
			}
			];
	})
	that.$nextTick(function(){
		that.initData()
	})
  });
		//调用接口获取数据
		ref.jsp("node_list",{"pid":pid}).then((ret)=>{				
			model.parentlist2=JSON.parse(ret.result);
    });
    // 调用数据接口输出面包屑导航
		ref.jsp("content_list",{"nid":newnid}).then((ret)=>{				
			model.newsNode=JSON.parse(ret.result);
		//输出数据方法
			// window.console.log(model.content_list);
		});    
	return model;
},
metaInfo () {
  return {
	title: this.conMod.title,
	meta: [
      { vmid: 'description', name: 'description', content: this.conMod.title },
	//  { vmid: 'keywords', name: 'keywords', content: this.conMod.title }
	]
  }
},
created () {
	window.btnClick = this.btnClick;
},
methods: {
	countDownChanged(dismissCountDown) {
        this.dismissCountDown = dismissCountDown
      },
      showAlert() {
        this.dismissCountDown = this.dismissSecs
      },
	initData(){
		hljs.initHighlightingOnLoad();
		hljs.initLineNumbersOnLoad();		
		const that = this
		const preDoms = document.querySelectorAll('pre');
		let clipbtns = [];
		preDoms.forEach(function(preDom,k){
			hljs.lineNumbersBlock(preDom.firstChild);
			var cliptoggle = document.createElement('span')
			cliptoggle.className = 'clipbtn'
			cliptoggle.setAttribute('onclick','btnClick()')
			cliptoggle.innerHTML = "<i class='zi zi_copy'></i>"
			preDom.appendChild(cliptoggle)
			clipbtns.push(clipbtns)
			// console.log(preDom.children)
			
		})		
		clipBtn = new Clipboard(document.querySelectorAll('.clipbtn'))
		clipBtn.on('success',function(){
			that.showAlert()
		})
		// clipBtn.on('error',function(){
		// 	console.log('复制失败')
		// })
		
	},
btnClick(){
  const target = window.event.currentTarget;		  
	clipBtn.text = function(e){			  
	return target.previousSibling.innerText;
	}
	},
copyShareLink(){
	const that = this
	let copyBtn = new Clipboard('.copyBtn');
	let shareText = this.conMod.title + " "+ window.location.href +' (分享自Zoomla!逐浪CMS官网)';
	copyBtn.on('success',function(){
			
			that.$bvModal.show('my-modal')
		})
	copyBtn.text = function(e){
	return shareText;
	}
}
	// navToList: function () { this.$route.push("/list/" + this.conMod..ModelID); }
},

mounted() {
		document.getElementsByTagName("body")[0].className="content_bg";
    },
updated () {
	// highlightCode()
	// lineNumbersBlock()
	},
// 下面两段为body绑定content_bg的className
beforeCreate:function() {
    
},
beforeDestroy:function() {
    document.body.removeAttribute("class","content_bg");
},
}

</script>
<style lang="scss" >

</style>