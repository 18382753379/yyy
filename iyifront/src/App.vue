<!--  -->
<template>
  <div>
    <div>
      <!-- 顶部导航栏，跳转路由 -->
      <topbar></topbar>
      <!-- 路由出口 -->
      <router-view></router-view>
      <!-- 登录注册弹框 -->
      <loginorregist></loginorregist>

    </div>

  </div>
</template>


<script>
  import topbar from "./components/topbar/topbar.vue";
  import loginorregist from "./views/loginorregist/loginorregist.vue"
  export default {
    name: '',
    components: {
      topbar,
      loginorregist
    },
    data() {
      //这里存放数据
      return {

      };
    },
  }
</script>


<style scoped>
  /* @import url(); 引入公共css类 */
</style>