package com.example.securitydb.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/16 14:15
 */
@RestController
public class HelloController {
    @GetMapping("hello")
    public String hello() {
        return "hello security";
    }
}
