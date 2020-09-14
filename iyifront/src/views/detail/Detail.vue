<!--  -->
<template>
  <div class='detail w'>
    <!-- 详情页面导航部分 -->
    <detailTop></detailTop>

    <!-- 详情页面中间部分 -->
    <detailCon></detailCon>
  </div>
</template>
<script>
// _detailtop前面需加下划线
import detailTop from './detailchildcomps/DetailTop.vue'
import detailCon from './detailchildcomps/DetailCon.vue'
export default {
  name: 'detail',
  components: {
    detailTop,
    detailCon
  },
  data() {
    return {
    }
  }
}
</script>

<style scoped>
</style>
