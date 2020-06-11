<template>
  <div class="guide">
    ページ紹介
    <h1>{{name}}</h1>
  </div>
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
  margin: 0;
  padding: 0;
}
</style>