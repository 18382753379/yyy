const Service = require('egg').Service;

class GoodsService extends Service {

  //段发钰-根据商品ID获取goods表中的所有数据
  async getDetailS(obj) {
    let gid = obj.gid;
    let getDetailSql = "select *  from goods where id=?"
    let result = await this.app.mysql.query(getDetailSql, gid);
    return result;
  }
  // addcarS 传入了数量和gid
  async addcarS(obj) {
    // let gid = obj.gid;
    // let getDetailSql = "select *  from goods where id=?"
    // let result = await this.app.mysql.query(getDetailSql, gid);
    // return result;
    return obj
  }




  //宋宇-根据分类获取goods表中所有的数据渲染到页面
  async getAllClassify(classify) {
    let sql = "select * from goods where type like ?"
    let result = await this.app.mysql.query(sql, [classify]);
    return result;
  }
}

module.exports = GoodsService;