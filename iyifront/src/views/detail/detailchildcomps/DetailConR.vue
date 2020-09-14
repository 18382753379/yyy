<template>
  <div class='property'>
    <div class='property-hd'>
      <h2>{{goodsDtail.name}}</h2>
      <div class='desc'>{{goodsDtail.desc}}</div>
      <div class='price'>
        <p class='red'>
          ￥{{goodsDtail.price}}
          <span class='buy'>最后疯抢</span>
        </p>
        <p class='coupon'>
          <span>优惠券</span>
          <a href>满200减15</a>
          <a href>满300减30</a>
          <a href>更多</a>
        </p>
      </div>
      <div class='support'>
        <p>
          <span>支持</span>
          <span>花呗分期</span>
          <span class='iconfont icon-wancheng'></span>
          <span>顺丰发货</span>
          <span class='iconfont icon-wancheng'></span>
          <span>七天无理由退货</span>
          <span class='iconfont icon-wancheng'></span>
        </p>
      </div>
      <p>
        <span>配送服务</span>&nbsp;
        新会员专享首单满38元免邮
      </p>
      <p class='size'>
        <span>尺码</span>&nbsp;
        <button :class="{'active': index === isActive}" v-for='(item, index) in size' :key='index'
          @mouseenter="enterSize(index)" @click='clickSize(index)'>{{item}}</button>
        <!-- <button>M</button>
        <button>L</button>
        <button>XL</button>-->
      </p>
      <p class='btn'>
        <span>数量</span>&nbsp;
        <span class='btnmum'>
          <button @click='sub'>-</button>
          <span class='num'>{{num}}</span>
          <button @click='add'>+</button>
        </span>
      </p>
      <div class='addCart'>
        <!-- 	el-icon-shopping-cart-2 -->
        <!-- *********************点击加入购物车*************************** -->
        <div @click='addCar'>
          <i class='el-icon-shopping-cart-2'></i>
          加入购物车
        </div>
      </div>
    </div>
    <div class='property-serve'>
      <div class='human'>
        <span class='iconfont icon-kefu'></span>
        <a href>商城客服</a>
        <p>
          本商品由&nbsp;
          <i>IYI购</i>&nbsp;负责发货并提供售后服务
        </p>
      </div>
    </div>
  </div>
</template>

<script>
  import bus from "../../../bus/bus"
  export default {
    data() {
      return {
        size: ['S', 'M', 'L', 'XL'],
        value: '',
        num: 1,
        isActive: 0
      }
    },

    props: [
      'goodsDtail',
    ],

    methods: {
      tijao() {
        var gid = this.$route.query.gid;
        console.log(this.value);
        this.flag = false;
        // console.log(arguments[0].data.src)
        var url3 = `http://localhost:7001/detailpl`;
        console.log(this.arguments)
        axios
          .post(
            url3, {
              img: this.arguments,
              score: this.value,
              gid: gid,
              comments: this.msg
            }, {
              withCredentials: true
            }
          )
          .then(res => {
            console.log(res);
            // console.log(res.data)
            if (res.data.code == 200) {
              alert("添加成功！");
              this.$router.go(0)
              // this.$router.push({
              // 	path: `/login?from:this.$route.path`,

              // })
            } else if (res.data.code == 300) {
              alert("添加失败！");
            }
          });

        console.log(this.$route.path);
      },
      // 数量加减
      add() {
        this.num++;
        this.$store.commit("changeNum", this.num);
        console.log(this.$store.state.num);
      },
      sub() {
        this.num--;
        if (this.num < 0) {
          this.num = 0;
        }
        this.$store.commit("changeNum", this.num);
        console.log(this.$store.state.num);
      },
      // 鼠标移进sizeButton
      enterSize(index) {
        this.isActive = index
        console.log(index)
      },
      clickSize(index) {
        this.isActive = index
      },
      // 加入购物车
      addCar() {
        if (JSON.parse(localStorage.getItem("user")) === null) {
          alert("没有登录，请登录！");
          bus.$emit("showbox");
        } else {
          let num = this.num;
          let gid = this.$route.query.gid
          let url = `/addcar`;
          this.$http
            .post(
              url, {
                num,
                gid
              },
            ).then(res => {
              console.log(res.data);
            });
        }

      }
    },
    mounted() {
      console.log(this.$store.state.num);
      this.num = this.$store.state.num;
    },
    computed: {
      input: {
        get() {
          return this.$store.state.num
        },
        set(val) {
          this.$store.commit("changeNum", val)
        }

      }
    },
  }
</script>

<style scoped>
  .active {
    border: 3px solid #52bfff;
  }

  .property {
    float: left;
  }

  /* 右边框内部 */
  .property-hd {
    width: 100%;
  }

  .desc {
    height: 100px;
    font-size: 30px;
    /* background-color: red; */
  }

  .price {
    margin-top: 10px;
    height: 100px;
    background-color: lightblue;
  }

  .property-hd .buy {
    display: block;
    float: right;
    font-size: 30px;
    color: red;
  }

  .coupon a {
    margin: 0 10px;
  }

  .price p:first-child {
    font-size: 40px;
  }

  .property-hd span {
    color: gray;
  }

  /* 支持 */
  .support span {
    margin: 0 5px;
  }

  /* 大小 */
  .size button {
    width: 80px;
    height: 40px;
    margin: 0 5px;
    cursor: pointer;
  }

  .btn {
    margin: 10px 0;
    display: inline-block;

  }

  .btnmum {
    display: inline-block;
    width: 160px;
    height: 49px;
    background-color: #ccc;
    position: relative;
    border: 2px solid #ccc;
  }

  .btnmum button {
    height: 49px;
    width: 50px;
    border: none;
    cursor: pointer;
  }

  .num {
    display: inline-block;
    width: 60px;
    text-align: center;
    /* background-color: red; */
  }

  .addCart {
    cursor: pointer;
  }

  .addCart {
    width: 300px;
    height: 48px;
    border: 1px solid #52bfff;
    vertical-align: top;
    background-color: #52bfff;
    color: white;
    text-align: center;
    font-size: 26px;
  }

  .property-serve {
    color: #52bfff;
    font-weight: 700;
    /* height: 160px; */
    /* background-color: pink; */
  }
</style>