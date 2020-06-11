<template>
  <div class="footer">
    <div class="footer__block ">
      <h1 class="footer__block--text">
        <p class="years-now">{{ new Date() | moment() }}現在</p>
        <p class="partner-now">ワーキングホリデー協定国数 〇〇カ国</p>
      </h1>
    </div>
  </div>
</template>

<script>
import moment from "moment";
export default {
  data: function () {
    return {
    }
  },
  filters: {
    moment: function (date){
      return moment(date).format('YYYY/MM');
    }
  }
}
</script>

<style scoped lang="scss" scoped>
.footer {
  width: 100%;
  height: auto;
  background-color: rgb(53, 83, 167);
  &__block {
    width: 80%;
    margin: 0 auto;
    height: 100%;
    &--text {
      color: #fff;
      text-align: left;
      font-family: ヒラギノ丸ゴ ProN;
      padding: 0.5rem 0;
      font-size: 0.7rem;
      letter-spacing: 0.5rem;
      display: -webkit-flex;
      display: flex;
      justify-content: flex-end;
      align-items: center;
      // .years-now {
       
      // }
      .partner-now {
        padding-left: 2.5rem;
      }
    }
  }
}
</style>