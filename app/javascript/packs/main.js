import TurbolinksAdapter from 'vue-turbolinks'

import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
// import Vuex from 'vuex'
import store from '../store'

import router from "../router/router.js"
import VueRouter from 'vue-router'
import anime from 'animejs/lib/anime.es.js';
import moment from "moment";
import axios from 'axios'

import VueAxios from 'vue-axios'
import { securedAxiosInstance, plainAxiosInstance } from '../axios/axios.js'
// true の場合の方が開発者向けのメッセージがコンソールによりたくさん出る。開発中はtrueにした方が良い。
// Vue.config.productionTip = false; 

// グローバルコンポーネントでaxiosを使用できる
Vue.prototype.$axios = axios

import { library } from '@fortawesome/fontawesome-svg-core'
import { faHome, faPlaneDeparture, faEnvelopeOpenText, faUser, faSearch, faInfoCircle } from '@fortawesome/free-solid-svg-icons'
import { faEye } from '@fortawesome/free-regular-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faHome, faPlaneDeparture, faEnvelopeOpenText, faUser, faSearch, faInfoCircle, faEye)

Vue.component('v-fa', FontAwesomeIcon);

Vue.use(TurbolinksAdapter);
Vue.use(VueRouter);

Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
})

document.addEventListener('turbolinks:load', () => {
// document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    router,
    store,
    securedAxiosInstance,
    plainAxiosInstance,
    anime,
    moment,
    render: (h) => h(App),
    components: { App }
  });
});

