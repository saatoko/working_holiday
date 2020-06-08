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
    // {
    //   path: '/user/SignUp',
    //   component: SignUp,
    //   name: 'signup',
    // },
    // {
    //   path: '/user/SignIn',
    //   component: SignIn,
    //   name: 'signin',
    // },
    // {
    //   path: '/user/SignOut',
    //   component: SignOut,
    //   name: 'signout',
    // },

  ]
})

export default router


