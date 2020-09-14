<template>
  <div class='preview'>
    <img class='imgsrc' :src='desImg[curIndex]' @mouseenter='bigImg()' alt />
    <ul>
      <li
        v-for='(item, index) in desImg'
        :key='index'
        @click='changImg(index)'
        @mouseenter='changImg(index)'
      >
        <img :src='item' alt />
      </li>
    </ul>
    <div class='promise'>
      <span class='iconfont icon-zhengpinbaozhang'>100%正品</span>
      <span class='iconfont icon-dazhe03'>天天有折扣</span>
    </div>
  </div>
</template>

<script>
export default {
  name: 'detail',
  data() {
    return {
      curIndex: 0
    };
  },
  props: [
    'goodsDtail',
    'desImg'
  ],
  methods: {
    // 点击小图片 在大图片中显示
    changImg(index) {
      this.curIndex = index;
    },
    // 放大图片
    bigImg() {
      console.log(123);
    }
  }
}
</script>

<style>
.preview {
  width: 530px;
  vertical-align: top;
  margin: 10px 30px;
  /* background-color: red; */
}
.imgsrc {
  width: 100%;
  height: 498px;
  /* border: 1px solid #606266; */
}
.preview ul {
  height: 100px;
}

.preview ul img {
  width: 100%;
  height: 100%;
  cursor: pointer;
}
.preview ul li {
  width: 100px;
  height: 100px;
  margin: 0 4px;
  float: left;
}
.promise {
  width: 100%;
  height: 60px;
  margin-top: 10px;
  line-height: 60px;
  /* background-color: green; */
}
.promise span {
  margin: 0 40px;
  font-size: 30px;
  color: #ccc;
}
.property {
  width: 600px;
  /* height: 500px; */
  line-height: 50px;
  margin-top: 10px;
  /* background-color: orange; */
}
.preview {
  float: left;
}
</style>