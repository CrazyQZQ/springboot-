package com.qq.rabbitmqdemo.config;

import org.springframework.amqp.core.Binding;
import org.springframework.amqp.core.BindingBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.core.TopicExchange;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/24 16:57
 */
@Configuration
public class RabbitTopicConfig {
    public static final String TOPICNAME = "qq-topic";

    @Bean
    TopicExchange topicExchange() {
        return new TopicExchange(TOPICNAME,true,false);
    }

    @Bean
    Queue xiaomi() {
        return new Queue("xiaomi");
    }
    @Bean
    Queue huawei() {
        return new Queue("huawei");
    }
    @Bean
    Queue phone() {
        return new Queue("phone");
    }

    /**
     * routingKey以xiaomi开头转发到此队列
     * @return
     */
    @Bean
    Binding xiaomiBinding() {
        return BindingBuilder.bind(xiaomi()).to(topicExchange()).with("xiaomi.#");
    }

    /**
     * routingKey以huawei开头转发到此队列
     * @return
     */
    @Bean
    Binding huaweiBinding() {
        return BindingBuilder.bind(huawei()).to(topicExchange()).with("huawei.#");
    }

    /**
     * routingKey包含phone转发到此队列
     * @return
     */
    @Bean
    Binding phoneBinding() {
        return BindingBuilder.bind(phone()).to(topicExchange()).with("#.phone.#");
    }
}
