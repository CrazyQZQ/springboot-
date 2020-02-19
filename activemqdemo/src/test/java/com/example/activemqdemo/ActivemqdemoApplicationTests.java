package com.example.activemqdemo;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@SpringBootTest
class ActivemqdemoApplicationTests {

    @Autowired
    JmsComponenet jmsComponenet;

    @Test
    void contextLoads() {
        Message message = new Message();
        message.setContent("hello qq");
        message.setDate(new Date());
        jmsComponenet.send(message);

    }

}
