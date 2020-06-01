<template lang="haml">
  %div
    %h1.title {{ app_name }}
      %p.title__sub {{app_subtitle}}
</template>

<script>

export default {
  data: function () {
    return {
      app_name: "ワーキングホリデー相談掲示板",
      app_subtitle: "経験談、相談、計画、なんでも投稿可能！",
      // name: 'Home'
    }
  },
}
</script>

<style scoped lang="scss" scoped>
.title {
  font-size: 2rem;
  text-align: center;
  &__sub {
    font-size: 1rem;
    color: blue;
  }
}
</style>
