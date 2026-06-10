import request from './index'

/**
 * 获取所有年龄段列表
 */
export function getAgeGroupList() {
  return request({
    url: '/population/age-groups',
    method: 'get'
  })
}

/**
 * 获取所有性别列表
 */
export function getGenderList() {
  return request({
    url: '/population/genders',
    method: 'get'
  })
}
