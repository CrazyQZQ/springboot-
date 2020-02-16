package com.example.securitydb.mapper;

import com.example.securitydb.bean.Role;
import com.example.securitydb.bean.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/16 13:42
 */
@Mapper
public interface UserMapper {
    User loadUserByUsername(String username);

    List<Role> getRolesById(Integer id);
}
