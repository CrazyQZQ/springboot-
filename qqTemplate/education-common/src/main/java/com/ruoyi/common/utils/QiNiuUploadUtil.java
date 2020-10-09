package com.ruoyi.common.utils;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.ruoyi.common.config.qiniu.QiNiuProp;
import org.springframework.beans.factory.annotation.Value;

import java.io.File;
import java.io.InputStream;

/**
 * 七牛文件上传
 *
 * @author qq
 */
public class QiNiuUploadUtil {
    //    @Value("${qiuniu.accessKey}")
    public String accessKey;
    //    @Value("${qiuniu.secretKey}")
    public String secretKey;
    //    @Value("${qiuniu.bucket}")
    public String bucket;
    //    @Value("${qiuniu.cdn}")
    public String cdn;

    private UploadManager uploadManager;

    private Auth auth;

    /**
     * 定义七牛云上传的相关策略
     */
    private StringMap putPolicy;

    {
        accessKey = QiNiuProp.getAccessKey();
        secretKey = QiNiuProp.getSecretKey();
        bucket = QiNiuProp.getBucket();
        cdn = QiNiuProp.getCdn();
        Configuration cfg = new Configuration(Region.region0());
        this.uploadManager = new UploadManager(cfg);
        this.auth = Auth.create(accessKey, secretKey);
        StringMap putPolicy = new StringMap();
        putPolicy.put("callbackBody", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"bucket\":\"$(bucket)\",\"fsize\":$(fsize)}");
        putPolicy.put("callbackBodyType", "application/json");
    }

    /**
     * 以文件的形式上传
     *
     * @param file
     * @return
     * @throws QiniuException
     */
    public String uploadFile(File file, String fileName) throws QiniuException {
        Response response = this.uploadManager.put(file, fileName, getUploadToken());
        int retry = 0;
        while (response.needRetry() && retry < 3) {
            response = this.uploadManager.put(file, fileName, getUploadToken());
            retry++;
        }
        if (response.statusCode == 200) {
            return new StringBuffer().append(cdn).append("/").append(fileName).toString();
        }
        return "上传失败!";
    }

    /**
     * 以字节数组的形式上传
     *
     * @param bytes
     * @return
     * @throws QiniuException
     */
    public String uploadFile(byte[] bytes, String fileName) throws QiniuException {
        String uploadToken = getUploadToken();
        Response response = this.uploadManager.put(bytes, fileName, uploadToken);
        int retry = 0;
        while (response.needRetry() && retry < 3) {
            response = this.uploadManager.put(bytes, fileName, uploadToken);
            retry++;
        }
        if (response.statusCode == 200) {
            return new StringBuffer().append(cdn).append("/").append(fileName).toString();
        }
        return "上传失败!";
    }

    /**
     * 以流的形式上传
     *
     * @param inputStream
     * @return
     * @throws QiniuException
     */
    public String uploadFile(InputStream inputStream, String fileName) throws QiniuException {
        String uploadToken = getUploadToken();
        Response response = this.uploadManager.put(inputStream, fileName, uploadToken, null, null);
        int retry = 0;
        while (response.needRetry() && retry < 3) {
            response = this.uploadManager.put(inputStream, fileName, uploadToken, null, null);
            retry++;
        }
        if (response.statusCode == 200) {
            return new StringBuffer().append(cdn).append("/").append(fileName).toString();
        }
        return "上传失败!";
    }

    /**
     * 删除七牛云上的相关文件
     * @param key
     * @return
     * @throws QiniuException
     */
//    public String delete(String key) throws QiniuException {
//        Response response = bucketManager.delete(this.bucket, key);
//        int retry = 0;
//        while (response.needRetry() && retry++ < 3) {
//            response = bucketManager.delete(bucket, key);
//        }
//        return response.statusCode == 200 ? "删除成功!" : "删除失败!";
//    }

    /**
     * 获取上传凭证
     *
     * @return
     */
    private String getUploadToken() {
        return this.auth.uploadToken(bucket, null, 3600, putPolicy);
    }
}
