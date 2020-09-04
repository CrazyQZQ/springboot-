package com.example.redisdemo.controller;

import com.example.redisdemo.entity.User;
import com.example.redisdemo.service.RedisService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class UserController {
    private static final String MAPNAME="mapName";
    @Autowired
    private RedisService redisService;

    @GetMapping( "/HashSet")
    public Map<String, Object> addUser(){
        Map<String, Object> modelMap=new HashMap<String,Object>();
        User user=new User();
        user.setName("qq");
        user.setPassword("123");
        //存放hash值
        modelMap.put("name", user.getName());
        modelMap.put("password", user.getPassword());
        redisService.setKey(MAPNAME, modelMap);
        return redisService.getMapValue(MAPNAME);
    }

    @GetMapping( "/hashDelete")
    public Map<String, Object> deleteUser(){
        //获取即将删除的key值，这里我们做的批量删除
        List<String> keys=new ArrayList<>();
        keys.add("heheanme");
        //开始执行删除操作
        redisService.deleteData(keys);
        //获取map集合
        Map<String, Object> modelMap1= redisService.getMapValue(MAPNAME);
        Object value= redisService.getValue(MAPNAME, "name");
        System.out.println(" value : "+value);
        modelMap1.put("从缓存中根据key取到的value", value);
        return modelMap1;
    }
    
    @GetMapping("/hashGet")
    public Map<String, Object> getUser() {
        return redisService.getMapValue(MAPNAME);
    }
    
}
