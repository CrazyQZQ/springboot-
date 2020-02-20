package com.example.mybatisdemo.mapper;

import com.example.mybatisdemo.bean.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/20 13:23
 */
@Component
@Mapper
public interface UserMapper {
    List<User> getAllUser();

    Integer addUser(User user);

    Integer updateUserById(User user);

    Integer deleteUserById(Integer id);
}
