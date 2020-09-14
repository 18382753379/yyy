<template>
	<!-- 按功能展示 -->
	<div class="head">
		<!-- 不同排序显示不同数据 -->
		<el-menu :default-active="activeIndex2" class="el-menu-demo" mode="horizontal" @click.native="mode" background-color="#545c64"
		 text-color="#fff" active-text-color="#ffd04b">
			<el-menu-item index="1">综合排序</el-menu-item>
			<el-menu-item index="1">销量</el-menu-item>
			<el-menu-item index="1">价格</el-menu-item>
		</el-menu>
	</div>
</template>

<script>
	import bus from "../../../bus/bus.js"
	export default {
		data() {
			return {
				activeIndex: '1',
				activeIndex2: '1',
				kw: "", //存放搜索框那边传过来的搜索值
				page:"",//当前页
			}
		},
		methods: {
			// 根据不同排序方式来显示商品
			mode(e) {
				let kws = this.kw;
				let page = this.page
				let text = e.target.innerHTML
				switch (text) {
					case "综合排序":
						this.$http.get("/searchorderbysyn", {
							params: {
								kw: kws,
								page:page,
							}
						}).then((r) => {
							bus.$emit("bysyn",r.data)
						})
						break;
					case "销量":
						this.$http.get("/searchorderbysale", {
							params: {
								kw: kws,
								page:page
							}
						}).then((r) => {
							bus.$emit("bysale",r.data)
						})
						break;
					case "价格":
						this.$http.get("/searchorderbyprice", {
							params: {
								kw: kws,
								page:page
							}
						}).then((r) => {
							bus.$emit("byprice",r.data)
						})
						break;
				}
			}
		},
		created() {
			bus.$on("searchkw", (val) => {
				this.kw = val;
			})//把用户传入的关键字传过来
			bus.$on("getpage",(val)=>{
				this.page = val;
			})//把页码过来
		}
	}
</script>

<style>
	.mode {
		width: 74%;
		height: 40px;
	}

	.mode span {
		line-height: 40px;
		padding: 0 20px;
	}
</style>
