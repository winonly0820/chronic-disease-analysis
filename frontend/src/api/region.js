import request from './index'

/**
 * 获取所有省份列表
 */
export function getProvinces() {
  return request({
    url: '/region/provinces',
    method: 'get'
  })
}

/**
 * 根据父级编码获取下级地区列表
 */
export function getChildren(parentCode) {
  return request({
    url: `/region/children/${parentCode}`,
    method: 'get'
  })
}

/**
 * 获取地区树形结构
 */
export function getRegionTree() {
  return request({
    url: '/region/tree',
    method: 'get'
  })
}

/**
 * 根据ID获取地区详情
 */
export function getRegionById(id) {
  return request({
    url: `/region/${id}`,
    method: 'get'
  })
}
