<template lang="haml">
  %div.home
    %Header
   

    -# %Footer
</template>

<script>
// import Header from "../header";
// import Footer from "../footer";

import Header from "../Header.vue";
// import Footer from "../Footer.vue";

export default {
  // data: function () {
  //   return {
  //     name: 'Home'
  //   }
  // },
  components: { Header, Footer },
}

</script>

<style scoped lang="scss" scoped>
.home {
  width: 100%;
  height: 100vh;
  margin: 0;
  padding: 0;
}
</style>
