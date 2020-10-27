package com.example.rabbitdemo.service;

import com.example.rabbitdemo.entity.TestLog;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
//@Slf4j
public class MsgService {

    private static Logger logger = LoggerFactory.getLogger(MsgService.class);

//    @Scheduled(fixedRate = 3000)
    public void sendMessage() {
        TestLog testLog = new TestLog();
        testLog.setCreateTime(new Date());
        testLog.setMeg("测试日志打印");
        logger.info("==={}===={}","hello rabbitmq",testLog);
    }
}
