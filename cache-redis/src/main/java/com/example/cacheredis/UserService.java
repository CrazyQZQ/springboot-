package com.example.cacheredis;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/13 12:20
 */
@Service
public class UserService {
    @Cacheable(cacheNames = "c1")
    public User getUserById(Integer id) {
        System.out.println("getUser>>"+id);
        User user = new User();
        user.setId(id);
        return user;
    }

    /**
     * 删除后清除缓存
     * @param id
     */
    @CacheEvict(cacheNames = "c1")
    public void deleteUser(Integer id) {
        System.out.println("deleteUser>>"+id);
    }

    /**
     * 更新后刷新缓存
     * @param user
     */
    @CachePut(cacheNames = "c1",key = "#user.id")
    public void updateUser(User user) {
        System.out.println("updateUser>>"+user.getId());
    }
}
