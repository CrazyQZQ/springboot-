package com.example.mybatisdemo;

import com.example.mybatisdemo.bean.User;
import com.example.mybatisdemo.service.UserService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class MybatisdemoApplicationTests {

    @Autowired
    UserService userService;

    @Test
    void contextLoads() {
        List<User> allUser = userService.getAllUser();
        for (User user : allUser) {
            System.out.println(user);
        }
    }

}
