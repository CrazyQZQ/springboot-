package com.qq.rabbitmqdemo;

import com.qq.rabbitmqdemo.config.RabbitFanoutConfig;
import com.qq.rabbitmqdemo.config.RabbitHerderConfig;
import com.qq.rabbitmqdemo.config.RabbitTopicConfig;
import org.junit.jupiter.api.Test;
import org.springframework.amqp.core.Message;
import org.springframework.amqp.core.MessageBuilder;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.text.DateFormat;
import java.util.Date;

@SpringBootTest
class RabbitmqdemoApplicationTests {

    @Autowired
    RabbitTemplate rabbitTemplate;
    @Test
    void contextLoads() {
        rabbitTemplate.convertAndSend("hello.qq","hello qq");
    }

    @Test
    public void test() {
        rabbitTemplate.convertAndSend(RabbitFanoutConfig.FANOUTNAME,null,"hello Fanout");
    }

    @Test
    public void test2() {
        rabbitTemplate.convertAndSend(RabbitTopicConfig.TOPICNAME,"xiaomi.news","小米新闻");
//        rabbitTemplate.convertAndSend(RabbitTopicConfig.TOPICNAME,"huawei.news","华为新闻");
        rabbitTemplate.convertAndSend(RabbitTopicConfig.TOPICNAME,"vivo.phone","vivo 手机");
        rabbitTemplate.convertAndSend(RabbitTopicConfig.TOPICNAME,"huawei.phone","华为 手机");
    }

    @Test
    public void test3() {
        Message nameMsg = MessageBuilder.withBody("hello qq".getBytes()).setHeader("name","qq").build();
        Message ageMsg = MessageBuilder.withBody("hello 18".getBytes()).setHeader("age","18").build();
        rabbitTemplate.send(RabbitHerderConfig.HEADERBAME,null,nameMsg);
        rabbitTemplate.send(RabbitHerderConfig.HEADERBAME,null,ageMsg);
    }

    @Test
    void test4() {
        System.out.println(DateFormat.getDateTimeInstance().format(new Date()));
    }
}
