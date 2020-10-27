package com.qq.rabbitmqdemo.entity;


import java.text.DateFormat;
import java.util.Date;
public class TestLog {
    private Date createTime;
    private String meg;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getMeg() {
        return meg;
    }

    public void setMeg(String meg) {
        this.meg = meg;
    }

    @Override
    public String toString() {

        return "{" +
                "createTime=" + DateFormat.getDateTimeInstance().format(createTime) +
                ", meg='" + meg + '\'' +
                '}';
    }
}
