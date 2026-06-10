<template>
  <div class="dashboard">
    <!-- 统计卡片 -->
    <el-row :gutter="20" class="stat-row">
      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-content">
            <div class="stat-info">
              <span class="stat-title">覆盖省份</span>
              <span class="stat-value">{{ statistics.provinceCount || 0 }}</span>
            </div>
            <i class="el-icon-location stat-icon" style="color: #409eff"></i>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-content">
            <div class="stat-info">
              <span class="stat-title">病种类型</span>
              <span class="stat-value">{{ statistics.diseaseCount || 0 }}</span>
            </div>
            <i class="el-icon-s-opportunity stat-icon" style="color: #67c23a"></i>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-content">
            <div class="stat-info">
              <span class="stat-title">数据年份</span>
              <span class="stat-value">{{ statistics.yearRange || '-' }}</span>
            </div>
            <i class="el-icon-time stat-icon" style="color: #e6a23c"></i>
          </div>
        </el-card>
      </el-col>

      <el-col :span="6">
        <el-card shadow="hover" class="stat-card">
          <div class="stat-content">
            <div class="stat-info">
              <span class="stat-title">数据记录</span>
              <span class="stat-value">{{ statistics.dataCount || 0 }}</span>
            </div>
            <i class="el-icon-document stat-icon" style="color: #f56c6c"></i>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <!-- 图表区域 -->
    <el-row :gutter="20">
      <el-col :span="24">
        <el-card class="chart-card">
          <div slot="header" class="card-header">
            <span>各省份患病率分布（Top10）</span>

            <el-select
                v-model="selectedDisease"
                size="small"
                placeholder="选择病种"
                @change="updateChart"
            >
              <el-option
                  v-for="item in diseaseTypes"
                  :key="item.diseaseCode"
                  :label="item.diseaseName"
                  :value="item.diseaseCode"
              />
            </el-select>
          </div>

          <div ref="barChart" class="chart-container"></div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import * as echarts from 'echarts'
import { getStatistics, getDiseaseTypes } from '../api/dashboard'
import { getPrevalenceByProvince } from '../api/disease'

export default {
  name: 'Dashboard',

  data() {
    return {
      statistics: {},
      diseaseTypes: [],
      selectedDisease: 'HYP',
      currentYear: 2024,
      barChart: null,
      resizeHandler: null
    }
  },

  mounted() {
    this.$nextTick(() => {
      this.initChart()
      this.loadData()
    })
  },

  beforeDestroy() {
    if (this.resizeHandler) {
      window.removeEventListener('resize', this.resizeHandler)
      this.resizeHandler = null
    }

    if (this.barChart) {
      this.barChart.dispose()
      this.barChart = null
    }
  },

  methods: {
    initChart() {
      if (!this.$refs.barChart) {
        console.error('图表容器不存在')
        return
      }

      this.barChart = echarts.init(this.$refs.barChart)

      this.resizeHandler = () => {
        if (this.barChart) {
          this.barChart.resize()
        }
      }

      window.addEventListener('resize', this.resizeHandler)
    },

    async loadData() {
      try {
        /**
         * 注意：
         * 你的 api/index.js 响应拦截器已经 return res.data
         * 所以这里拿到的 stats、types 都已经是后端 data 字段里的真实数据
         */

        const stats = await getStatistics()
        this.statistics = stats || {}
        console.log('统计数据：', stats)

        const types = await getDiseaseTypes()
        this.diseaseTypes = Array.isArray(types) ? types : []
        console.log('病种类型：', this.diseaseTypes)

        // 如果默认的 HYP 不存在，则自动选择第一个病种
        if (
            this.diseaseTypes.length > 0 &&
            !this.diseaseTypes.some(item => item.diseaseCode === this.selectedDisease)
        ) {
          this.selectedDisease = this.diseaseTypes[0].diseaseCode
        }

        await this.loadProvinceData()
      } catch (error) {
        console.error('加载数据失败：', error)
      }
    },

    async loadProvinceData() {
      try {
        if (!this.barChart) {
          console.error('图表不存在')
          return
        }

        console.log('开始加载省份数据，病种：', this.selectedDisease, '年份：', this.currentYear)

        /**
         * 由于 api/index.js 已经 return res.data
         * 所以这里的 res 应该直接就是数组：
         * [
         *   { regionName: '广东省', prevalence: 28.8 },
         *   ...
         * ]
         */
        const res = await getPrevalenceByProvince(this.selectedDisease, this.currentYear)

        console.log('省份患病率接口返回：', res)
        console.log('是否数组：', Array.isArray(res))

        if (!Array.isArray(res) || res.length === 0) {
          this.renderEmptyChart()
          return
        }

        const sortedData = res
            .map(item => ({
              name: item.regionName,
              value: Number(item.prevalence)
            }))
            .filter(item => item.name && !Number.isNaN(item.value))
            .sort((a, b) => b.value - a.value)

        const top10 = sortedData.slice(0, 10)

        const top10Names = top10.map(item => item.name)
        const top10Data = top10.map(item => item.value)

        console.log('Top10省份：', top10Names)
        console.log('Top10患病率：', top10Data)

        // 关键：先清空旧配置，避免旧 series 和新 series 合并异常
        this.barChart.clear()

        this.barChart.setOption(
            {
              title: {
                text: '各省份患病率分布',
                subtext: '病种：' + this.selectedDisease + '，年份：' + this.currentYear,
                left: 'center',
                top: 10
              },

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
                bottom: '16%',
                top: '22%',
                containLabel: true
              },

              xAxis: {
                type: 'category',
                data: top10Names,
                axisTick: {
                  alignWithLabel: true
                },
                axisLabel: {
                  rotate: 45,
                  fontSize: 10
                }
              },

              yAxis: {
                type: 'value',
                name: '患病率(%)',
                min: 0,
                max: function(value) {
                  return Math.ceil(value.max + 2)
                },
                splitLine: {
                  show: true
                }
              },

              series: [
                {
                  name: '患病率',
                  type: 'bar',
                  data: top10Data,
                  barWidth: 35,
                  barMinHeight: 5,
                  itemStyle: {
                    color: '#409EFF'
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
          if (this.barChart) {
            this.barChart.resize()
          }
        })

        console.log('图表更新完成')
      } catch (error) {
        console.error('加载省份数据失败：', error)
      }
    },

    renderEmptyChart() {
      console.warn('没有省份患病率数据')

      if (!this.barChart) return

      this.barChart.clear()

      this.barChart.setOption(
          {
            title: {
              text: '各省份患病率分布',
              subtext: '暂无数据',
              left: 'center',
              top: 10
            },

            grid: {
              left: '3%',
              right: '4%',
              bottom: '16%',
              top: '22%',
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
                text: '暂无数据',
                fill: '#999',
                fontSize: 18
              }
            }
          },
          true
      )
    },

    async updateChart() {
      console.log('切换病种：', this.selectedDisease)
      await this.loadProvinceData()
    }
  }
}
</script>

<style scoped>
.dashboard {
  padding: 0;
}

.stat-row {
  margin-bottom: 20px;
}

.stat-card {
  height: 120px;
}

.stat-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  height: 100%;
}

.stat-info {
  display: flex;
  flex-direction: column;
}

.stat-title {
  font-size: 14px;
  color: #909399;
  margin-bottom: 10px;
}

.stat-value {
  font-size: 28px;
  font-weight: bold;
  color: #303133;
}

.stat-icon {
  font-size: 48px;
  opacity: 0.8;
}

.chart-card {
  height: 480px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.chart-container {
  width: 100%;
  height: 390px;
}
</style>