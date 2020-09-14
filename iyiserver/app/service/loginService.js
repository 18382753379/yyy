const Service =require('egg').Service;

class LoginService extends Service{
   //朱思霖-用户登录
    async userLogin(username,password){
        //查询账户名
        let r1=await this.ctx.app.mysql.query(`select * from user where username=?`,[username])
        //如果没有这个账户名，返回账户不存在
        if(r1.length==0){
            return {
                code:0,
                msg:"账户不存在"
            }
        }else{
            let r2=await this.ctx.app.mysql.query(`select id,username,headimg from user where username=? and password=?`,[username,password])
            console.log(r2)
            if(r2.length==0){
                return {
                    code:1,
                    msg:"密码错误"
                }
            }else{
                return{
                    code:2,
                    msg:"登录成功",
                    user:r2
                }
            }
        }
    }

    
    //朱思霖-用户注册的时候验证用户名是否已经存在
    async checkUserName(username){
        let sql="select * from user where username=?";
        let r=await this.ctx.app.mysql.query(sql,[username])
        return r;
    }

    //朱思霖-用户注册的时候验证手机号是否已经存在
    async checkPhoneNum(phone){
        let sql="select * from user where phone=?";
        let r=await this.ctx.app.mysql.query(sql,[phone])
        return r;
    }
    //朱思霖-用户注册
    async userRegist(username,password,phone){
        let sql="insert into user(username,password,phone) values(?,?,?)";
        let r=await this.ctx.app.mysql.query(sql,[username,password,phone])
        return r.affectedRows;
    }







    // //管理员登录
    // async adminLogin(name,pwd){
    //     let sql="select id,name from admin where name=? and pwd=?";
    //     let r=await this.ctx.app.mysql.query(sql,[name,pwd])
    //     return r;
    // }

    // //验证注册的用户名是否已经存在
    // async isHaveUser(name){
    //     let sql="select name from user where name=?";
    //     let r=await this.ctx.app.mysql.query(sql,[name])
    //     return r;
    // }

    // //新用户注册
    // async userRegist(name,pwd){
    //     let sql="insert into user(name,pwd) values(?,?)";
    //     let r=await this.ctx.app.mysql.query(sql,[name,pwd])
    //     return r.affectedRows;
    // }
    // //判断点击音乐管理员登录时，该用户是不是管理员
    // async isAdmin(id,name){
    //     let sql="select id,name from admin where id=? and name=?";
    //     let r=await this.ctx.app.mysql.query(sql,[id,name])
    //     return r;
    // }
    //  //判断点击我的音乐的时候，是不是管理员在点
    //  async isUser(id,name){
    //     let sql="select id,name from user where id=? and name=?";
    //     let r=await this.ctx.app.mysql.query(sql,[id,name])
    //     return r;
    // }

}

module.exports=LoginService;