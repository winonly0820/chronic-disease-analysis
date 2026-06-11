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
              <el-select
                  v-model="queryParams.regionId"
                  placeholder="请选择省份"
                  style="width: 100%"
                  @change="loadData"
              >
                <el-option
                    v-for="item in provinces"
                    :key="item.id"
                    :label="item.regionName || item.region_name || item.name"
                    :value="item.id"
                />
              </el-select>
            </el-form-item>

            <el-form-item label="年份">
              <el-select
                  v-model="queryParams.year"
                  placeholder="请选择年份"
                  style="width: 100%"
                  @change="loadData"
              >
                <el-option
                    v-for="year in yearList"
                    :key="year"
                    :label="year"
                    :value="year"
                />
              </el-select>
            </el-form-item>

            <el-form-item label="Top10病种">
              <el-select
                  v-model="queryParams.diseaseCode"
                  placeholder="请选择病种"
                  style="width: 100%"
                  @change="loadData"
              >
                <el-option
                    v-for="item in diseaseList"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value"
                />
              </el-select>
            </el-form-item>
          </el-form>
        </el-card>
      </el-col>

      <el-col :span="18">
        <el-card class="chart-card" v-loading="loading">
          <div slot="header" class="card-header">
            <span>各病种患病率对比</span>
          </div>
          <div ref="comparisonChart" class="chart-container"></div>
        </el-card>

        <el-row :gutter="20" style="margin-top: 20px;">
          <el-col :span="12">
            <el-card class="chart-card" v-loading="loading">
              <div slot="header" class="card-header">
                <span>患病率Top10省份</span>
              </div>
              <div ref="top10Chart" class="chart-container"></div>
            </el-card>
          </el-col>

          <el-col :span="12">
            <el-card class="chart-card" v-loading="loading">
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
import {
  getDiseaseComparison,
  getTop10Prevalence
} from '../api/disease'

export default {
  name: 'DiseaseComparison',

  data() {
    return {
      loading: false,

      comparisonChart: null,
      top10Chart: null,
      pieChart: null,
      resizeHandler: null,

      provinces: [],

      yearList: [2024, 2023, 2022, 2021, 2020],

      diseaseList: [
        { label: '高血压', value: 'HYP' },
        { label: '糖尿病', value: 'DIA' },
        { label: '冠心病', value: 'CHD' },
        { label: '脑卒中', value: 'CER' },
        { label: '慢性阻塞性肺疾病', value: 'COP' },
        { label: '癌症', value: 'CAN' }
      ],

      queryParams: {
        regionId: 1,
        year: 2024,
        diseaseCode: 'HYP'
      }
    }
  },

  mounted() {
    this.initCharts()
    this.loadProvinces()
    this.loadData()
  },

  beforeDestroy() {
    if (this.resizeHandler) {
      window.removeEventListener('resize', this.resizeHandler)
    }

    if (this.comparisonChart) {
      this.comparisonChart.dispose()
      this.comparisonChart = null
    }

    if (this.top10Chart) {
      this.top10Chart.dispose()
      this.top10Chart = null
    }

    if (this.pieChart) {
      this.pieChart.dispose()
      this.pieChart = null
    }
  },

  methods: {
    initCharts() {
      this.comparisonChart = echarts.init(this.$refs.comparisonChart)
      this.top10Chart = echarts.init(this.$refs.top10Chart)
      this.pieChart = echarts.init(this.$refs.pieChart)

      this.resizeHandler = () => {
        if (this.comparisonChart) this.comparisonChart.resize()
        if (this.top10Chart) this.top10Chart.resize()
        if (this.pieChart) this.pieChart.resize()
      }

      window.addEventListener('resize', this.resizeHandler)

      this.initComparisonChart()
      this.initTop10Chart()
      this.initPieChart()
    },

    initComparisonChart() {
      this.comparisonChart.setOption({
        tooltip: {
          trigger: 'axis'
        },
        legend: {
          data: ['患病率', '发病率', '死亡率'],
          bottom: 0
        },
        grid: {
          left: '3%',
          right: '4%',
          bottom: '15%',
          containLabel: true
        },
        xAxis: {
          type: 'category',
          data: []
        },
        yAxis: {
          type: 'value',
          name: '百分比(%)'
        },
        series: [
          {
            name: '患病率',
            type: 'bar',
            data: []
          },
          {
            name: '发病率',
            type: 'bar',
            data: []
          },
          {
            name: '死亡率',
            type: 'bar',
            data: []
          }
        ]
      })
    },

    initTop10Chart() {
      this.top10Chart.setOption({
        tooltip: {
          trigger: 'axis',
          axisPointer: {
            type: 'shadow'
          }
        },
        grid: {
          left: '3%',
          right: '8%',
          bottom: '3%',
          containLabel: true
        },
        xAxis: {
          type: 'value',
          name: '%'
        },
        yAxis: {
          type: 'category',
          data: [],
          inverse: true
        },
        series: [
          {
            name: '患病率',
            type: 'bar',
            data: [],
            itemStyle: {
              color: new echarts.graphic.LinearGradient(0, 0, 1, 0, [
                { offset: 0, color: '#409eff' },
                { offset: 1, color: '#79bbff' }
              ])
            }
          }
        ]
      })
    },

    initPieChart() {
      this.pieChart.setOption({
        tooltip: {
          trigger: 'item',
          formatter: '{b}: {c}%'
        },
        legend: {
          bottom: 0
        },
        series: [
          {
            name: '病种构成比例',
            type: 'pie',
            radius: ['40%', '70%'],
            center: ['50%', '45%'],
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 10,
              borderColor: '#fff',
              borderWidth: 2
            },
            label: {
              show: true,
              formatter: '{b}: {d}%'
            },
            data: []
          }
        ]
      })
    },

    async loadProvinces() {
      try {
        const res = await getProvinces()
        const provinceData = this.unwrapResponse(res)

        this.provinces = Array.isArray(provinceData) ? provinceData : []

        if (this.provinces.length > 0) {
          const exists = this.provinces.some(item => {
            return String(item.id) === String(this.queryParams.regionId)
          })

          if (!exists) {
            this.queryParams.regionId = this.provinces[0].id
            this.loadData()
          }
        }
      } catch (error) {
        console.error('加载省份列表失败：', error)

        if (this.$message) {
          this.$message.error('加载省份列表失败')
        }
      }
    },

    async loadData() {
      if (!this.comparisonChart || !this.top10Chart || !this.pieChart) {
        return
      }

      try {
        this.loading = true

        const { regionId, year, diseaseCode } = this.queryParams

        const [comparisonRes, top10Res] = await Promise.all([
          getDiseaseComparison(regionId, year),
          getTop10Prevalence(diseaseCode, year)
        ])

        console.log('各病种对比原始返回：', comparisonRes)
        console.log('Top10原始返回：', top10Res)

        const comparisonData = this.unwrapResponse(comparisonRes)
        const top10Data = this.unwrapResponse(top10Res)

        console.log('各病种对比解析后：', comparisonData)
        console.log('Top10解析后：', top10Data)

        this.renderComparisonChart(comparisonData)
        this.renderPieChart(comparisonData)
        this.renderTop10Chart(top10Data)
      } catch (error) {
        console.error('加载疾病统计数据失败：', error)

        if (this.$message) {
          this.$message.error('加载疾病统计数据失败')
        }
      } finally {
        this.loading = false
      }
    },

    unwrapResponse(res) {
      if (!res) return []

      if (Array.isArray(res)) {
        return res
      }

      if (res.data !== undefined) {
        const data = res.data

        if (Array.isArray(data)) {
          return data
        }

        if (data && data.data !== undefined) {
          return data.data
        }

        if (data && data.rows !== undefined) {
          return data.rows
        }

        return data
      }

      if (res.rows !== undefined) {
        return res.rows
      }

      return res
    },

    renderComparisonChart(data) {
      const normalized = this.normalizeComparisonData(data)

      this.comparisonChart.setOption({
        xAxis: {
          data: normalized.diseases
        },
        series: [
          {
            name: '患病率',
            data: normalized.prevalenceRates
          },
          {
            name: '发病率',
            data: normalized.incidenceRates
          },
          {
            name: '死亡率',
            data: normalized.mortalityRates
          }
        ]
      })
    },

    renderPieChart(data) {
      const normalized = this.normalizeComparisonData(data)

      const pieData = normalized.diseases.map((name, index) => {
        return {
          name,
          value: normalized.prevalenceRates[index] || 0
        }
      })

      this.pieChart.setOption({
        series: [
          {
            data: pieData
          }
        ]
      })
    },

    renderTop10Chart(data) {
      const normalized = this.normalizeTop10Data(data)

      this.top10Chart.setOption({
        yAxis: {
          data: normalized.provinces
        },
        series: [
          {
            name: '患病率',
            data: normalized.rates
          }
        ]
      })
    },

    normalizeComparisonData(data) {
      let diseases = []
      let prevalenceRates = []
      let incidenceRates = []
      let mortalityRates = []

      if (Array.isArray(data)) {
        diseases = data.map(item => {
          return item.diseaseName ||
              item.disease_name ||
              item.name ||
              item.disease ||
              ''
        })

        prevalenceRates = data.map(item => {
          return Number(
              item.prevalenceRate ||
              item.prevalence_rate ||
              item.prevalence ||
              item.value ||
              0
          )
        })

        incidenceRates = data.map(item => {
          return Number(
              item.incidenceRate ||
              item.incidence_rate ||
              item.incidence ||
              0
          )
        })

        mortalityRates = data.map(item => {
          return Number(
              item.mortalityRate ||
              item.mortality_rate ||
              item.mortality ||
              0
          )
        })
      } else if (data && typeof data === 'object') {
        diseases = data.diseases ||
            data.diseaseNames ||
            data.names ||
            []

        prevalenceRates = data.prevalenceRates ||
            data.prevalenceRateList ||
            data.prevalenceList ||
            []

        incidenceRates = data.incidenceRates ||
            data.incidenceRateList ||
            data.incidenceList ||
            []

        mortalityRates = data.mortalityRates ||
            data.mortalityRateList ||
            data.mortalityList ||
            []
      }

      return {
        diseases,
        prevalenceRates,
        incidenceRates,
        mortalityRates
      }
    },

    normalizeTop10Data(data) {
      let provinces = []
      let rates = []

      if (Array.isArray(data)) {
        provinces = data.map(item => {
          return item.regionName ||
              item.region_name ||
              item.provinceName ||
              item.province_name ||
              item.name ||
              ''
        })

        rates = data.map(item => {
          return Number(
              item.prevalenceRate ||
              item.prevalence_rate ||
              item.rate ||
              item.value ||
              0
          )
        })
      } else if (data && typeof data === 'object') {
        provinces = data.provinces ||
            data.provinceNames ||
            data.regionNames ||
            data.names ||
            []

        rates = data.rates ||
            data.prevalenceRates ||
            data.values ||
            []
      }

      return {
        provinces,
        rates
      }
    }
  }
}
</script>

<style scoped>
.disease-comparison {
  padding: 20px;
}

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