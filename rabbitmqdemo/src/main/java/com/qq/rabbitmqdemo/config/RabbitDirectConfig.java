package com.qq.rabbitmqdemo.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.DirectExchange;
import org.springframework.amqp.core.Queue;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/24 16:31
 */
@Configuration
public class RabbitDirectConfig {
    public final static String DIRECTNAME = "log.exchange.direct";

    @Bean
    Queue queue() {
        return new Queue("logDirectQueue");
    }

    @Bean
    DirectExchange directExchange() {
        return new DirectExchange(DIRECTNAME, true, false);
    }

    @Bean
    Binding binding() {
        return BindingBuilder.bind(queue()).to(directExchange()).with("logDirectQueue");
    }
}
