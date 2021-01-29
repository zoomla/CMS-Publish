<template>
<div class="home">
  <div class="iHero">
  <div class="container-xl">
  <!-- <i class="zi zi_tmPowerShell zi_load2"></i> -->
  <h1>面向PowerShell开发的中文社区</h1>
  <b-link href="https://gitee.com/chuanjiao10/kasini3000" class="btn btn-dark mr-2" target="_blank">卡死你3000源码库</b-link> 
  <b-button variant="outline-dark" onclick="javascript:alert('内测中即将开放')">动妖智Shell大师</b-button>
  </div>
  </div>
  <!-- iHero end -->
  
<b-container fluid="xl" class="">
  <div class="iwell">
  <b-row>
  <b-col md="6" class="iwell_l" >
    <h2>基于PowerShell智能操控</h2>
    <p>发挥自动线程优势-并可跨平台发挥无限潜力的AI计算平台</p>
  </b-col>
  <b-col md="3">
    <i class="zi zi_Chinesecalendar"></i>
    <strong>面向企业</strong>
    <p>可以高效管理</p>
     <b-button  variant="dark" size="lg" onclick="javascript:alert('内测中即将开放')">智动妖Shell大师</b-button>
  </b-col>
  <b-col md="3">
    <i class="zi zi_Chinesecalendar"></i>
    <strong>面向生产</strong>
    <p>集成在Zoomla!逐浪CMS之中</p>
     <b-button variant="outline-dark" size="lg" onclick="javascript:alert('内测中即将开放')">获取官方支持</b-button>    
  </b-col>
  </b-row>
  </div>
</b-container>

  
<b-container fluid="xl" class="inews">
  <!-- <h3>技术文摘</h3> -->
  <b-row>
    <b-col md="4" class="" v-for="node in nodelist" :key="node.NodeID">
    <div class="inews_box">
    <div class="inews_box_title"><i class="zi zi_fly"></i>{{node.NodeName}}<a :href="'#/class/'+node.NodeID">更多+</a></div>
    <ul>
      <li v-for="content in node.commonlist" :key="content.GeneralID"><a :href="'#/item/'+content.GeneralID">{{content.Title}}</a></li>
    </ul>
    </div>
  </b-col>
  </b-row>
</b-container>
<!-- inews end -->

<b-container fluid="xl" class="ishow">
  <ul class="row">
    <li class="col-md-2 col-6">
    <div class="ishow_box">
      <div class="ishow_box_i"><i class="zi zi_www" zico="网络"></i></div>
      <div class="ishow_box_title">
       <span>快速运行</span>
       <p>完全开放的新一代Shell语言，可以自由开发各种应用</p>
      </div>
    </div>
    </li>
    <li class="col-md-2 col-6">
    <div class="ishow_box">
      <div class="ishow_box_i"><i class="zi zi_www" zico="网络"></i></div>
      <div class="ishow_box_title">
       <span>即速启动</span>
       <p>与windows良好的集成，学习成本低，上手快</p>
      </div>
    </div>
    </li>
    <li class="col-md-2 col-6">
    <div class="ishow_box">
      <div class="ishow_box_i"><i class="zi zi_www" zico="网络"></i></div>
      <div class="ishow_box_title">
       <span>自由扩展</span>
       <p>与dotNET core完美结合，是微软新一代语言之王</p>
      </div>
    </div>
    </li>
    <li class="col-md-2 col-6">
    <div class="ishow_box">
      <div class="ishow_box_i"><i class="zi zi_rocket"></i></div>
      <div class="ishow_box_title">
       <span>面向未来</span>
       <p>Zoomla!逐浪CMS团队即时支持，具备良好的扩展和二次开发支持</p>
      </div>
    </div>
    </li>
    <li class="col-md-2 col-6">
    <div class="ishow_box">
      <div class="ishow_box_i"><i class="zi zi_digg"></i></div>
      <div class="ishow_box_title">
       <span>自由应用</span>
       <p>满足各类超级应用的，全球开发者鼎力支持</p>
      </div>
    </div>
    </li>
    <li class="col-md-2 col-6">
    <div class="ishow_box">
      <div class="ishow_box_i"><i class="zi zi_curve"></i></div>
      <div class="ishow_box_title">
       <span>场景广泛</span>
       <p>丰富的应用场景，一键生成，服务于生产力领域</p>
      </div>
    </div>
    </li>
  </ul>
</b-container>
<!-- ishow ned    -->

<div class="iscroll">
  <b-container fluid="xl">


   
<div class="iscroll_show">
    <swiper :options="swiperOption" ref="mySwiper">
            <swiper-slide class="swiper-slide" v-for="swiper in homeswiper" :key="swiper.GeneralID">
              <img :src="swiper.TopImg" :alt="swiper.Title"  />
              <p>{{swiper.Title}}</p>
            </swiper-slide>
            <!-- 分页器 -->
            <div class="swiper-pagination"  slot="pagination"></div>   
             <!-- 左右箭头 --> 
            <div class="swiper-button-prev" slot="button-prev"></div> 
            <div class="swiper-button-next" slot="button-next"></div> 
        </swiper>
    </div>
  </b-container>
</div>
<!-- iscroll end  -->

<b-container fluid="xl" class="yuju">
  <ul class="row">
    <li class="col-md-3" v-for="parentlists in parentlist" :key="parentlists.NodeID">
    <a :href="'#/class/'+parentlists.NodeID"><i :class="'zi '+parentlists.NodePicUrl"></i></a>
    <strong><a :href="'#/class/'+parentlists.NodeID">{{parentlists.NodeName}}</a></strong>
    <p>{{parentlists.Meta_Description}}</p>
    </li>
  </ul>
</b-container>
<!--  yuju end  -->

<b-container fluid="xl" class="xiazai">
  <h2>一个客户端就能满足你所有需求</h2>
 <b-button variant="outline-danger" class="xiazai_but" onclick="javascript:alert('内测中即将开放')">下载智动妖SHELL大师 →</b-button>
</b-container>
<!--  xiazai end  -->

<b-container fluid="xl">
  <div class="row">
    <div class="col-md-10 offset-md-1 advisory">
      <p>16年深耕做中国最好的基础软件研发企业
      <a href="https://www.z01.com/corp/about/83.shtml" class="advisory_a" target="_blank">立即咨询</a>
      </p>
    </div>
  </div>
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
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'
export default{
  name: 'Home',
		data:function(){
      var model={nodelist:[],swiperOption:{},homeswiper:[],toollist:[],parentlist:[],parentlist2:[],newsNode:[],newsMode:[]};
			var pid=9,snid=3,tnid=2,ppid=9,ppid2=1,newnid=22,newmid=2;
			this.jsp("ps_index",{"pid":pid,"snid":snid,"tnid":tnid,"ppid":ppid,"ppid2":ppid2,"newnid":newnid,"newmid":newmid}).then((ret)=>{
        var result = JSON.parse(ret.result);
        model.nodelist=result.nodelist;
        model.nodelist.forEach(element => {
        element.commonlist = JSON.parse(element.commonlist);
        });
        model.homeswiper=result.homeswiper;
        model.toollist=result.toollist;
        model.parentlist=result.parentlist;
        model.parentlist2=result.parentlist2;
        model.newsNode=result.newsNode;
        model.newsMode=result.newsMode;

        window.console.log(model);
    });
    model.swiperOption={
          init : false,
          //显示分页
          pagination: {
            el: '.swiper-pagination',
            clickable:true,
          },
          //设置点击箭头
          navigation: {
            nextEl: '.swiper-button-next', 
            prevEl: '.swiper-button-prev'
          },
            autoplay: {
            delay: 2000,
            //当用户滑动图片后继续自动轮播
            disableOnInteraction: false,
          },
          loopedSlides:5,
          slidesPerView: 3,
          initialSlide:1,
          grabCursor:true,
          centeredSlides:true,
          keyboard:true,
          loop: true
      };
			return model;
    },
    computed:{
      swiper(){
        return this.$refs.mySwiper.swiper;
      }
    },
    metaInfo: {
      title: '智动妖-开发者社区',
      meta: [
        { charset: 'utf-8' },
        { name: 'viewport', content: 'width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no' },
        { vmid: 'description', name: 'description', content: '专业开发者社区' },
        { vmid: 'keywords',name: 'keywords',content: 'powershell,ps,zoomla，开发者,bat' }
      ]
    },
		methods:{
			navTo:function(node){
				this.$router.push("/NodeContent/"+node.NodeID);
			}
		},updated(){
      if(this.homeswiper.length > 1){
        this.swiper.init();
      }
    }
  }
</script>
