<script>
import anime from 'animejs/lib/anime.es.js'

export default {
  data: function () {
    return {
      isShown: false,
      name: 'ユーザーメニュー',
      items: [
        'プロフィール編集',
        'ログアウト',
        '経験談投稿',
        '過去投稿記事',
        '新規登録',
        'ログイン',
      ]
    }
  },

  template:`
    <div @mouseleave="isShown = false">
      <ul @mouseover="isShown = true">
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
          <li v-for="item in items" :key="item">
            <a href="#" class="menu-item">{{item}}</a>
          </li>
        </ul>
      </transition>
    </div>
  `,

  methods: {
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
  font-size: 14px;
  .menu {
  width: 150px;
  text-decoration: none;
  color: #000;
  border: solid 1px #6666cc;
  display: block;
  height: 30px;
  line-height: 30px;
  text-align: center;  
  }
  .menu-item {
    width: 150px;
    text-decoration: none;
    background-color: #CCCCFF;
    color: #000;
    border: solid 1px #6666CC;
    border-top: none;
    display: block;
    height: 30px;
    line-height: 30px;
    text-align: center;
  }
}
</style>