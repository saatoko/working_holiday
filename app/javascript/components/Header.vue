<template lang="haml">
  %div.header
    %div.header-block
      %v-fa.header-block__home{icon: "home"}
      %h1.header-block__title {{ app_name }}
      %p.header-block__subtitle {{app_subtitle}}
    %Navbar
</template>

<script>
import Navbar from "./Navbar.vue";
export default {
  data: function () {
    return {
      app_name: "ワーキングホリデー相談掲示板",
      app_subtitle: "経験談、相談、計画、なんでも投稿！!",
      name: 'header-component'
    }
  },
  components: { Navbar },
}
</script>

<style scoped lang="scss" scoped>
.header {
  width: 100%;
  height: auto;
  background-color: rgb(53, 83, 167);
  .header-block {
    width: 80%;
    margin: 0 auto;
    height: 100%;
    background-color: rgb(53, 83, 167);
    color: white;
    padding: 1rem 0;
    display: -webkit-flex;
    display: flex;
    -webkit-align-items: center; 
    align-items: center; 
    font-family: ヒラギノ丸ゴ ProN;
    &__home {
    font-size: 3rem;
    }
    &__title {
      font-size: 2rem;
      text-align: center;
      padding-left: 1rem;
      font-weight: bold;
      letter-spacing: 0.2rem;
    }
    &__subtitle {
      margin-left:auto;
      font-size: 1.3rem;
      color: rgb(228, 223, 195);
    }
  }
}
</style>