import request from './index'

/**
 * 分页查询慢性病数据
 */
export function getDiseaseDataPage(params) {
  return request({
    url: '/disease/page',
    method: 'get',
    params
  })
}

/**
 * 获取各省份患病率统计
 */
export function getPrevalenceByProvince(diseaseCode, year) {
  return request({
    url: '/disease/prevalence/province',
    method: 'get',
    params: { diseaseCode, year }
  })
}

/**
 * 获取患病率趋势数据
 */
export function getPrevalenceTrend(regionId, diseaseCode) {
  return request({
    url: '/disease/prevalence/trend',
    method: 'get',
    params: { regionId, diseaseCode }
  })
}

/**
 * 获取各年龄段患病率分布
 */
export function getPrevalenceByAgeGroup(regionId, diseaseCode, year) {
  return request({
    url: '/disease/prevalence/age',
    method: 'get',
    params: { regionId, diseaseCode, year }
  })
}

/**
 * 获取各病种患病率对比
 */
export function getDiseaseComparison(regionId, year) {
  return request({
    url: '/disease/comparison',
    method: 'get',
    params: { regionId, year }
  })
}

/**
 * 获取全国患病率Top10
 */
export function getTop10Prevalence(diseaseCode, year) {
  return request({
    url: '/disease/top10',
    method: 'get',
    params: { diseaseCode, year }
  })
}
