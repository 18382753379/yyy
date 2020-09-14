<!--  -->
<template>
  <div class="content">
	
	<!-- 排序方式/销量/价格 -->
	<mode></mode>
	<!-- 商品显示 -->
	<showproduct></showproduct>
	<!-- 切换页码 -->
	<page></page>
	
	<adv></adv>
  </div>
</template>


<script>
	import showproduct from "./searchcomponents/showproduct.vue"
	import mode from "./searchcomponents/mode.vue"
	import page from "./searchcomponents/page.vue"
	import adv from "./searchcomponents/adv.vue"
	
  export default {
    name: '',
    components: {showproduct,mode,page,adv},
    data() {
      //这里存放数据
      return {
			
      };
    },
	created(){
	
	}
  }
</script>


<style scoped>
  /* @import url(); 引入公共css类 */
  body{
	  background-color: #ccc;
  }
  .content{
	  width: 80%;
	  height: auto;
	  margin: 0 auto;
	  /* background-color: red; */
	  position: relative;
  }
</style>