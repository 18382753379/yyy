<!--  -->
<template>
	<div class="nav-box">
		<div class="topnav">
			<div class="logo">
				<img src="../../assets/img/i.png" alt="">
				<img src="../../assets/img/Y.png" alt="">
				<img src="../../assets/img/i.png" alt="">
			</div>
			<router-link to='/home' tag="button">首页</router-link>

			<router-link to='/classify/male' tag="button">男装</router-link>

			<router-link to='/classify/female' tag="button">女装</router-link>


			<div class="search">
				<input type="text" class="search-input" v-model.layz="kw">
				<router-link to="/search" tag="button" @click.native="search">搜索</router-link>
			</div>


			<router-link to='/shopcart' tag="button">购物车</router-link>

			<button type="button" @click="login" v-if='!isLogin'>登录</button>
			<div v-else class="logout">
				<p>欢迎你:</p>
				<p>{{userInfo.username}}</p><img :src="userInfo.headimg">
				<button type="button" @click="logout">注销</button>
			</div>

		</div>
	</div>
</template>


<script>
	import bus from "../../bus/bus.js"
	export default {
		name: '',
		components: {},
		data() {
			//这里存放数据
			return {
				isLogin: false,
				userInfo: {},
				kw: "", //搜索的关键字
				page:"",
			};
		},
		created() {
			// 检查有没有localstroage
			if (JSON.parse(localStorage.getItem("user"))) {
				this.isLogin = true;
				this.userInfo = JSON.parse(localStorage.getItem("user"))[0];
			} else {
				this.isLogin = false;
				this.userInfo = {}
			}


			bus.$on("successLogin", () => {
				//如果登录成功就切换登录和注销的组件
				this.isLogin = true;
				this.userInfo = JSON.parse(localStorage.getItem("user"))[0];
			})

			//通过页码组件得到当前页码
			bus.$on("getpage",(val) => {
				this.page = val
			})

		},
		methods: {
			login() {
				bus.$emit("showbox") //这个指令可以打开登录窗口
			},
			logout() {
				localStorage.removeItem("user")
				this.isLogin = false;
				this.userInfo = {}
			},
			// 通过得到的页码查询数据
			search() {
				let kw = this.kw
				let page = this.page
				this.$http.get('/showproduct', {
						params: {
							kw: kw,
							page: page
						}
					})
					.then((r) => {
						bus.$emit("showproduct", r.data)
						bus.$emit("searchkw", kw)
					})
					.catch((e) => {
						console.log("请求出错")
					})
			}

		},
	}
</script>


<style scoped>
	/* @import url(); 引入公共css类 */
	.nav-box {
		width: 100%;
		height: 60px;
		line-height: 60px;
		font-size: 18px;
	}

	button {
		background-color: transparent;
		border: none;
		outline: none;
		border-radius: 5px;
		height: 60px;
		width: 60px;
	}

	button:hover {
		background-color: whitesmoke;
		cursor: pointer;
	}

	.topnav {
		width: 1246px;
		margin: 0 auto;
		display: flex;
		justify-content: space-around;
		align-items: center;
	}

	.logout {
		display: flex;
		align-items: center;
	}

	.logout img {
		width: 40px;
		height: 40px;
		border-radius: 50%;
	}

	.logo {
		width: 400px;
		display: flex;
	}

	.logo img {
		width: 50px;
		height: 50px;
	}

	.search-input {
		height: 35px;
		padding-left: 10px;
	}
</style>
