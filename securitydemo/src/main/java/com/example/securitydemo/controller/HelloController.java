package com.example.securitydemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.securitydemo.service.MethodService;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/14 10:15
 */
@RestController
public class HelloController {
    @Autowired
    MethodService methodService;

    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }

    @GetMapping("/admin/hello")
    public String adminHello() {
        return "adminHello";
    }

    @GetMapping("/user/hello")
    public String userHello() {
        return "userHello";
    }

    @GetMapping("hello1")
    public String hello1() {
        return methodService.admin();
    }

    @GetMapping("hello2")
    public String hello2() {
        return methodService.user();
    }

    @GetMapping("hello3")
    public String hello3() {
        return methodService.hello();
    }

}
