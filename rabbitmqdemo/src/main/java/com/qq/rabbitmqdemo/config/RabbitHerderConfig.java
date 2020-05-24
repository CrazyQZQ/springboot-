package com.qq.rabbitmqdemo.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.HeadersExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.HashMap;
import java.util.Map;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/24 17:12
 */
@Configuration
public class RabbitHerderConfig {
    public static final String  HEADERBAME ="qq-header";

    @Bean
    HeadersExchange headersExchange () {
        return new HeadersExchange(HEADERBAME,true,false);
    }

    @Bean
    Queue queueName() {
        return new Queue("queue-name");
    }
    @Bean
    Queue queueAge() {
        return new Queue("queue-age");
    }

    @Bean
    Binding bindingName() {
        Map<String,Object> map = new HashMap<>();
        map.put("name","qq");
        return BindingBuilder.bind(queueName()).to(headersExchange()).whereAny(map).match();
    }

    @Bean
    Binding bindingAge() {
        return BindingBuilder.bind(queueName()).to(headersExchange()).where("age").exists();
    }

}
