<template lang="haml">
  %div
    %h1.title {{ message }}
      %p.title__sample {{mini}}
    %Home
</template>

<script>
import Home from "./components/home/index";
export default {
  data: function () {
    return {
      message: "ワーキングホリデー相談掲示板",
      mini: "サンプル",
    }
  },
  components: { Home }

}
</script>

<style scoped lang="scss" scoped>
.title {
  font-size: 2em;
  text-align: center;
  &__sample {
    color: blue;
  }
}
</style>
