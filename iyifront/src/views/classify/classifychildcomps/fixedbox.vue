<template>
  <div>
    <div class="fixedbox" @click="gotop"></div>
  </div>
</template>

<script>
export default {
  methods: {
    gotop(){
      scrollTo(0,0);
    }
  }
}
</script>

<style>
  .fixedbox{
    width: 50px;
    height: 50px;
    text-align: center;
    font-size: 18px;
    position: fixed;
    bottom: 10px;
    right: 10px;
    background-image: url("../../../assets/img/gotopm.png");
    background-size: 40px;
    background-repeat: no-repeat;
    background-position-x: center;
    background-position-y: center;
    background-color: rgba(0, 0, 0, 0);
  }
</style>