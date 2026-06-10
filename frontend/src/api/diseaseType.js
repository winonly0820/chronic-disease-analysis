import request from './index'

/**
 * 获取所有慢性病类型
 */
export function getDiseaseTypes() {
  return request({
    url: '/disease-type/list',
    method: 'get'
  })
}

/**
 * 根据ID获取慢性病类型详情
 */
export function getDiseaseTypeById(id) {
  return request({
    url: `/disease-type/${id}`,
    method: 'get'
  })
}

/**
 * 根据编码获取慢性病类型
 */
export function getDiseaseTypeByCode(code) {
  return request({
    url: `/disease-type/code/${code}`,
    method: 'get'
  })
}
