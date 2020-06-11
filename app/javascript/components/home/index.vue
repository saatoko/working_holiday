<template lang="haml">
  %div.home
    -#   %Header
    -#   %router-link{to: "{ name: 'home'}"} 
    -#   %Footer
    %p トップページのビュー(ここに中身のコンポーネントを作成して入れる)
   
    -# <p>{{msg}}<button @click="say">click</button></p>
    -# %router-view 
</template>

<script>
// import Header from "../Header.vue";
// import Footer from "../Footer.vue";

export default {
  data: function () {
    return {
    
    }
  },
  // components: { Header, Footer},
  
}

</script>

<style scoped lang="scss" scoped>
.home {
  width: 100%;
  height: 100vh;
  // height: 100%;
  margin: 0;
  padding: 0;
}
</style>
