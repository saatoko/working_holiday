// import Vue from 'vue'
import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'
import Home from "../components/home/index"
import SiteGuide from "../components/home/SiteGuide"
import SignUp from "../components/user/SignUp"
import SignIn from "../components/user/SignIn"
// import SignOut from "../components/user/SignOut"


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
    //   path: '/api/signup',
    //   component: SignUp,
    //   name: 'signup',
    // },
    {
      path: '/api/signin',
      // redirect: '/',
      component: SignIn,
      name: 'signin',
    },
    {
      path: '/api/signup',
      component: SignUp,
      // ルートの遷移前に実行される
      beforeEnter: function (to, from, next) {
        if (to.query.redirect === 'true') {
          next('/')
        } else {
          next()
        }
      }
    }

    // {
    //   path: '/api/signin',
    //   component: SignOut,
    //   name: 'signout',
    // },
  ]
})

export default router

// routesにredirectするとpathの設定の意味がなくなる

