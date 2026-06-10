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
              <el-select
                  v-model="queryParams.regionId"
                  placeholder="请选择省份"
                  style="width: 100%"
                  @change="loadData"
              >
                <el-option
                    v-for="item in provinces"
                    :key="item.id || item.regionId || item.regionCode"
                    :label="item.regionName"
                    :value="item.id || item.regionId || item.regionCode"
                />
              </el-select>
            </el-form-item>

            <el-form-item label="病种类型">
              <el-select
                  v-model="queryParams.diseaseCode"
                  placeholder="请选择病种"
                  style="width: 100%"
                  @change="loadData"
              >
                <el-option
                    v-for="item in diseaseTypes"
                    :key="item.diseaseCode"
                    :label="item.diseaseName"
                    :value="item.diseaseCode"
                />
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
      resizeHandler: null,

      provinces: [],
      diseaseTypes: [],

      queryParams: {
        regionId: 1,
        diseaseCode: 'HYP'
      },

      currentYear: 2024
    }
  },

  mounted() {
    this.$nextTick(() => {
      this.initCharts()
      this.loadOptions()
    })
  },

  beforeDestroy() {
    if (this.resizeHandler) {
      window.removeEventListener('resize', this.resizeHandler)
      this.resizeHandler = null
    }

    if (this.trendChart) {
      this.trendChart.dispose()
      this.trendChart = null
    }

    if (this.ageChart) {
      this.ageChart.dispose()
      this.ageChart = null
    }
  },

  methods: {
    initCharts() {
      if (!this.$refs.trendChart || !this.$refs.ageChart) {
        console.error('图表容器不存在')
        return
      }

      this.trendChart = echarts.init(this.$refs.trendChart)
      this.ageChart = echarts.init(this.$refs.ageChart)

      this.renderEmptyTrendChart()
      this.renderEmptyAgeChart()

      this.resizeHandler = () => {
        if (this.trendChart) this.trendChart.resize()
        if (this.ageChart) this.ageChart.resize()
      }

      window.addEventListener('resize', this.resizeHandler)
    },

    async loadOptions() {
      try {
        const [provinces, types] = await Promise.all([
          getProvinces(),
          getDiseaseTypes()
        ])

        console.log('省份列表：', provinces)
        console.log('病种列表：', types)

        this.provinces = Array.isArray(provinces) ? provinces : []
        this.diseaseTypes = Array.isArray(types) ? types : []

        if (this.provinces.length > 0) {
          const existsProvince = this.provinces.some(item => {
            const value = item.id || item.regionId || item.regionCode
            return value === this.queryParams.regionId
          })

          if (!existsProvince) {
            const first = this.provinces[0]
            this.queryParams.regionId = first.id || first.regionId || first.regionCode
          }
        }

        if (this.diseaseTypes.length > 0) {
          const existsDisease = this.diseaseTypes.some(item => {
            return item.diseaseCode === this.queryParams.diseaseCode
          })

          if (!existsDisease) {
            this.queryParams.diseaseCode = this.diseaseTypes[0].diseaseCode
          }
        }

        await this.loadData()
      } catch (error) {
        console.error('加载选项失败：', error)
      }
    },

    async loadData() {
      try {
        if (!this.trendChart || !this.ageChart) {
          console.error('图表实例不存在')
          return
        }

        console.log('当前查询参数：', this.queryParams)

        const [trendData, ageData] = await Promise.all([
          getPrevalenceTrend(
              this.queryParams.regionId,
              this.queryParams.diseaseCode
          ),
          getPrevalenceByAgeGroup(
              this.queryParams.regionId,
              this.queryParams.diseaseCode,
              this.currentYear
          )
        ])

        console.log('趋势接口返回：', trendData)
        console.log('年龄段接口返回：', ageData)

        this.renderTrendChart(trendData)
        this.renderAgeChart(ageData)
      } catch (error) {
        console.error('加载数据失败：', error)
      }
    },

    renderTrendChart(data) {
      let list = []

      if (Array.isArray(data)) {
        list = data
      } else if (data && Array.isArray(data.records)) {
        list = data.records
      } else if (data && Array.isArray(data.list)) {
        list = data.list
      }

      if (!list.length) {
        this.renderEmptyTrendChart()
        return
      }

      const sortedList = list
          .map(item => {
            return {
              year: item.year || item.dataYear || item.statYear || item.yearValue,
              value: Number(item.prevalence)
            }
          })
          .filter(item => item.year && !Number.isNaN(item.value))
          .sort((a, b) => Number(a.year) - Number(b.year))

      const years = sortedList.map(item => String(item.year))
      const values = sortedList.map(item => item.value)

      console.log('趋势图年份：', years)
      console.log('趋势图数值：', values)

      this.trendChart.clear()

      this.trendChart.setOption(
          {
            tooltip: {
              trigger: 'axis',
              formatter: function(params) {
                const item = params[0]
                return item.name + '<br/>患病率：' + item.value + '%'
              }
            },

            grid: {
              left: '3%',
              right: '4%',
              bottom: '10%',
              top: '18%',
              containLabel: true
            },

            xAxis: {
              type: 'category',
              boundaryGap: false,
              data: years
            },

            yAxis: {
              type: 'value',
              name: '患病率(%)',
              min: 0
            },

            series: [
              {
                name: '患病率',
                type: 'line',
                data: values,
                smooth: true,
                symbol: 'circle',
                symbolSize: 6,
                lineStyle: {
                  width: 3,
                  color: '#409EFF'
                },
                itemStyle: {
                  color: '#409EFF'
                },
                areaStyle: {
                  color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                    { offset: 0, color: 'rgba(64, 158, 255, 0.30)' },
                    { offset: 1, color: 'rgba(64, 158, 255, 0.05)' }
                  ])
                },
                label: {
                  show: true,
                  position: 'top',
                  formatter: '{c}%'
                }
              }
            ]
          },
          true
      )

      this.$nextTick(() => {
        if (this.trendChart) this.trendChart.resize()
      })
    },

    renderAgeChart(data) {
      let list = []

      if (Array.isArray(data)) {
        list = data
      } else if (data && Array.isArray(data.records)) {
        list = data.records
      } else if (data && Array.isArray(data.list)) {
        list = data.list
      }

      if (!list.length) {
        this.renderEmptyAgeChart()
        return
      }

      const ageOrder = {
        '0-17岁': 1,
        '18-34岁': 2,
        '35-49岁': 3,
        '50-64岁': 4,
        '65岁以上': 5
      }

      const sortedList = list
          .map(item => {
            return {
              ageGroup: item.ageGroup || item.ageGroupName || item.groupName || item.name,
              value: Number(item.prevalence)
            }
          })
          .filter(item => item.ageGroup && !Number.isNaN(item.value))
          .sort((a, b) => {
            return (ageOrder[a.ageGroup] || 999) - (ageOrder[b.ageGroup] || 999)
          })

      const ageGroups = sortedList.map(item => item.ageGroup)
      const values = sortedList.map(item => item.value)

      console.log('年龄段：', ageGroups)
      console.log('年龄段数值：', values)

      this.ageChart.clear()

      this.ageChart.setOption(
          {
            tooltip: {
              trigger: 'axis',
              axisPointer: {
                type: 'shadow'
              },
              formatter: function(params) {
                const item = params[0]
                return item.name + '<br/>患病率：' + item.value + '%'
              }
            },

            grid: {
              left: '3%',
              right: '4%',
              bottom: '10%',
              top: '18%',
              containLabel: true
            },

            xAxis: {
              type: 'category',
              data: ageGroups
            },

            yAxis: {
              type: 'value',
              name: '患病率(%)',
              min: 0
            },

            series: [
              {
                name: '患病率',
                type: 'bar',
                data: values,
                barWidth: 45,
                itemStyle: {
                  color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
                    { offset: 0, color: '#67C23A' },
                    { offset: 1, color: '#95D475' }
                  ])
                },
                label: {
                  show: true,
                  position: 'top',
                  formatter: '{c}%'
                }
              }
            ]
          },
          true
      )

      this.$nextTick(() => {
        if (this.ageChart) this.ageChart.resize()
      })
    },

    renderEmptyTrendChart() {
      if (!this.trendChart) return

      this.trendChart.clear()

      this.trendChart.setOption(
          {
            tooltip: {
              trigger: 'axis'
            },

            grid: {
              left: '3%',
              right: '4%',
              bottom: '10%',
              top: '18%',
              containLabel: true
            },

            xAxis: {
              type: 'category',
              data: []
            },

            yAxis: {
              type: 'value',
              name: '患病率(%)',
              min: 0
            },

            series: [
              {
                name: '患病率',
                type: 'line',
                data: []
              }
            ],

            graphic: {
              type: 'text',
              left: 'center',
              top: 'middle',
              style: {
                text: '暂无趋势数据',
                fill: '#999',
                fontSize: 16
              }
            }
          },
          true
      )
    },

    renderEmptyAgeChart() {
      if (!this.ageChart) return

      this.ageChart.clear()

      this.ageChart.setOption(
          {
            tooltip: {
              trigger: 'axis'
            },

            grid: {
              left: '3%',
              right: '4%',
              bottom: '10%',
              top: '18%',
              containLabel: true
            },

            xAxis: {
              type: 'category',
              data: []
            },

            yAxis: {
              type: 'value',
              name: '患病率(%)',
              min: 0
            },

            series: [
              {
                name: '患病率',
                type: 'bar',
                data: []
              }
            ],

            graphic: {
              type: 'text',
              left: 'center',
              top: 'middle',
              style: {
                text: '暂无年龄段数据',
                fill: '#999',
                fontSize: 16
              }
            }
          },
          true
      )
    }
  }
}
</script>

<style scoped>
.trend-analysis {
  width: 100%;
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