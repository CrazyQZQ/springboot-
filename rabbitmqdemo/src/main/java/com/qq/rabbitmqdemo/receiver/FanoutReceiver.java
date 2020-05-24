package com.qq.rabbitmqdemo.receiver;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/24 16:52
 */
@Component
public class FanoutReceiver {
    @RabbitListener(queues = "queue-one")
    public void handler1(String msg) {
        System.out.println("handler1 >>>" +msg);
    }

    @RabbitListener(queues = "queue-two")
    public void handler2(String msg) {
        System.out.println("handle2 >>>" +msg);
    }
}
