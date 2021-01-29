import '@babel/polyfill'
import 'mutationobserver-shim'
import Vue from 'vue'
import './plugins/bootstrap-vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueAwesomeSwiper from 'vue-awesome-swiper'

// 自定义引用
import VueJsonp from 'vue-jsonp'
import common from './models/common.js'
import Regex from './models/Regex.js'
import Meta from 'vue-meta'

// 自定义组件
// import ZoomlaFoot from './components/ZoomlaFoot.vue'
import ZoomlaKefu from './components/ZoomlaKefu.vue'
import ZoomlaKefu_top from './components/ZoomlaKefu_top.vue'
// import Zoomla_plus_iteam from './components/Zoomla_plus_iteam.vue'


// import 'highlightjs-line-numbers.js/src/highlightjs-line-numbers.js';

// import VueHljs from 'vue-hljs-with-line-number'
// import 'vue-hljs-with-line-number/line-number.css'

// 自定义引用
import 'zico/css/zico.min.css';
import 'swiper/css/swiper.css';


import hljs from 'highlight.js'
window.hljs = hljs
import 'highlight.js/styles/github.css';
Vue.config.productionTip = false
// Vue.component('ZoomlaFoot', ZoomlaFoot)
Vue.component('ZoomlaKefu', ZoomlaKefu)
Vue.component('ZoomlaKefu_top', ZoomlaKefu_top)
// Vue.component('Zoomla_plus_iteam', Zoomla_plus_iteam)

Vue.use(VueJsonp)
Vue.use(common)
Vue.use(Regex)
Vue.use(Meta)
Vue.use(VueAwesomeSwiper, /* { default options with global component } */)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')

