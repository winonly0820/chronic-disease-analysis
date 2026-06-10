<template>
  <div class="trend-analysis">
    <el-row :gutter="20">
      <el-col :span="6">
        <el-card class="filter-card">
          <div slot="header">
            <span>筛选条件</span>
          </div>
          <el-form label-position="top">
            <el-form-item label="省份选择">
              <el-select v-model="queryParams.regionId" placeholder="请选择省份" style="width: 100%" @change="loadData">
                <el-option
                  v-for="item in provinces"
                  :key="item.id"
                  :label="item.regionName"
                  :value="item.id"
                ></el-option>
              </el-select>
            </el-form-item>
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
          </el-form>
        </el-card>
      </el-col>
      <el-col :span="18">
        <el-card class="chart-card">
          <div slot="header" class="card-header">
            <span>患病率趋势变化</span>
          </div>
          <div ref="trendChart" class="chart-container"></div>
        </el-card>

        <el-card class="chart-card" style="margin-top: 20px;">
          <div slot="header" class="card-header">
            <span>各年龄段患病率分布</span>
          </div>
          <div ref="ageChart" class="chart-container"></div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts'
import { getProvinces } from '../api/region'
import { getDiseaseTypes } from '../api/dashboard'
import { getPrevalenceTrend, getPrevalenceByAgeGroup } from '../api/disease'

export default {
  name: 'TrendAnalysis',
  data() {
    return {
      trendChart: null,
      ageChart: null,
      provinces: [],
      diseaseTypes: [],
      queryParams: {
        regionId: 1,
        diseaseCode: 'HYP'
      }
    }
  },
  mounted() {
    this.initCharts()
    this.loadOptions()
  },
  beforeDestroy() {
    if (this.trendChart) this.trendChart.dispose()
    if (this.ageChart) this.ageChart.dispose()
  },
  methods: {
    initCharts() {
      this.trendChart = echarts.init(this.$refs.trendChart)
      this.ageChart = echarts.init(this.$refs.ageChart)

      window.addEventListener('resize', () => {
        if (this.trendChart) this.trendChart.resize()
        if (this.ageChart) this.ageChart.resize()
      })

      // 初始化趋势图
      this.trendChart.setOption({
        tooltip: { trigger: 'axis' },
        xAxis: {
          type: 'category',
          data: ['2018', '2019', '2020', '2021', '2022', '2023', '2024']
        },
        yAxis: { type: 'value', name: '患病率(%)' },
        series: [{
          type: 'line',
          data: [25.2, 26.1, 26.8, 27.5, 28.2, 28.9, 29.5],
          smooth: true,
          areaStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              { offset: 0, color: 'rgba(64, 158, 255, 0.3)' },
              { offset: 1, color: 'rgba(64, 158, 255, 0.05)' }
            ])
          },
          itemStyle: { color: '#409eff' }
        }]
      })

      // 初始化年龄段分布图
      this.ageChart.setOption({
        tooltip: { trigger: 'axis' },
        xAxis: {
          type: 'category',
          data: ['0-17岁', '18-34岁', '35-49岁', '50-64岁', '65岁以上']
        },
        yAxis: { type: 'value', name: '患病率(%)' },
        series: [{
          type: 'bar',
          data: [2.5, 8.2, 18.5, 32.8, 48.5],
          itemStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              { offset: 0, color: '#67c23a' },
              { offset: 1, color: '#95d475' }
            ])
          }
        }]
      })
    },
    async loadOptions() {
      try {
        const [provinces, types] = await Promise.all([
          getProvinces(),
          getDiseaseTypes()
        ])
        this.provinces = provinces
        this.diseaseTypes = types
      } catch (error) {
        console.error('加载选项失败', error)
      }
    },
    async loadData() {
      try {
        // 加载趋势数据
        const trendData = await getPrevalenceTrend(
          this.queryParams.regionId,
          this.queryParams.diseaseCode
        )
        console.log('趋势数据', trendData)

        // 加载年龄段分布数据
        const ageData = await getPrevalenceByAgeGroup(
          this.queryParams.regionId,
          this.queryParams.diseaseCode,
          2024
        )
        console.log('年龄段数据', ageData)
      } catch (error) {
        console.error('加载数据失败', error)
      }
    }
  }
}
</script>

<style scoped>
.filter-card {
  margin-bottom: 20px;
}

.chart-card {
  height: 400px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.chart-container {
  width: 100%;
  height: 320px;
}
</style>
