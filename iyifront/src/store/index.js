import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    sex: "",
    num: 1
  },
  // mutations改变num
  mutations: {
    changeNum(state, val) {
      state.num = val;
    }
  },
  actions: {},
  modules: {}
})