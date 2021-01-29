import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import router from './router'

// 自定义引用
import VueJsonp from 'vue-jsonp'
import common from './models/common.js'
import Regex from './models/Regex.js'
import Meta from 'vue-meta'
import BaiduMap from 'vue-baidu-map'

// 自定义组件
import ZoomlaFoot from './components/ZoomlaFoot.vue'
import ZoomlaKefu from './components/ZoomlaKefu.vue'
import Zoomla_plus_iteam from './components/Zoomla_plus_iteam.vue'

// 自定义引用
import "zico/css/zico.min.css";

Vue.config.productionTip = false
Vue.component('ZoomlaFoot', ZoomlaFoot)
Vue.component('ZoomlaKefu', ZoomlaKefu)
Vue.component('Zoomla_plus_iteam', Zoomla_plus_iteam)
Vue.use(VueJsonp)
Vue.use(common)
Vue.use(Regex)
Vue.use(Meta)

new Vue({
  router,
  render: h => h(App)
}).$mount('#app')

Vue.use(BaiduMap, {
  // ak 是在百度地图开发者平台申请的密钥 详见 http://lbsyun.baidu.com/apiconsole/key */
  ak: 'XUOPQqG32lrKT4oPC6thLS2Wc6kY0ogx'
})