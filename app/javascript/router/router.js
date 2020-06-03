import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'
import Home from "../components/home/index"

Vue.use(VueRouter)
export default router

var router = new VueRouter({
  routes: [
    {
      path: '/',
      component: { Home },
      name: 'home',
    },
  ]
})


