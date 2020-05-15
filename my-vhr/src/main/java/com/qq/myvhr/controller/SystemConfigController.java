package com.qq.myvhr.controller;

import com.qq.myvhr.model.Menu;
import com.qq.myvhr.model.RespBean;
import com.qq.myvhr.service.MenuSevice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/15 20:46
 */
@RestController
@RequestMapping("/system/config")
public class SystemConfigController {
    @Autowired
    MenuSevice menuSevice;
    @GetMapping("/menu")
    public List<Menu> getMenusByHrId() {
        return  menuSevice.getMenusByHrId();
    }
}
