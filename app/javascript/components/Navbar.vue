<template lang="haml">
  %div.navbar
    %div.navbar__block.clearfix
      %h1.country-choose 仮)情報の欲しい国を選択してください。
      %ul.icons
        %li.icons__first
          %v-fa{icon: "plane-departure"}
        %li.icons__second
          %v-fa{icon: "envelope-open-text"}
        %li.icons__third
          %v-fa{icon: "info-circle"}
        %li.icons__fourth
          %v-fa{icon: "user"}
</template>

<script>
export default {
  data: function () {
    return {
      name: 'Navbar',
    }
  },
}
</script>

<style scoped lang="scss" scoped>
.navbar {
  width: 100%;
  height: auto;
  background-color: #fff;
  box-shadow: rgb(53, 83, 167) 0px 2px 4px;
  &__block{
    width: 80%;
    margin: 0 auto;
    display: -webkit-flex;
    display: flex;
    -webkit-align-items: center; 
    align-items: center; 
    font-size: 1.2rem;
    letter-spacing: 0.3rem;
    &::after {
      content: "";
      display: block;
      clear: both;
    }
    .country-choose{
      float: left;
      width: 60%;
      font-weight: bold;
      color: rgb(126, 18, 18); 
    }
    .icons{
      text-align: right;
      float: right;
      width: 40%;
      color: rgb(170, 158, 47);
      height: 100%;
      padding: 0.3rem 0;
      display:table; 
      table-layout: fixed;
      ul.icons, li{
        font-size: 2rem;
        display:table-cell; 
      }
    }
  }
}
</style>