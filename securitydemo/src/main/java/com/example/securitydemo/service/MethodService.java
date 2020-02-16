package com.example.securitydemo.service;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/16 13:05
 */
@Service
public class MethodService {
    @PreAuthorize("hasRole('admin')")
    public String admin(){
        return "hello admin";
    }

    @Secured("ROLE_user")
    public String user(){
        return "hello user";
    }

    @PreAuthorize("hasAnyRole('admin','user')")
    public String hello(){
        return "hello hello";
    }
}
