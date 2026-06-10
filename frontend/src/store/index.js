import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    // 当前选中的疾病类型
    currentDisease: 'HYP',
    // 当前选中的年份
    currentYear: 2024,
    // 当前选中的省份
    currentProvince: null,
    // 病种列表
    diseaseTypes: [],
    // 年份列表
    yearList: []
  },
  getters: {
    currentDisease: state => state.currentDisease,
    currentYear: state => state.currentYear,
    currentProvince: state => state.currentProvince,
    diseaseTypes: state => state.diseaseTypes,
    yearList: state => state.yearList
  },
  mutations: {
    SET_CURRENT_DISEASE(state, disease) {
      state.currentDisease = disease
    },
    SET_CURRENT_YEAR(state, year) {
      state.currentYear = year
    },
    SET_CURRENT_PROVINCE(state, province) {
      state.currentProvince = province
    },
    SET_DISEASE_TYPES(state, types) {
      state.diseaseTypes = types
    },
    SET_YEAR_LIST(state, years) {
      state.yearList = years
    }
  },
  actions: {
    setCurrentDisease({ commit }, disease) {
      commit('SET_CURRENT_DISEASE', disease)
    },
    setCurrentYear({ commit }, year) {
      commit('SET_CURRENT_YEAR', year)
    },
    setCurrentProvince({ commit }, province) {
      commit('SET_CURRENT_PROVINCE', province)
    },
    async fetchDiseaseTypes({ commit }) {
      try {
        const res = await import('../api/diseaseType')
        const data = await res.getDiseaseTypes()
        commit('SET_DISEASE_TYPES', data)
      } catch (error) {
        console.error('获取病种列表失败', error)
      }
    },
    async fetchYearList({ commit }) {
      try {
        const res = await import('../api/time')
        const data = await res.getYearList()
        commit('SET_YEAR_LIST', data)
      } catch (error) {
        console.error('获取年份列表失败', error)
      }
    }
  },
  modules: {
  }
})
