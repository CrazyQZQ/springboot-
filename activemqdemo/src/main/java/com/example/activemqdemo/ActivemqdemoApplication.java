package com.example.activemqdemo;

import org.apache.activemq.command.ActiveMQQueue;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import javax.jms.Queue;

@SpringBootApplication
public class ActivemqdemoApplication {

    public static void main(String[] args) {
        SpringApplication.run(ActivemqdemoApplication.class, args);
    }

    @Bean
    Queue queue() {
        return new ActiveMQQueue("Hello.qq");
    }

}
