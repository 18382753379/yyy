<template>
	<div class="banner">
		<!-- 使用element ui的走马灯标签 -->
		<el-carousel :interval="3000" arrow="hover" height="600px" >
			<el-carousel-item v-for="item in banners" :key="item.id">
				<img :src="item.imgsrc"/>
			</el-carousel-item>
		</el-carousel>
	</div>
</template>

<script>
	export default {
		data: function() {
			return {
				banners: [],
				// goods: [],
			}
		},

		created() {
			// 向数据库请求轮播图图片
			this.$http.get("/getBanner", {

			}).then(res => {
				this.banners=res.data
			})
		},
		mounted() {

		},
		watch: {

		},

	}
</script>

<style scoped="scoped">
	.banner {
		cursor: pointer;
		width: 100%;
		height: 600px;
	}
	/* 设置轮播图样式 */

	.el-carousel__item img {
		width: 100%;
		height: 100%;
		opacity: 0.8;
	}

	.el-carousel__item:nth-child(2n) {
		background-color: #99a9bf;
	}

	.el-carousel__item:nth-child(2n+1) {
		background-color: #d3dce6;
	}
</style>
