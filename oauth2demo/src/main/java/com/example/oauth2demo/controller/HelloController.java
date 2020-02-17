package com.example.oauth2demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/17 14:50
 */
@RestController
public class HelloController {
    @GetMapping("/admin/hello")
    public String adminHello() {
        return "hello admin";
    }

    @GetMapping("/user/hello")
    public String userHello() {
        return "hello user";
    }

    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }
}
