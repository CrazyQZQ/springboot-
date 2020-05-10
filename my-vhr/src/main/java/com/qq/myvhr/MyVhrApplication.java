package com.qq.myvhr;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages = "com.qq.myvhr.mapper")
public class MyVhrApplication {

    public static void main(String[] args) {
        SpringApplication.run(MyVhrApplication.class, args);
    }

}
