package com.example.activemqdemo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.annotation.JmsListener;
import org.springframework.jms.core.JmsMessagingTemplate;
import org.springframework.stereotype.Component;

import javax.jms.Queue;


/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/19 13:24
 */
@Component
public class JmsComponenet {
    @Autowired
    JmsMessagingTemplate jmsMessagingTemplate;
    @Autowired
    Queue queue;

    /**
     * 发消息 生产者
     * @param message
     */
    public void send(Message message) {
        jmsMessagingTemplate.convertAndSend(this.queue,message);
    }

    @JmsListener(destination = "Hello.qq")
    public void receive(Message message) {
        System.out.println(message);
    }

}
