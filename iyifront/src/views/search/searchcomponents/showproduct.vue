<template>
	<!-- 商品展示 -->
	<div class="showClothes">
		<div class="showClothesbox" v-for="item in goodslist" :key="item.id" @click="showgoods(item.id)">
			<div class="shopClothes-img">
				<img :src="item.desimg" alt="">
			</div>
			<div class="shopClothes-des">
				<p class="clothes-name">{{item.name}}</p>
				<p class="clothes-des">{{item.desc}}</p>
				<div class="clothes-inf">
					<p class="clothes-pri">{{item.price}}</p>
					<p class="clothes-rest">{{item.rest}}</p>
				</div>
			</div>
		</div>
	</div>
</template>

<script>
	import bus from "../../../bus/bus.js"
	export default {
		data: function() {
			return {
				//暂时这么写 后面数据从数据库导入
				goodslist: [],
			}
		},
		methods: {
			showgoods(gid) {
				this.$router.push({path: "/detail", query:{gid}});//跳转路由并传出商品id
			}
		},
		created() {
			//接收通过搜索搜索出来的数据
			bus.$on("showproduct",(val)=>{
				this.goodslist=val;
			})//通过关键字搜索出来的数据
			bus.$on("bysyn",(val)=>{
				this.goodslist=val
			})//通过综合排序搜索出来的数据
			bus.$on("bysale",(val)=>{
				this.goodslist=val
			})//通过销量搜索出来的数据
			bus.$on("byprice",(val)=>{
				this.goodslist=val
			})//通过价格搜索出啦id数据
		}
	}
</script>

<style>
	.showClothes {
		width: 80%;
		display: flex;
		flex-wrap: wrap;
		justify-content: space-between;
	}

	.showClothesbox {
		/* width: 240px; */
		width: 20%;
		height: 310px;
		padding: 10px 13px;
		margin: 12px 0;
		background-color: #FFFFFF;
	}

	.showClothesbox img {
		width: 100%;
		height: 250px;
	}

	.shopClothes-des {
		text-align: center;
		color: #B0B0B0;
		height: 60px;
		position: relative;
	}

	.clothes-name {
		color: black;
		font-size: 14px;
	}

	.clothes-des {
		font-size: 12px;

	}

	.clothes-pri {
		font-size: 14px;
		color: red;
	}

	.clothes-rest {
		font-size: 12px;
	}

	.clothes-inf {}

	.clothes-rest {
		position: absolute;
		bottom: 0;
		right: 0;
	}
</style>
