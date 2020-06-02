<template lang="haml">
  %div
    %Home
</template>

<script>
import Home from "./components/home/index";

export default {
  components: { Home }
}
</script>

<style scoped lang="scss" scoped>
  *, *:before, *:after {
  -webkit-box-sizing: border-box;
  box-sizing: border-box
  }
</style>
