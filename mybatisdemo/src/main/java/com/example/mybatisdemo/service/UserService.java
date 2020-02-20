package com.example.mybatisdemo.service;

import com.example.mybatisdemo.bean.User;
import com.example.mybatisdemo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/20 13:28
 */
@Service
public class UserService {
    @Autowired
    UserMapper userMapper;

    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

}
