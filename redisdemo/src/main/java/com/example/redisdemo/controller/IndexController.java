package com.example.redisdemo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/11 10:13
 */

@RestController
public class IndexController {
    @Autowired
    StringRedisTemplate stringRedisTemplate;

    @GetMapping("/set")
    public void set() {
        ValueOperations<String, String> ops = stringRedisTemplate.opsForValue();
        ops.set("name","qq");
    }

    @GetMapping("/get")
    public void get() {
        ValueOperations<String, String> ops = stringRedisTemplate.opsForValue();
        String name = ops.get("name");
        System.out.println(name);
    }
}
