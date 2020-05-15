package com.qq.myvhr.service;

import com.qq.myvhr.mapper.MenuMapper;
import com.qq.myvhr.model.Hr;
import com.qq.myvhr.model.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/15 20:49
 */
@Service
public class MenuSevice {
    @Autowired
    MenuMapper menuMapper;
    public List<Menu> getMenusByHrId() {
        return menuMapper.getMenusByHrId(((Hr) SecurityContextHolder.getContext().getAuthentication().getPrincipal()).getId());
    }
}
