// import Vue from 'vue'
import Vue from 'vue/dist/vue.esm'
import VueRouter from 'vue-router'
import Home from './components/home/index.vue'


Vue.use(VueRouter)


// export default router




var router = new VueRouter({
  routes: [
    {
      path: '/',
      name: 'Home',
      component: ''
    },
    
    {
      path: '/users/sign_up',
      name: 'UserSignup',
      component: '',
      beforeEnter: function (to, from, next){
        if (to.query.redirect ==='true'){
          next('/')
        }else {
          next()
        }
      },

      path: '/users/sign_in',
      name: 'UserSignin',
      component: '',
      beforeEnter: function (to, from, next){
        if (to.query.redirect ==='true'){
          next('/')
        }else {
          next()
        }
      }

    }
  ]
})

var app = new Vue({
  router: router
}).$mount('#app')
