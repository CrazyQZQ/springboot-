package com.example.cacheredis;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CacheRedisApplicationTests {

    @Autowired
    UserService userService;
    @Test
    void contextLoads() {
        User u1 = userService.getUserById(1);
        User u2 = userService.getUserById(1);
        System.out.println(u1);
        System.out.println(u1);
    }

}
