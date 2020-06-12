<template>
<div v-on:mouseleave="isShown = false">
  <ul v-on:mouseover="isShown = true">
    <v-fa icon="user" class="user-icon">
    </v-fa>
  </ul>

  <transition
    v-on:before-enter="beforeEnter"
    v-on:enter="enter"
    v-on:leave="leave"
    :css="false"
  >
    <ul v-if="isShown" class="show-usermenu">
      <li class="menu">{{name}}
      </li>

      <li 
        v-for="(item, i) in items" 
        v-bind:key="`bad-sample_${i}`"
        @click="getCreateUrl(item.path)"
        >  
        <router-link :to="{label: item.path}" class="menu-item">{{item.label}}</router-link>
        <!-- <router-link :to="{ label: item.path, query: { url: thread.url, title: thread.title }}"> -->
        
      </li>
    </ul>
  </transition>
</div>  
</template>

<script>
import anime from 'animejs/lib/anime.es.js'

export default {
  data: function () {
    return {
      isShown: false,
      name: 'ユーザーメニュー',
      items: [
        // { label: 'プロフィール編集', path: '#' },
        { label: 'ログアウト', path: 'signout' },
        // { label: '経験談投稿', path: '#' },
        // { label: '過去投稿記事', path: '#' },
        { label: '新規登録', path: 'signup' },
        { label: 'ログイン', path: 'signin' },
      ],
    }
  },

  methods: {
    getCreateUrl(path) {
      if (this.$router.path !== { path: this.currentRoutePath }) {
        this.$router.push(path)
      }

      // this.$router.push(path)

      // location.href=`${path}`
    },
    
    beforeEnter: function (el) {
      el.style.height = '0px'
      el.style.opacity = '0'
    },
    enter: function (el,done) {
      anime({
        targets: el,
        opacity: 1,
        height: el.scrollHeight + 'px',
        duration: 3000,
        complete: done
      })
    },
    leave: function (el, done) {
      anime({
        targets: el,
        opacity: 0,
        height: '0px',
        duration: 3000,
        complete: done
      })
    }
  }
};
</script>

<style scoped lang="scss" scoped>
div, ul, li, p, .user-icon{
  margin: 0;
  padding: 0;
}
.user-icon {
  font-size: 2rem;
}

.show-usermenu {
  list-style-type: none;
  margin: 0;
  padding: 0;
  font-size: 0.7rem;
  position: absolute;
  z-index: 1;
  width: auto;
  .menu {
    padding: 0 1rem;
    width: auto;
    text-decoration: none;
    color: #000;
    border: solid 1px #6666cc;
    display: block;
    height: 30px;
    line-height: 30px;
    text-align: center;  
    background-color: #d1d1ff;
    font-weight: bold;
  }
  .menu-item {
    padding: 0 1rem;
    text-decoration: none;
    background-color: #fff;
    color: #000;
    border: solid 1px #6666cc;
    border-top: none;
    display: block;
    height: 30px;
    line-height: 30px;
    text-align: center;
  }
}
</style>