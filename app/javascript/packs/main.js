import TurbolinksAdapter from 'vue-turbolinks'

import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
// import Vuex from 'vuex'

import router from "../router/router.js"
import VueRouter from 'vue-router'
import anime from 'animejs/lib/anime.es.js';
import moment from "moment";

import { library } from '@fortawesome/fontawesome-svg-core'
import { faHome, faPlaneDeparture, faEnvelopeOpenText, faUser, faSearch, faInfoCircle } from '@fortawesome/free-solid-svg-icons'
import { faEye } from '@fortawesome/free-regular-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'

library.add(faHome, faPlaneDeparture, faEnvelopeOpenText, faUser, faSearch, faInfoCircle, faEye)

Vue.component('v-fa', FontAwesomeIcon);

Vue.use(TurbolinksAdapter);
Vue.use(VueRouter);

document.addEventListener('turbolinks:load', () => {
// document.addEventListener('DOMContentLoaded', () => {
  new Vue({
    el: '#app',
    router,
    anime,
    moment,
    render: (h) => h(App),
    components: { App }
  });
});

