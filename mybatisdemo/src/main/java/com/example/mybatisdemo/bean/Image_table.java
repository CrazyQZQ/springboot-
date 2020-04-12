package com.example.mybatisdemo.bean;

import java.sql.Blob;
import java.util.Date;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/4/12 14:06
 */
public class Image_table {
    private String id;
    private byte[] img;
    private String base64Img;
    private Date date;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public byte[] getImg() {
        return img;
    }

    public void setImg(byte[] img) {
        this.img = img;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getBase64Img() {
        return base64Img;
    }

    public void setBase64Img(String base64Img) {
        this.base64Img = base64Img;
    }
}
