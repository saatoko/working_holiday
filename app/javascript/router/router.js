import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from "../components/home/index"

Vue.use(VueRouter)


const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: Home,
      name: 'home',
    },
  ]
})

export default router


