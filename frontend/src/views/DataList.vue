<template>
  <div class="data-list">
    <el-card class="filter-card">
      <div slot="header" class="card-header">
        <span>查询条件</span>
        <el-button type="primary" size="small" @click="handleSearch">查询</el-button>
      </div>

      <el-form :model="queryParams" inline>
        <el-form-item label="省份">
          <el-select
              v-model="queryParams.regionId"
              placeholder="全部省份"
              clearable
          >
            <el-option
                v-for="item in provinces"
                :key="item.id"
                :label="item.regionName"
                :value="item.id"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="病种">
          <el-select
              v-model="queryParams.diseaseId"
              placeholder="全部病种"
              clearable
          >
            <el-option
                v-for="item in diseaseTypes"
                :key="item.id"
                :label="item.diseaseName"
                :value="item.id"
            />
          </el-select>
        </el-form-item>

        <el-form-item label="年份">
          <el-select
              v-model="queryParams.year"
              placeholder="全部年份"
              clearable
          >
            <el-option
                v-for="item in yearList"
                :key="item"
                :label="item"
                :value="item"
            />
          </el-select>
        </el-form-item>
      </el-form>
    </el-card>

    <el-card class="table-card">
      <el-table
          :data="tableData"
          border
          stripe
          v-loading="loading"
          style="width: 100%"
      >
        <el-table-column
            type="index"
            label="序号"
            width="60"
            align="center"
        />

        <el-table-column
            prop="regionName"
            label="省份"
            width="120"
        />

        <el-table-column
            prop="diseaseName"
            label="病种"
            width="160"
        />

        <el-table-column
            prop="year"
            label="年份"
            width="80"
            align="center"
        />

        <el-table-column
            prop="prevalenceRate"
            label="患病率(%)"
            width="120"
            align="center"
        >
          <template slot-scope="scope">
            <span :class="getRateClass(scope.row.prevalenceRate)">
              {{ formatRate(scope.row.prevalenceRate) }}
            </span>
          </template>
        </el-table-column>

        <el-table-column
            prop="incidenceRate"
            label="发病率(%)"
            width="120"
            align="center"
        >
          <template slot-scope="scope">
            {{ formatRate(scope.row.incidenceRate) }}
          </template>
        </el-table-column>

        <el-table-column
            prop="mortalityRate"
            label="死亡率(%)"
            width="120"
            align="center"
        >
          <template slot-scope="scope">
            {{ formatRate(scope.row.mortalityRate) }}
          </template>
        </el-table-column>

        <el-table-column
            prop="sampleSize"
            label="样本量"
            width="100"
            align="center"
        >
          <template slot-scope="scope">
            {{ scope.row.sampleSize || '-' }}
          </template>
        </el-table-column>

        <el-table-column
            prop="dataSource"
            label="数据来源"
            min-width="150"
        />
      </el-table>

      <div class="pagination-box">
        <el-pagination
            background
            layout="total, sizes, prev, pager, next, jumper"
            :total="total"
            :page-sizes="[10, 20, 50, 100]"
            :page-size="queryParams.size"
            :current-page="queryParams.current"
            @current-change="handleCurrentChange"
            @size-change="handleSizeChange"
        />
      </div>
    </el-card>
  </div>
</template>

<script>
import { getDiseaseDataPage } from '../api/disease'
import { getProvinces } from '../api/region'
import { getDiseaseTypes } from '../api/dashboard'
import { getYearList } from '../api/time'

export default {
  name: 'DataList',

  data() {
    return {
      loading: false,
      tableData: [],
      total: 0,

      provinces: [],
      diseaseTypes: [],
      yearList: [],

      queryParams: {
        current: 1,
        size: 10,
        regionId: null,
        diseaseId: null,
        year: null
      }
    }
  },

  mounted() {
    this.loadOptions()
    this.loadData()
  },

  methods: {
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

        if (data && data.records !== undefined) {
          return data.records
        }

        return data
      }

      if (res.rows !== undefined) {
        return res.rows
      }

      if (res.records !== undefined) {
        return res.records
      }

      return res
    },

    unwrapPageResponse(res) {
      if (!res) {
        return {
          records: [],
          total: 0
        }
      }

      let data = res

      if (data.data !== undefined) {
        data = data.data
      }

      if (data && data.data !== undefined) {
        data = data.data
      }

      return {
        records: data.records || data.list || data.rows || [],
        total: data.total || 0
      }
    },

    async loadOptions() {
      try {
        const [provincesRes, typesRes, yearsRes] = await Promise.all([
          getProvinces(),
          getDiseaseTypes(),
          getYearList()
        ])

        this.provinces = this.unwrapResponse(provincesRes)
        this.diseaseTypes = this.unwrapResponse(typesRes)

        const years = this.unwrapResponse(yearsRes)

        this.yearList = Array.isArray(years)
            ? years.map(item => {
              if (typeof item === 'number') {
                return item
              }

              if (typeof item === 'string') {
                return Number(item)
              }

              return item.year || item.yearValue
            }).filter(item => item !== null && item !== undefined && item !== '')
            : []
      } catch (error) {
        console.error('加载选项失败', error)
        this.$message.error('加载筛选条件失败')
      }
    },

    async loadData() {
      this.loading = true

      try {
        const result = await getDiseaseDataPage(this.queryParams)
        const pageData = this.unwrapPageResponse(result)

        this.tableData = pageData.records
        this.total = pageData.total
      } catch (error) {
        console.error('加载数据失败', error)
        this.$message.error('加载数据失败')
      } finally {
        this.loading = false
      }
    },

    handleSearch() {
      this.queryParams.current = 1
      this.loadData()
    },

    handleCurrentChange(page) {
      this.queryParams.current = page
      this.loadData()
    },

    handleSizeChange(size) {
      this.queryParams.size = size
      this.queryParams.current = 1
      this.loadData()
    },

    formatRate(rate) {
      if (rate === null || rate === undefined || rate === '') {
        return '-'
      }

      return rate + '%'
    },

    getRateClass(rate) {
      const value = Number(rate)

      if (Number.isNaN(value)) {
        return ''
      }

      if (value >= 25) return 'rate-high'
      if (value >= 15) return 'rate-medium'

      return 'rate-low'
    }
  }
}
</script>

<style scoped>
.data-list {
  padding: 20px;
}

.filter-card {
  margin-bottom: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.table-card {
  min-height: 500px;
}

.pagination-box {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}

.rate-high {
  color: #f56c6c;
  font-weight: bold;
}

.rate-medium {
  color: #e6a23c;
  font-weight: bold;
}

.rate-low {
  color: #67c23a;
}
</style>