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
    path: '/NodeList/:id?',
    component: () => import('../views/NodeList.vue')
	/*,
	meta:{
		title: '节点列表'
	}
	*/
  },
	{
		path: '/Class/:nid',
		component: () => import('../views/Class.vue')
  },
	{
		path: '/item/:id',
		name: 'item',
		component: () => import( /* webpackChunkName: "about" */ '../views/Item.vue')
	}    
]

const router = new VueRouter({
  routes
})

export default router
