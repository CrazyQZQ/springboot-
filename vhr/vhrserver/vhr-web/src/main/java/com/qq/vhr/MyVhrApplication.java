package com.qq.vhr;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;

@SpringBootApplication
@EnableCaching
@MapperScan(basePackages = "com.qq.vhr.mapper")
public class MyVhrApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyVhrApplication.class, args);
    }

}
