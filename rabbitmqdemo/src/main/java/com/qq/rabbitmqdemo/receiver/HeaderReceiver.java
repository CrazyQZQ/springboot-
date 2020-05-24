package com.qq.rabbitmqdemo.receiver;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/24 17:18
 */
@Component
public class HeaderReceiver {
    @RabbitListener(queues = "queue-name")
    public void handleName(byte[] msg) {
        System.out.println("handleName >> " + new String(msg, 0, msg.length));
    }

    @RabbitListener(queues = "queue-age")
    public void handleAge(byte[] msg) {
        System.out.println("handleAge >> " + new String(msg, 0, msg.length));
    }
}
