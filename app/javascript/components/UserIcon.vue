<template lang="haml">
%ul{id: "user-pull"} 

</template>

<script>
import anime from "animejs"
// import anime from 'animejs/lib/anime.es.js'

export default {
  data: function () {
    return {
      el: '#user-pull',
      isShown: 'false',
      name: 'user-menu',
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
 
  template: `
    <li @mouseleave="isShown = false">
      <ul @mouseover="isShown = true"><v-fa{icon: "user"} class="menu"></v-fa></ul>

        // anime.js用
        <transition
          @before-enter="beforeEnter"
          @enter="enter"
          @leave="leave"
          :css="false"
        >

          <ul v-if="isShown">
            <li v-for="item in items" :key="item">
              <a href="#" class="menu-item">{{item}}</a>
            </li>
          </ul>
        </transition>
      </div>
  `,


  // render: function (){
  //   return {
  //     <div className='huga'>M</div>


      // <div
      //   on-mouseleave = {() => "isShown = false"}
      // @mouseleave="isShown = false">
        // <p @mouseover="isShown = true"><a href ="#" class="menu">{{name}}</a></p>
        // <transition
        //   @before-enter="beforeEnter"
        //   @enter="enter"
        //   @leave="leave"
        //   :css="false"
        // >
        //   <ul v-if="isShown">
        //     <li v-for="item in items" :key="item">
        //       <a href="#" class="menu-item">{{item}}</a>
        //     </li>
        //   </ul>
        // </transition>
      // </div>
  //   },
  // },

  method: {
    beforeEnter: function (el) {
      el.style.height = '0px'
      el.style.opacity = 0
    },
    enter: function (el,done) {
      anime({
        target: el,
        opacity: 1,
        height: el.scrollHeight + 'px',
        duration: 3000,
        compute: done
      })
    },
    leave: function (el,done) {
      anime({
        target: el,
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
div, ul, li {
  margin: 0;
  padding: 0;
}
ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  font-size: 14px;
}
div {
  width: 90px;
}

.menu {
  width: 980px;
  text-decoration: none;
  background-color: #9999FF;
  color: #000;
  border: solid 1px #6666cc;
  display: block;
  height: 30px;
  line-height: 30px;
  text-align: center;  

}
.menu-item {
  width: 90px;
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
</style>