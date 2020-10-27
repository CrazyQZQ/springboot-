package com.qq.rabbitmqdemo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class RabbitmqdemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(RabbitmqdemoApplication.class, args);
    }

}
