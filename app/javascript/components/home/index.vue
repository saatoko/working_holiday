<template lang="haml">
  -# %article
  -# %h1.title {{ title }}
  %h1{id: "subid"} {{ sub }}
</template>

<script>

export default {
  data: function () {
    return {
      sub: "ワーキング"
    }
  },
}
</script>


<style lang="scss" scoped>
  // article {
  //   background-color: #fff;
  // }
</style>