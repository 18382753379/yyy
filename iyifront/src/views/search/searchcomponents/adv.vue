<template>
	<!-- 右侧广告页 -->
	<div class="adv">
		<h2>热卖</h2>
		<div class="hot">
			<img src="https://img.alicdn.com/imgextra/i1/125789635/O1CN01hsWgvL2L2sgGUXF0b_!!0-saturn_solar.jpg_270x270.jpg" alt="">
			<div>
				<span class="price">￥199</span>
				<span class="hot num">销量：200</span>
			</div>
		</div>
	
		
	</div>
</template>

<script>
	export default {
		data(){
			return {
				advlist:[],//右侧广告栏
			}
		},
		// created(){
		// 	this.$http.get("/advsale")
		// 	.then((r)=>{
		// 		console.log("访问成功")
		// 	})
		// 	.catch((e)=>{
		// 		console.log("访问失败")
		// 	})
		// }
	}
</script>

<style>
	.adv {
		position: absolute;
		right: 0;
		top: 72px;
		width: 20%;
		height: auto;
		background-color: #ff9ee1;
	}
	.hot{
		border: 2px solid #C0C4CC;
	}
	.hot .price{
		font-size: 20px;
	}
	.hot img{
		width: 100%;
	}
	.hot .num{
		color: white;
		display: inline-block;
		position: absolute;
		right: 0;
	}
</style>
