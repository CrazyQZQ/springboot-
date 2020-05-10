import axios from "axios";
import {
  Message
} from "element-ui";

axios.interceptors.response.use(data => {
  if (success.status && success.status == 200 && success.data.status == 500) {
    Message.error({
      message: success.data.msg
    })
    return;
  }
  if (success.data.msg) {
    Message.success({
      message: success.data.msg
    })
  }
  return success.data;
}, error => {
  if (error.response.status == 504 || error.response.status == 404) {
    Message.error({
      message: '服务器被吃了( ╯□╰ )'
    })
  } else if (error.response.status == 403) {
    Message.error({
      message: '权限不足，请联系管理员'
    })
  } else if (error.response.status == 401) {
    Message.error({
      message: '尚未登录，请登录'
    })
    router.replace('/');
  } else {
    if (error.response.data.msg) {
      Message.error({
        message: error.response.data.msg
      })
    } else {
      Message.error({
        message: '未知错误!'
      })
    }
  }
  return;
})
