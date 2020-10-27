package com.qq.rabbitmqdemo.receiver;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/24 16:37
 */
//@Component
public class DirectReceiver {
    @RabbitListener(queues = "logDirectQueue")
    public void handler(String msg) {
        System.out.println("handler >>>" +msg);
    }
}
