import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listQuestion(query) {
  return request({
    url: '/exams/question/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getQuestion(id) {
  return request({
    url: '/exams/question/' + id,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addQuestion(data) {
  return request({
    url: '/exams/question',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateQuestion(data) {
  return request({
    url: '/exams/question',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delQuestion(id) {
  return request({
    url: '/exams/question/' + id,
    method: 'delete'
  })
}

// 导出【请填写功能名称】
export function exportQuestion(query) {
  return request({
    url: '/exams/question/export',
    method: 'get',
    params: query
  })
}
