<template>
  <div id="cart-bar" :class="{fixed:isFixed}">
    <!-- class="unviewed" -->
    <div class="left-box">
      <span class="deleteChecked" @click="deleteChecked">
        删除选中的商品
      </span>
      <span class="split"></span>
      <span class="info">
        共 <span>{{ allGoodsCount }}</span> 件商品，已选择
        <span>{{ checkedGoodsCount }}</span> 件
      </span>
    </div>
    <div class="right-box">
      <div class="totalPrice">
        合计：<span> {{ totalCount }} </span>元
      </div>
      <button class="balance">
        去结算
      </button>
    </div>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
    };
  },
  props: {
    shopcartData: {
      type: Array,
    },
    multipleSelection: {
      type: Array,
    },
    isFixed:{
      type:Boolean
    }
  },
  computed: {
    //选中的商品总价
    totalCount() {
      let result = this.multipleSelection.reduce(function(total, val, index) {
        return (total += val.count * val.price);
      }, 0);
      return result;
    },
    //所有的商品总件数
    allGoodsCount() {
      let result = this.shopcartData.reduce(function(total, val, index) {
        return (total += val.count);
      }, 0);
      return result;
    },
    //选中的商品件数
    checkedGoodsCount() {
      let result = this.multipleSelection.reduce(function(total, val, index) {
        return (total += val.count);
      }, 0);
      return result;
    },
  },
  methods: {
    deleteChecked() {
      this.$confirm("您确定要删除勾选商品么?", "提示", {
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
          for (let j = this.multipleSelection.length - 1; j >= 0; j--) {
            for (let i = 0; i < this.shopcartData.length; i++) {
              if (this.multipleSelection[j].id === this.shopcartData[i].id) {
                this.shopcartData.splice(i, 1);
                break;
              }
            }
            this.multipleSelection.pop();
          }
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
};
</script>

<style>
#cart-bar {
  box-sizing: border-box;
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  height: 65px;
  background-color: #fff;
  padding-left: 20px;
  box-shadow: 0 0 16px -3px rgba(0, 0, 0, 0.1);
  /* line-height: 65px; */
}
#cart-bar.fixed {
  position: fixed;
  bottom: 0;
  margin: 0 auto;
  z-index: 999;
  width: 88%;
  min-width: 1250px;
}
.left-box,
.rigth-box {
  overflow: hidden;
}
.left-box {
  color: #757575;
}
.left-box .deleteChecked {
  cursor: pointer;
  transition: color 0.2s;
}
.left-box .deleteChecked:hover {
  color: orangered;
}
.left-box .split {
  display: inline-block;
  margin: 0 15px;
  width: 1px;
  height: 18px;

  background-color: #ccc;
  vertical-align: middle;
}
.left-box .info span {
  color: orangered;
}
.right-box .totalPrice {
  display: inline-block;
  margin-right: 50px;
}
.right-box .totalPrice span {
  font-size: 30px;
  color: orangered;
  vertical-align: text-bottom;
}
.right-box .balance {
  /* display: inline-block; */
  width: 200px;
  height: 100%;
  background-color: orangered;
  color: #fff;
  font-size: 20px;
  line-height: 65px;
  outline: none;
  border: none;
  cursor: pointer;
}
</style>
