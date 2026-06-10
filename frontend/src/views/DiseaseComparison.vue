<template>
  <div class="disease-comparison">
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
      </el-col>
      <el-col :span="18">
        <el-card class="chart-card">
          <div slot="header" class="card-header">
            <span>各病种患病率对比</span>
          </div>
          <div ref="comparisonChart" class="chart-container"></div>
        </el-card>

        <el-row :gutter="20" style="margin-top: 20px;">
          <el-col :span="12">
            <el-card class="chart-card">
              <div slot="header" class="card-header">
                <span>患病率Top10省份</span>
              </div>
              <div ref="top10Chart" class="chart-container"></div>
            </el-card>
          </el-col>
          <el-col :span="12">
            <el-card class="chart-card">
              <div slot="header" class="card-header">
                <span>病种构成比例</span>
              </div>
              <div ref="pieChart" class="chart-container"></div>
            </el-card>
          </el-col>
        </el-row>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts'
import { getProvinces } from '../api/region'

export default {
  name: 'DiseaseComparison',
  data() {
    return {
      comparisonChart: null,
      top10Chart: null,
      pieChart: null,
      provinces: [],
      yearList: [2024, 2023, 2022, 2021, 2020],
      queryParams: {
        regionId: 1,
        year: 2024
      }
    }
  },
  mounted() {
    this.initCharts()
    this.loadProvinces()
  },
  beforeDestroy() {
    if (this.comparisonChart) this.comparisonChart.dispose()
    if (this.top10Chart) this.top10Chart.dispose()
    if (this.pieChart) this.pieChart.dispose()
  },
  methods: {
    initCharts() {
      this.comparisonChart = echarts.init(this.$refs.comparisonChart)
      this.top10Chart = echarts.init(this.$refs.top10Chart)
      this.pieChart = echarts.init(this.$refs.pieChart)

      window.addEventListener('resize', () => {
        if (this.comparisonChart) this.comparisonChart.resize()
        if (this.top10Chart) this.top10Chart.resize()
        if (this.pieChart) this.pieChart.resize()
      })

      // 初始化病种对比图
      this.comparisonChart.setOption({
        tooltip: { trigger: 'axis' },
        legend: { data: ['患病率', '发病率', '死亡率'], bottom: 0 },
        xAxis: {
          type: 'category',
          data: ['高血压', '糖尿病', '冠心病', '脑卒中', 'COPD', '癌症']
        },
        yAxis: { type: 'value', name: '百分比(%)' },
        series: [
          {
            name: '患病率',
            type: 'bar',
            data: [27.5, 11.9, 8.5, 6.2, 4.8, 3.2]
          },
          {
            name: '发病率',
            type: 'bar',
            data: [5.2, 3.8, 2.1, 1.5, 1.2, 2.8]
          },
          {
            name: '死亡率',
            type: 'bar',
            data: [2.1, 1.5, 3.2, 2.8, 1.8, 2.5]
          }
        ]
      })

      // 初始化Top10图表
      this.top10Chart.setOption({
        tooltip: { trigger: 'axis' },
        xAxis: { type: 'value' },
        yAxis: {
          type: 'category',
          data: ['西藏', '海南', '云南', '贵州', '四川', '浙江', '广东', '江苏', '山东', '黑龙江'],
          inverse: true
        },
        series: [{
          type: 'bar',
          data: [8.5, 10.8, 10.2, 11.5, 10.5, 11.8, 13.5, 12.9, 16.2, 17.1],
          itemStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [
              { offset: 0, color: '#409eff' },
              { offset: 1, color: '#79bbff' }
            ])
          }
        }]
      })

      // 初始化饼图
      this.pieChart.setOption({
        tooltip: { trigger: 'item' },
        legend: { bottom: 0 },
        series: [{
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          itemStyle: { borderRadius: 10, borderColor: '#fff', borderWidth: 2 },
          label: { show: true, formatter: '{b}: {d}%' },
          data: [
            { value: 27.5, name: '高血压' },
            { value: 11.9, name: '糖尿病' },
            { value: 8.5, name: '冠心病' },
            { value: 6.2, name: '脑卒中' },
            { value: 4.8, name: 'COPD' },
            { value: 3.2, name: '癌症' }
          ]
        }]
      })
    },
    async loadProvinces() {
      try {
        this.provinces = await getProvinces()
      } catch (error) {
        console.error('加载省份列表失败', error)
      }
    },
    async loadData() {
      try {
        console.log('加载对比数据', this.queryParams)
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
