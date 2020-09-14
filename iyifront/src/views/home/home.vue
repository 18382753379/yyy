<!--  -->
<!--  -->
<template>
	<div class="home">
		<banner></banner>
		<!-- <div> -->

		<!-- 方便操作详情页 设置一个button按钮 -->
		<!-- <button @click='goosDetail(1)'>测试商品详情</button> -->
		<!-- 模仿界面 遍历商品数据列表 获取商品id 调用方法-->
		<!-- <div class='goods' v-for='(item,index) in goods' :key='index' @click='goosDetail(item.id)'> -->
		<!-- 商品展示 -->
		<!-- <div class='show'></div> -->
		<!-- </div> -->
		<!-- </div> -->
	</div>
</template>
<script>
	import banner from "./homechildcomps/banner.vue"
	
	export default {
		name: '',
		// 引入局部组件轮播图
		components: {
			banner
		},
		
		// 跳转详情页方法  根据gid（商品id）
		// methods: {
		// 	goosDetail(gid) {
		// 		console.log('123');
		// 		this.$router.push({
		// 			path: "/detail",
		// 			query: {
		// 				gid
		// 			}
		// 		});
		// 	}
		// }
	}
</script>

<style scoped>
	/* @import url(); 引入公共css类 */
	
</style>
