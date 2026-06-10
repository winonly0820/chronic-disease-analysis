import request from './index'

/**
 * 获取首页统计数据
 */
export function getStatistics() {
  return request({
    url: '/dashboard/statistics',
    method: 'get'
  })
}

/**
 * 获取所有病种列表
 */
export function getDiseaseTypes() {
  return request({
    url: '/dashboard/disease-types',
    method: 'get'
  })
}
