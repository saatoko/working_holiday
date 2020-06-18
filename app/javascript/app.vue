<template>
<div>
  <Header></Header>
    <router-view />
  <Footer></Footer>
</div>


</template>

<script>
import Header from "./components/Header.vue";
import Footer from "./components/Footer.vue";

export default {
  components: { Header, Footer },
}

</script>

<style scoped lang="scss" scoped>
*, *:before, *:after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  }
</style>
