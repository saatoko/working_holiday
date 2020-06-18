// import Vue from 'vue'
import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'
import Home from "../components/home/index"
import SiteGuide from "../components/home/SiteGuide"
import SignUp from "../components/user/SignUp"
import SignIn from "../components/user/SignIn"
import SignOut from "../components/user/SignOut"


Vue.use(VueRouter)

// { path: 'アクセスされるURL', component: '使用するコンポーネント', name: 'pathの名前'}

const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      component: Home,
      name: 'home',
    },
    {
      path: '/home/siteguide',
      component: SiteGuide,
      name: 'siteguide',
    },
    // {
    //   path: '/users/sign_up',
    //   component: SignUp,
    //   name: 'signup',
    // },
    // {
    //   path: '/users/sign_in',
    //   component: SignIn,
    //   name: 'signin',
    // },
    // {
    //   path: '/users/sign_out',
    //   component: SignOut,
    //   name: 'signout',
    // },
  ]
})

export default router


