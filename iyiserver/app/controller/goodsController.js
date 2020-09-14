const Controller = require('egg').Controller;


class GoodsController extends Controller {
  //段发钰-根据商品ID获取goods表中的所有数据
  async getDetailC() {
    let obj = this.ctx.request.query;
    let result = await this.ctx.service.goodsService.getDetailS(obj);
    this.ctx.response.body = result;
  }
   // addcarC加入购物车
   async addcarC() {
    let obj = this.ctx.request.query;
    let result = await this.ctx.service.goodsService.addcarS(obj);
    this.ctx.response.body = result;
  }





  //宋宇-根据分类获取goods表中所有的数据渲染到页面
  async getAllClassify() {
    let classify = this.ctx.request.query.classify;
    let result = await this.ctx.service.goodsService.getAllClassify(classify);
    this.ctx.response.body = result;
  }

};

module.exports = GoodsController