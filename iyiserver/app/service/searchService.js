const Service =require('egg').Service;

class SearchService extends Service{
   //刘俊良  根据条件查找相应商品
    async showGood(kw,page){
        //查询相关商品
		let curpage=page*2;
		let sql = "select * from goods where descp like ? or name like ? limit ?,2"
        let res=await this.ctx.app.mysql.query(sql,['%'+kw+'%','%'+kw+'%',curpage])
		return res;
	}
	//综合排序   综合排序
	async searchorderbysyn(kw,page){
	    //查询相关商品
		let curpage=(page-1)*2
		let sql = "select * from goods where descp like ? or name like ? order by desimg limit ?,2"
	    let res=await this.ctx.app.mysql.query(sql,['%'+kw+'%','%'+kw+'%',curpage])
		return res;
	}
	//综合排序   销量
	async searchorderbysale(kw,page){
	    //查询相关商品
		let curpage=(page-1)*2
		let sql = "select * from goods where descp like ? or name like ? order by sales limit ?,2"
	    let res=await this.ctx.app.mysql.query(sql,['%'+kw+'%','%'+kw+'%',curpage])
		console.log(res)
		return res;
	}
	//综合排序   价格
	async searchorderbyprice(kw,page){
	    //查询相关商品
		let curpage=(page-1)*2
		let sql = "select * from goods where descp like ? or name like ? order by price limit ?,2"
	    let res=await this.ctx.app.mysql.query(sql,['%'+kw+'%','%'+kw+'%',curpage])
		return res;
	}
}

module.exports=SearchService;