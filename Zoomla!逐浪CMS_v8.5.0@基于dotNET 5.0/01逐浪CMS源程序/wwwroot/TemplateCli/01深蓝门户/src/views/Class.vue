<template>
<div class="class">
<div class="class_banner">
<h1>当前栏目:{{nodeInfo.NodeName}}</h1>
</div>

<b-breadcrumb :items="breadcrumb" class="container-xl ibread"></b-breadcrumb>

<!-- <div class="">当前节点ID：{{nodeInfo.NodeID}}</div>1
<div class="">当前节点名称：{{nodeInfo.NodeName}}</div>
<div class="">当前节点描述：{{nodeInfo.Meta_Description}}</div>
<div class="">当前节点关键字：{{nodeInfo.Meta_Keywords}}</div> -->

<b-container fluid="xl" class="class_list">
<b-row>	
	<div  class="class_listAll" v-for="item in list" :key="item.GeneralID">
	
		
	<div class="class_listAll_img" v-if="item.TopImg != ''">
	<a :href="'#/Item/'+item.GeneralID"><b-img-lazy :src="item.TopImg"></b-img-lazy></a>
	</div>

<div class="class_list_r">
	<strong><a :href="'#/Item/'+item.GeneralID" class="">{{item.Title}}</a></strong>
	<small>
		<span class="name">{{item.Inputer}}</span> 
		<span class="date">{{item.CreateTime.split('T')[0]}}</span>
	</small>
	<a :href="'#/Item/'+item.GeneralID"><p class="" v-html = "item.content"></p></a>
	</div>
	</div>
	<div class="home_pagination">
	<b-pagination limit="9" align="center" v-model="page.cpage" @change="loadList()" :total-rows="page.itemCount" :per-page="page.psize" aria-controls="my-table" size="lg"></b-pagination></div>
</b-row>	
</b-container>


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
</div>
</template>
<script>
export default{
	data(){
		var ref=this;
		var model={list:[],page:{cpage:1,psize:10,itemCount:0},nodeInfo:{},breadcrumb:[],newsNode:[],parentlist2:[]};
		var nid=this.$route.params.nid,newnid=22,pid=1;
		ref.jsp("node_get",{"id":nid}).then((ret)=>{				
			model.nodeInfo=JSON.parse(ret.result);
		});
		//调用接口获取数据
		ref.jsp("node_list",{"pid":pid}).then((ret)=>{				
			model.parentlist2=JSON.parse(ret.result);
		});
		ref.jsp("content_list",{"nid":newnid}).then((ret)=>{				
			model.newsNode=JSON.parse(ret.result);
		//输出数据方法
			window.console.log(model.content_list);

			model.breadcrumb = [
			{
				text: '首页',
				href: '/'
			},
			{
				text: model.nodeInfo.NodeName,
				href: '#'
			},
			{
				text: '栏目列表',
				active: true
			}
			];
		});
		return model;
	},
    metaInfo () {
      return {
        title: this.nodeInfo.NodeName,
        meta: [
			{ charset: 'utf-8' },
			{ name: 'viewport', content: 'width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no' },
			{ vmid: 'description', name: 'description', content: this.nodeInfo.Meta_Description },
			{ vmid: 'keywords',name: 'keywords',content: this.nodeInfo.NodeName }
        ]
      }
    },
	methods:{
			loadList:function(){
			var ref=this;
			setTimeout(function(){
				ref.jsp("content_list&nid="+ref.$route.params.nid,ref.page).then((ret)=>{				
					ref.list=JSON.parse(ret.result);
					ref.page=ret.page;
					for(let i=0;i<ref.list.length;i++){
						ref.list[i].content=ref.util.str.htmlToText(ref.list[i].content,210);

						var img = ref.list[i].TopImg;
						img= img.substring(img.lastIndexOf("/")+1,img.length)
						if(img == "nopic.svg"){
							ref.list[i].TopImg = "";
						}
					}
					window.console.log(ret.page);
				});
			},50);//setTimeout end;
		}
	},
    created () {
    },
	mounted:function(){
		this.loadList();
	}	
}
	
</script>