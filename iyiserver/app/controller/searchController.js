const Controller = require('egg').Controller;


class SearchController extends Controller {
    //刘俊良  查询满足条件的商品
    async showGoods() {
		let kw = this.ctx.request.query.kw
		let page = this.ctx.request.query.page
        let r = await this.service.searchService.showGood(kw,page);
        this.ctx.response.body = r;
    }
	
	//综合排序
	async searchorderbysyn() {
		let kw = this.ctx.request.query.kw
		let page = this.ctx.request.query.page
	    let r = await this.service.searchService.searchorderbysyn(kw,page);
	    this.ctx.response.body = r;
	}
	// 按销量排序
	async searchorderbysale() {
		let kw = this.ctx.request.query.kw
		let page = this.ctx.request.query.page
	    let r = await this.service.searchService.searchorderbysale(kw,page);
	    this.ctx.response.body = r;
	}
	// 按价格排序
	async searchorderbyprice() {
		let kw = this.ctx.request.query.kw
		let page = this.ctx.request.query.page
	    let r = await this.service.searchService.searchorderbyprice(kw,page);
	    this.ctx.response.body = r;
	}
};

module.exports = SearchController