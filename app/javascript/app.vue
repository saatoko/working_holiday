<template>
<div>
  <Header></Header>
  <!-- <router-link :to="{name: 'home'}">ホーム</router-link>
  <router-link :to="{name: 'signup'}">新規登録</router-link>  -->
  <router-view/> 
  <Footer></Footer>
</div>


</template>

<script>
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";

// import Vue from 'vue/dist/vue.esm'
// import router from './router/router'

// import Home from "./components/home/index";
export default {
  components: { Header, Footer },
}

// document.addEventListener('DOMContentLoaded', () => {
//   new Vue({
//     router: router
//   }).$mount('#app')
//   console.log("aaaaaaa")
// });

</script>

<style scoped lang="scss" scoped>
*, *:before, *:after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
</style>
