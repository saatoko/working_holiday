<template>
  <div class="navbar">
    <div class="navbar__block clearfix">
      <h1 class="country-choose">仮)情報の欲しい国を選択してください。</h1>
      <ul class="icons">
        <li class="icons__first">
          <v-fa icon="plane-departure"></v-fa>
        </li>
        <li class="icons__second">
          <v-fa icon="envelope-open-text"></v-fa>
        </li>
        <li class="icons__third">
          <router-link :to="{name: 'siteguide'}">
            <v-fa icon="info-circle" class="iconcircle"></v-fa>
          </router-link>
        </li>
        <li class="icons__fourth">
          <UserPullDownMenu></UserPullDownMenu>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import UserPullDownMenu from "./UserPullDownMenu.vue";
export default {
  data: function () {
    return {
    }
  },
  components: { UserPullDownMenu },
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
      color: #6666cc;
    }
    .icons{
      text-align: right;
      float: right;
      width: 40%;
      color: rgb(170, 158, 47);
      height: 100%;
      display:table; 
      table-layout: fixed;
      ul.icons, li{
        font-size: 2rem;
        display:table-cell; 
        text-align: right;
        .iconcircle {
          color: rgb(170, 158, 47);
        }
      }
    }
  }
}
</style>