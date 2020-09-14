const Controller = require('egg').Controller;

class LoginController extends Controller {

    //朱思霖-用户登录
    async userLogin() {
        let username = this.ctx.request.body.username;
        let password = this.ctx.request.body.password;
        let r = await this.service.loginService.userLogin(username, password);
        this.ctx.response.body = r;
    }
    //朱思霖-用户注册的时候验证用户名是否已经存在
    async checkUserName() {
        let username = this.ctx.request.body.username;
        let r = await this.service.loginService.checkUserName(username);
        this.ctx.response.body = r;
    }
    //朱思霖-用户注册的时候验证手机号是否已经存在
    async checkPhoneNum() {
        let phone = this.ctx.request.body.phone;
        let r = await this.service.loginService.checkPhoneNum(phone);
        this.ctx.response.body = r;
    }
     //朱思霖-用户注册
     async userRegist() {
        let username = this.ctx.request.body.username;
        let password = this.ctx.request.body.password;
        let phone = this.ctx.request.body.phone;
        let r = await this.service.loginService.userRegist(username,password,phone);
        this.ctx.response.body = r;
    }



    // //管理员登录
    // async adminLogin(){
    //     let name=this.ctx.request.body.loginName;
    //     let pwd=this.ctx.request.body.loginPwd;
    //     let r=await this.service.loginService.adminLogin(name,pwd);
    //     this.ctx.response.body=r;
    // }

    // //验证注册的用户名是否已经存在
    // async isHaveUser(){
    //     let name=this.ctx.request.body.registName;
    //     let r=await this.service.loginService.isHaveUser(name);
    //     this.ctx.response.body=r;
    // }

    // //新用户注册
    // async userRegist(){
    //     let name=this.ctx.request.body.registName;
    //     let pwd=this.ctx.request.body.registPwd;
    //     let r=await this.service.loginService.userRegist(name,pwd);
    //     this.ctx.response.body=r;
    // }


}

module.exports = LoginController;