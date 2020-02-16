package com.example.securitydb.service;

import com.example.securitydb.bean.User;
import com.example.securitydb.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/16 13:42
 */
@Service
public class UserService implements UserDetailsService {

    @Autowired
    UserMapper userMapper;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userMapper.loadUserByUsername(username);
        if(user == null) {
            throw  new UsernameNotFoundException("用户不存在");
        }
        user.setRoles(userMapper.getRolesById(user.getId()));
        System.out.println(user.getUsername()+":"+user.getPassword());
        return user;
    }
}
