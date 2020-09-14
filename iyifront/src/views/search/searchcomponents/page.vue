<template>
	<!-- 分页 -->
	<div class="page">
		<el-pagination 
		background layout="prev, pager, next" 
		:total="20" 
		:current-page="pagenum" 
		:page-size="1"
		 @current-change="handleCurrentChange">
		</el-pagination>
	</div>

</template>

<script>
	import bus from "../../../bus/bus.js"
	export default {
		data(){
			return {
				pagenum:1,
			}
		},
		methods:{
			handleCurrentChange(val) {
				this.pagenum=val;
				bus.$emit("getpage",this.pagenum)//把页码传到mode.vue
			},
		}
	}
</script>

<style>


</style>
