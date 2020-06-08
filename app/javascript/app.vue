<template lang="haml">
  %router-view
    -# %router-link{to: "{ name: 'home'}"}
    %router.push({ name: 'home'})

</template>

<script>
// import Vue from 'vue/dist/vue.esm'
// import router from './router/router'
import Home from "./components/home/index";
export default {
  components: { Home },
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
