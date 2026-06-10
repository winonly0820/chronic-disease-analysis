import request from './index'

/**
 * 获取所有年份列表
 */
export function getYearList() {
  return request({
    url: '/time/years',
    method: 'get'
  })
}

/**
 * 根据年份获取季度列表
 */
export function getQuarterListByYear(year) {
  return request({
    url: `/time/quarters/${year}`,
    method: 'get'
  })
}
