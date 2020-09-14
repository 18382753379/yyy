<template>
  <div class='content'>
    <!-- 详情页面 图片与信息 -->
    <div class='container'>
      <!-- 左侧图片 -->
      <!-- :goodsDtail='goodsDtail'父向子传值 -->
      <preview :fistDesImg='fistDesImg' :desImg='desImg'></preview>
      <!-- 右侧信息 -->
      <property :goodsDtail='goodsDtail'></property>
    </div>
    <!-- 详情图片 -->
    <div class='simple'>
      <div class='simple-hd'>商品详情</div>
    </div>
    <div class='simple-bd'>
      <ul>
        <li v-for='(item, index) in desImg' :key='index'>
          <img :src='item' alt />
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import preview from './DetailConL.vue'
import property from './DetailConR.vue'
export default {
  name: 'detailCon',
  components: {
    preview,
    property
  },
  data() {
    return {
      goodsDtail: [],
      desImg: [],
      fistDesImg: ''
    };
  },
  mounted() {
    var gid = this.$route.query.gid;
    // 发送ajax 根据gid请求商品详情信息 返回该商品详情 
    var url = `/getDetail?gid=${gid}`;
    this.$http
      .get(url)
      .then(res => {
        this.goodsDtail = res.data[0];
        this.desImg = this.goodsDtail.desimg.split(' ');
        this.fistDesImg = this.desImg[0];
        console.log(this.desImg[0])
      });
  },
}
</script>

<style scoped>
/* 引入公共css类 */
@import url("../../../assets/css/base.css");

.detail {
  font-size: 20px;
}
/* 中间内容部分 */
.content {
  width: 1200px;
  /* height: 1200px; */
  margin: 0 auto;
  background: #f4f4f4;
}

/* 放大与信息详情模块 */
.container {
  width: 1200px;
  margin: 0 auto;
  height: 700px;
}
/* 底部图片显示 */
.simple {
  margin-top: 30px;
  /* background-color: orange; */
}
.simple-hd {
  font-size: 60px;
  font-family: "宋体";
  color: #52bfff;
}
.simple-bd {
  /* background-color: blue; */
  text-align: center;
}
.simple-bd img {
  margin-top: 30px;
}
</style>
