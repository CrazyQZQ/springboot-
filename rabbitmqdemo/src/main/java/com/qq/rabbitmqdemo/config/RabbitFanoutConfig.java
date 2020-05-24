package com.qq.rabbitmqdemo.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.FanoutExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/24 16:47
 */
@Configuration
public class RabbitFanoutConfig {
    public static final String FANOUTNAME = "qq-fanout";

    @Bean
    Queue queueOne() {
        return new Queue("queue-one");
    }

    @Bean
    Queue queueTwo() {
        return new Queue("queue-two");
    }

    @Bean
    FanoutExchange fanoutExchange() {
        return new FanoutExchange(FANOUTNAME,true,false);
    }

    @Bean
    Binding bindingOne() {
        return BindingBuilder.bind(queueOne()).to(fanoutExchange());
    }

    @Bean
    Binding bindingTwo() {
        return BindingBuilder.bind(queueTwo()).to(fanoutExchange());
    }
}
