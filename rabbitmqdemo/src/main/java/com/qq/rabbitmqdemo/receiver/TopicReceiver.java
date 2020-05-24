package com.qq.rabbitmqdemo.receiver;

import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.stereotype.Component;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/5/24 17:03
 */
@Component
public class TopicReceiver {
    @RabbitListener(queues = "xiaomi")
    public void handlerXiaomi(String msg) {
        System.out.println("handlerXiaomi >>" + msg);
    }

    @RabbitListener(queues = "huawei")
    public void handlerHuawei(String msg) {
        System.out.println("handlerHuawei >>" + msg);
    }

    @RabbitListener(queues = "phone")
    public void handlerPhone(String msg) {
        System.out.println("handlerPhone >>" + msg);
    }
}
