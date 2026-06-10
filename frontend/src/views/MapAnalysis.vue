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
          </el-form>
        </el-card>

        <el-card class="legend-card">
          <div slot="header">
            <span>图例</span>
          </div>

          <div class="legend">
            <div
                class="legend-item"
                v-for="(item, index) in legendData"
                :key="index"
            >
              <span
                  class="legend-color"
                  :style="{ backgroundColor: item.color }"
              ></span>
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

echarts.registerMap('china', chinaJson)

export default {
  name: 'MapAnalysis',

  data() {
    return {
      mapChart: null,
      resizeHandler: null,

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
    this.$nextTick(() => {
      this.initChart()
      this.loadDiseaseTypes()
      this.loadData()
    })
  },

  beforeDestroy() {
    if (this.resizeHandler) {
      window.removeEventListener('resize', this.resizeHandler)
      this.resizeHandler = null
    }

    if (this.mapChart) {
      this.mapChart.dispose()
      this.mapChart = null
    }
  },

  methods: {
    initChart() {
      if (!this.$refs.mapChart) {
        console.error('地图容器不存在')
        return
      }

      this.mapChart = echarts.init(this.$refs.mapChart)

      this.mapChart.setOption({
        title: {
          text: '中国居民慢性病患病率分布',
          subtext: '数据来源：数据库',
          left: 'center',
          top: 10
        },

        tooltip: {
          trigger: 'item',
          formatter: function(params) {
            if (params.value === undefined || params.value === null || isNaN(params.value)) {
              return params.name + '<br/>暂无数据'
            }
            return params.name + '<br/>患病率：' + params.value + '%'
          }
        },

        visualMap: {
          min: 0,
          max: 30,
          left: 20,
          bottom: 30,
          text: ['高', '低'],
          calculable: true,
          inRange: {
            color: ['#fee5d9', '#fcbba1', '#fc9272', '#fb6a4a', '#ef3b2c']
          }
        },

        series: [
          {
            name: '患病率',
            type: 'map',
            map: 'china',
            roam: true,
            zoom: 1.2,
            emphasis: {
              label: {
                show: true
              }
            },
            label: {
              show: true,
              fontSize: 9
            },
            itemStyle: {
              borderColor: '#ffffff',
              borderWidth: 1,
              areaColor: '#f5f5f5'
            },
            data: []
          }
        ]
      })

      this.resizeHandler = () => {
        if (this.mapChart) {
          this.mapChart.resize()
        }
      }

      window.addEventListener('resize', this.resizeHandler)
    },

    async loadDiseaseTypes() {
      try {
        const types = await getDiseaseTypes()

        console.log('病种类型：', types)

        this.diseaseTypes = Array.isArray(types) ? types : []

        if (
            this.diseaseTypes.length > 0 &&
            !this.diseaseTypes.some(item => item.diseaseCode === this.queryParams.diseaseCode)
        ) {
          this.queryParams.diseaseCode = this.diseaseTypes[0].diseaseCode
        }
      } catch (error) {
        console.error('加载病种类型失败：', error)
      }
    },

    async loadData() {
      try {
        if (!this.mapChart) {
          console.error('地图实例不存在')
          return
        }

        const res = await getPrevalenceByProvince(
            this.queryParams.diseaseCode,
            this.queryParams.year
        )

        console.log('地图接口返回数据：', res)
        console.log('是否数组：', Array.isArray(res))

        let mapData = []

        if (Array.isArray(res)) {
          mapData = res.map(item => ({
            // 关键：这里不要去掉“省 / 市 / 自治区”
            name: item.regionName,
            value: Number(item.prevalence)
          }))
        }

        console.log('地图最终数据：', mapData)

        this.mapChart.clear()

        this.mapChart.setOption({
          title: {
            text: '中国居民慢性病患病率分布',
            subtext: '病种：' + this.queryParams.diseaseCode + '，年份：' + this.queryParams.year,
            left: 'center',
            top: 10
          },

          tooltip: {
            trigger: 'item',
            formatter: function(params) {
              if (
                  params.value === undefined ||
                  params.value === null ||
                  isNaN(params.value)
              ) {
                return params.name + '<br/>暂无数据'
              }
              return params.name + '<br/>患病率：' + params.value + '%'
            }
          },

          visualMap: {
            min: 0,
            max: 30,
            left: 20,
            bottom: 30,
            text: ['高', '低'],
            calculable: true,
            inRange: {
              color: ['#fee5d9', '#fcbba1', '#fc9272', '#fb6a4a', '#ef3b2c']
            }
          },

          series: [
            {
              name: '患病率',
              type: 'map',
              map: 'china',
              roam: true,
              zoom: 1.2,
              label: {
                show: true,
                fontSize: 9
              },
              emphasis: {
                label: {
                  show: true
                }
              },
              itemStyle: {
                borderColor: '#ffffff',
                borderWidth: 1,
                areaColor: '#f5f5f5'
              },
              data: mapData
            }
          ]
        }, true)

        this.$nextTick(() => {
          if (this.mapChart) {
            this.mapChart.resize()
          }
        })
      } catch (error) {
        console.error('加载地图数据失败：', error)
      }
    },

    formatProvinceName(name) {
      if (!name) return ''

      return name
          .replace('省', '')
          .replace('市', '')
          .replace('自治区', '')
          .replace('壮族', '')
          .replace('回族', '')
          .replace('维吾尔', '')
          .replace('特别行政区', '')
    }
  }
}
</script>

<style scoped>
.map-analysis {
  width: 100%;
}

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

/* 关键：不要只写 height: 100%，直接给地图容器明确高度 */
.map-container {
  width: 100%;
  height: 560px;
}
</style>