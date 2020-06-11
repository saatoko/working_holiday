<template lang="haml">
  %div.guide
    %div ページ紹介
      %h1 {{name}}
    -# %router-view
</template>

<script>
export default {
  data: function () {
    return {
      name: "サイト案内"
    }
  },
}
</script>

<style scoped lang="scss" scoped>
  .guide {
  width: 100%;
  height: 100vh;
  // height: 100%;
  margin: 0;
  padding: 0;
}
</style>