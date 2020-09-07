import request from '@/utils/request'

// 查询【请填写功能名称】列表
export function listSubject(query) {
  return request({
    url: '/exams/subject/list',
    method: 'get',
    params: query
  })
}

// 查询【请填写功能名称】详细
export function getSubject(subjectId) {
  return request({
    url: '/exams/subject/' + subjectId,
    method: 'get'
  })
}

// 新增【请填写功能名称】
export function addSubject(data) {
  return request({
    url: '/exams/subject',
    method: 'post',
    data: data
  })
}

// 修改【请填写功能名称】
export function updateSubject(data) {
  return request({
    url: '/exams/subject',
    method: 'put',
    data: data
  })
}

// 删除【请填写功能名称】
export function delSubject(subjectId) {
  return request({
    url: '/exams/subject/' + subjectId,
    method: 'delete'
  })
}

// 导出【请填写功能名称】
export function exportSubject(query) {
  return request({
    url: '/exams/subject/export',
    method: 'get',
    params: query
  })
}
