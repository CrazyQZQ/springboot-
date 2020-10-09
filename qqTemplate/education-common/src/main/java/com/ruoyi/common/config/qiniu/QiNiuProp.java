package com.ruoyi.common.config.qiniu;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 读取七牛配置
 *
 * @author qq
 */
@Component
@ConfigurationProperties(prefix = "qiniu")
public class QiNiuProp {
    public static String accessKey;
    public static String secretKey;
    public static String bucket;
    public static String cdn;

    public static String getAccessKey() {
        return accessKey;
    }

    public void setAccessKey(String accessKey) {
        QiNiuProp.accessKey = accessKey;
    }

    public static String getSecretKey() {
        return secretKey;
    }

    public void setSecretKey(String secretKey) {
        QiNiuProp.secretKey = secretKey;
    }

    public static String getBucket() {
        return bucket;
    }

    public void setBucket(String bucket) {
        QiNiuProp.bucket = bucket;
    }

    public static String getCdn() {
        return cdn;
    }

    public void setCdn(String cdn) {
        QiNiuProp.cdn = cdn;
    }
}
