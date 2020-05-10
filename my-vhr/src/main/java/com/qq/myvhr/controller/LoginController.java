package com.qq.myvhr.controller;

import com.qq.myvhr.model.RespBean;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/10 19:00
 */
@RestController
public class LoginController {
    @GetMapping("login")
    public RespBean login() {
        return RespBean.error("尚未登录，请登录");
    }
}
