<template>
  <div id="shopcart">
    <div class="banner">
      我的购物车
      <span>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</span>
    </div>
    <el-table
      class="shopcart-table"
      ref="multipleTable"
      :data="shopcartData"
      tooltip-effect="dark"
      style="width: 100%"
      @selection-change="handleSelectionChange"
    >
      <el-table-column align="center" label="全选" type="selection" width="100">
      </el-table-column>
      <el-table-column prop="img" width="150">
        <template slot-scope="scope">
          <el-image
            style="width: 100px; height: 100px"
            :src="scope.row.cover"
            :fit="fit"
          ></el-image>
        </template>
      </el-table-column>
      <el-table-column
        prop="name"
        label="商品名称"
        width="300"
        show-overflow-tooltip
      ></el-table-column>
      <el-table-column
        prop="price"
        label="单价"
        header-align="center"
        align="center"
      >
        <template slot-scope="scope">￥ {{ scope.row.price }}</template>
      </el-table-column>
      <el-table-column label="数量" header-align="center" align="center">
        <template slot-scope="scope">
          <el-input-number
            size="mini"
            v-model="scope.row.count"
            @change="handleChange"
            :min="1"
            :max="10"
            label="描述文字"
          >
          </el-input-number>
        </template>
      </el-table-column>
      <el-table-column
        prop="subtotal"
        label="小计"
        header-align="center"
        align="center"
        width="250"
      >
        <template slot-scope="scope"
          >￥ {{ scope.row.count * scope.row.price }}</template
        >
      </el-table-column>
      <el-table-column
        width="120"
        label="操作"
        header-align="center"
        align="center"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >删除</el-button
          >
        </template>
      </el-table-column>
    </el-table>

    <CartBar
      :multipleSelection="multipleSelection"
      :shopcartData="shopcartData"
      :isFixed="isFixed"
    ></CartBar>
  </div>
</template>

<script>
import CartBar from "./shopcartchildcomps/cartbar.vue";
export default {
  data() {
    return {
      num: 1,
      fit: "cover",
      isFixed: false,
      shopcartData: [],
      multipleSelection: [],
    };
  },
  created(){
     this.$http
     .get('/getCartData',{
       params:{
         id:1
       }
     })
     .then(res=>{
       this.shopcartData = res.data;
     })
     .catch(err=>{
       console.log(err);
     })
    // this.shopcartData = 
  },
  mounted() {

    //滚动事件，判断总计栏是否fixed
    window.addEventListener(
      "scroll",
      () => {
          let cart = document.querySelector("#shopcart");
          let cartBottom;
        if (this.isFixed) {
           cartBottom = cart.getBoundingClientRect().bottom+115;
        } else {
          cartBottom = cart.getBoundingClientRect().bottom;
        }
        if (cartBottom < window.innerHeight) {
            this.isFixed = false;
          } else {
            this.isFixed = true;
          }
      },
      true
    );

    //获取bar的底部距离显示页面顶部的距离
  },
  methods: {
    handleSelectionChange(val) {
      //复选框的点击
      this.multipleSelection = val;
    },
    handleChange(value) {
      //计数器
    },
    //单个删除按钮
    handleDelete(index, row) {
      //先弹出提示框，是否确认删除
      this.deleteThis(index);
    },
    deleteThis(index) {
      this.$confirm("您确定要删除该商品么?", "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(() => {
          this.$message({
            type: "success",
            message: "删除成功!",
          });
          //先清除数组中的对应数据
          this.shopcartData.splice(index, 1);
          //再去数据库里删
        })
        .catch(() => {
          this.$message({
            type: "info",
            message: "已取消删除",
          });
        });
    },
  },
  components: {
    CartBar,
  },
};
</script>
<style>
body {
  height: 2000px;
}
#shopcart {
  width: 88%;
  min-width: 1250px;
  margin: 0 auto;
  background-color: #f5f5f5;
}
#shopcart .banner {
  box-sizing: border-box;
  padding-left: 160px;
  padding-top: 20px;
  width: 100%;
  height: 100px;
  border-bottom: 2px solid orangered;
  background-color: #fff;
  line-height: 70px;
  font-size: 32px;
  color: #333;
}
#shopcart .banner span {
  font-size: 12px;
  color: slategray;
}
#shopcart .el-checkbox__inner {
  width: 20px;
  height: 20px;
}

#shopcart .shopcart-table {
  /* margin-top: 50px; */
  margin-bottom: 50px;
  box-shadow: 0 0 16px -3px rgba(0, 0, 0, 0.1);
}

/* tbody-样式 */
.el-table__header-wrapper .has-gutter {
  padding: 10px 0;
  font-weight: normal;
  color: #606266;
}

.el-checkbox__input.is-indeterminate .el-checkbox__inner::before {
  content: "";
  position: absolute;
  display: block;
  background-color: #fff;
  height: 5px;
  transform: scale(0.5);
  left: 0;
  right: 0;
  top: 7px;
}

.el-checkbox__inner::after {
  box-sizing: content-box;
  content: "";
  border: 2px solid #fff;
  border-left: 0;
  border-top: 0;
  height: 12px;
  left: 6px;
  position: absolute;
  top: 0;
  transform: rotate(45deg) scaleY(0);
  width: 5px;
}

.el-input-number--mini {
  width: 130px;
  line-height: 34px;
}

.el-input--mini .el-input__inner {
  height: 36px;
  line-height: 36px;
}

.el-input-number--mini .el-input__inner {
  padding-left: 28px;
  padding-right: 28px;
}

[class^="el-icon-"] {
  font-weight: bold;
}

.el-input-number--mini .el-input-number__increase [class*="el-icon"] {
  transform: scale(0.9);
}

/* 全选按钮字段 */
.el-table__header-wrapper .el-table_1_column_1 .el-checkbox::before {
  content: "多选";
  position: absolute;
  top: 0;
  left: 30px;
  font-weight: bold;
  /* font-size: 14px; */
}

.el-table_1_column_5 .el-input__inner {
  font-size: 14px;
}

.el-table__body-wrapper .el-table__row {
  font-size: 16px;
  color: #424242;
  font-weight: 600;
  padding: 0 20px;
}

/* tbody-小计列样式 */
.el-table__body .el-table_1_column_6 {
  color: orangered;
}

/* tbody-商品名称列样式 */
.el-table__body .el-table_1_column_3 {
  font-weight: normal;
}

/* 删除商品弹框 */
.el-message-box .el-message-box__header {
  text-align: center;
  font-weight: bold;
}

.el-message-box .el-message-box__content {
  margin: 30px 50px 50px;
  font-size: 18px;
  color: #606266;
}

.el-message-box .el-message-box__btns {
  text-align: center;
}

.el-message-box__status + .el-message-box__message {
  padding-left: 40px;
}

.el-message-box__content {
  padding-left: 34px;
}
</style>
// [
      //   {
      //     id: 1,
      //     name: "王小虎",
      //     price: 9999,
      //     num: 1,
      //     url:
      //       "https://dss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1950985649.jpg",
      //   },
      //   {
      //     id: 2,
      //     name: "手机",
      //     price: 1999,
      //     num: 1,
      //     url:
      //       "https://dss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1950985651.jpg",
      //   },
      //   {
      //     id: 3,
      //     name: "手机",
      //     price: 1999,
      //     num: 1,
      //     url:
      //       "https://dss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1950985651.jpg",
      //   },
      //   {
      //     id: 4,
      //     name: "手机",
      //     price: 1999,
      //     num: 1,
      //     url:
      //       "https://dss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1950985651.jpg",
      //   },
      //   {
      //     id: 5,
      //     name: "手机",
      //     price: 1999,
      //     num: 1,
      //     url:
      //       "https://dss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1950985651.jpg",
      //   },
      //   {
      //     id: 6,
      //     name: "手机",
      //     price: 1999,
      //     num: 1,
      //     url:
      //       "https://dss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1950985651.jpg",
      //   },
      //   {
      //     id: 7,
      //     name: "手机",
      //     price: 1999,
      //     num: 1,
      //     url:
      //       "https://dss2.bdstatic.com/8_V1bjqh_Q23odCf/pacific/1950985651.jpg",
      //   },
      // ]