import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/about',
    name: 'About',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  },
	{
		path: '/contact',
		name: 'contact',
    component: () => import('../views/Contact.vue')		
  },
	{
		path: '/chengxu',
		name: 'chengxu',
    component: () => import('../views/chengxu.vue')		
	},
	{
		path: '/haizi',
		name: 'haizi',
    component: () => import('../views/haizi.vue')		
	},
	{
		path: '/caichan',
		name: 'caichan',
    component: () => import('../views/caichan.vue')		
	},
	{
		path: '/jicheng',
		name: 'jicheng',
    component: () => import('../views/jicheng.vue')		
  },
	{
		path: '/caifu',
		name: 'caifu',
    component: () => import('../views/caifu.vue')		
	}	
]

const router = new VueRouter({
  routes
})

export default router
