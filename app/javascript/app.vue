<template lang="haml">
  -# %div{id: "app"}
  -#   %router-link{to: "{ name: 'home'}"}
  -#   %router.push({ name: 'home'})

  %Home
</template>

<script>
// import Vue from 'vue/dist/vue.esm'
import Home from "./components/home/index";

export default {
  components: { Home },
  
}

// var app = new Vue({
//   router: router
// }).$mount('#app')


</script>

<style scoped lang="scss" scoped>
*, *:before, *:after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
</style>
