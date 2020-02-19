package com.example.activemqdemo;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/19 13:26
 */
public class Message implements Serializable {
    private String content;
    private Date date;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Message{" +
                "content='" + content + '\'' +
                ", date=" + date +
                '}';
    }
}
