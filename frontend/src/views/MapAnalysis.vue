<template>
  <div class="map-analysis">
    <el-row :gutter="20">
      <el-col :span="6">
        <el-card class="filter-card">
          <div slot="header">
            <span>筛选条件</span>
          </div>
          <el-form label-position="top">
            <el-form-item label="病种类型">
              <el-select v-model="queryParams.diseaseCode" placeholder="请选择病种" style="width: 100%" @change="loadData">
                <el-option
                  v-for="item in diseaseTypes"
                  :key="item.diseaseCode"
                  :label="item.diseaseName"
                  :value="item.diseaseCode"
                ></el-option>
              </el-select>
            </el-form-item>
            <el-form-item label="年份">
              <el-select v-model="queryParams.year" placeholder="请选择年份" style="width: 100%" @change="loadData">
                <el-option
                  v-for="year in yearList"
                  :key="year"
                  :label="year"
                  :value="year"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-form>
        </el-card>

        <el-card class="legend-card">
          <div slot="header">
            <span>图例</span>
          </div>
          <div class="legend">
            <div class="legend-item" v-for="(item, index) in legendData" :key="index">
              <span class="legend-color" :style="{ backgroundColor: item.color }"></span>
              <span class="legend-text">{{ item.label }}</span>
            </div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="18">
        <el-card class="map-card">
          <div ref="mapChart" class="map-container"></div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts'
import chinaJson from '../assets/map/china.json'
import { getDiseaseTypes } from '../api/dashboard'
import { getPrevalenceByProvince } from '../api/disease'

// 注册中国地图
echarts.registerMap('china', chinaJson)

export default {
  name: 'MapAnalysis',
  data() {
    return {
      mapChart: null,
      diseaseTypes: [],
      yearList: [2024, 2023, 2022, 2021, 2020, 2019, 2018],
      queryParams: {
        diseaseCode: 'HYP',
        year: 2024
      },
      legendData: [
        { color: '#fee5d9', label: '< 10%' },
        { color: '#fcbba1', label: '10% - 15%' },
        { color: '#fc9272', label: '15% - 20%' },
        { color: '#fb6a4a', label: '20% - 25%' },
        { color: '#ef3b2c', label: '> 25%' }
      ]
    }
  },
  mounted() {
    this.initChart()
    this.loadDiseaseTypes()
    this.loadData() // 初始加载数据
  },
  beforeDestroy() {
    if (this.mapChart) this.mapChart.dispose()
  },
  methods: {
    initChart() {
      this.mapChart = echarts.init(this.$refs.mapChart)
      window.addEventListener('resize', () => {
        if (this.mapChart) this.mapChart.resize()
      })

      // 初始化地图配置
      this.mapChart.setOption({
        title: {
          text: '中国居民慢性病患病率分布',
          subtext: '数据来源：国家统计局',
          left: 'center'
        },
        tooltip: {
          trigger: 'item',
          formatter: '{b}<br/>患病率：{c}%'
        },
        visualMap: {
          min: 0,
          max: 30,
          text: ['高', '低'],
          realtime: false,
          calculable: true,
          inRange: {
            color: ['#fee5d9', '#fcbba1', '#fc9272', '#fb6a4a', '#ef3b2c']
          }
        },
        series: [{
          name: '患病率',
          type: 'map',
          map: 'china',
          roam: true,
          label: {
            show: true,
            fontSize: 10
          },
          data: []
        }]
      })
    },
    async loadDiseaseTypes() {
      try {
        const types = await getDiseaseTypes()
        this.diseaseTypes = types
      } catch (error) {
        console.error('加载病种类型失败', error)
      }
    },
    async loadData() {
      try {
        const res = await getPrevalenceByProvince(
          this.queryParams.diseaseCode,
          this.queryParams.year
        )
        console.log('加载地图数据', res)

        // 处理返回数据
        let mapData = []
        if (res && res.data) {
          mapData = res.data.map(item => ({
            name: item.regionName,
            value: item.prevalence
          }))
        }

        // 更新地图数据
        this.mapChart.setOption({
          series: [{
            data: mapData
          }]
        })
      } catch (error) {
        console.error('加载地图数据失败', error)
        // 如果API调用失败，使用模拟数据演示
        this.loadMockData()
      }
    },
    loadMockData() {
      // 模拟数据用于演示
      const mockData = [
        { name: '北京', value: 15.2 },
        { name: '上海', value: 14.8 },
        { name: '广东', value: 13.5 },
        { name: '江苏', value: 12.9 },
        { name: '浙江', value: 11.8 },
        { name: '山东', value: 16.2 },
        { name: '四川', value: 10.5 },
        { name: '湖北', value: 11.2 },
        { name: '河南', value: 14.5 },
        { name: '河北', value: 15.8 },
        { name: '湖南', value: 12.3 },
        { name: '安徽', value: 13.1 },
        { name: '福建', value: 11.5 },
        { name: '江西', value: 12.8 },
        { name: '辽宁', value: 16.5 },
        { name: '吉林', value: 15.2 },
        { name: '黑龙江', value: 17.1 },
        { name: '陕西', value: 13.8 },
        { name: '甘肃', value: 14.2 },
        { name: '青海', value: 12.6 },
        { name: '内蒙古', value: 16.8 },
        { name: '广西', value: 11.9 },
        { name: '西藏', value: 8.5 },
        { name: '宁夏', value: 13.5 },
        { name: '新疆', value: 14.8 },
        { name: '云南', value: 10.2 },
        { name: '贵州', value: 11.5 },
        { name: '重庆', value: 12.8 },
        { name: '天津', value: 15.5 },
        { name: '海南', value: 10.8 },
        { name: '台湾', value: 12.2 },
        { name: '香港', value: 13.5 },
        { name: '澳门', value: 11.8 }
      ]

      this.mapChart.setOption({
        series: [{
          data: mockData
        }]
      })
    }
  }
}
</script>

<style scoped>
.filter-card,
.legend-card {
  margin-bottom: 20px;
}

.legend {
  padding: 10px 0;
}

.legend-item {
  display: flex;
  align-items: center;
  margin-bottom: 10px;
}

.legend-color {
  width: 24px;
  height: 16px;
  margin-right: 10px;
  border-radius: 2px;
}

.legend-text {
  font-size: 13px;
  color: #606266;
}

.map-card {
  height: 600px;
}

.map-container {
  width: 100%;
  height: 100%;
}
</style>
