package com.ruoyi.common.utils.poi;

import com.qiniu.common.QiniuException;
import com.ruoyi.common.config.RuoYiConfig;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.redis.RedisCache;
import com.ruoyi.common.exception.CustomException;
import com.ruoyi.common.utils.QiNiuUploadUtil;
import org.apache.poi.poifs.filesystem.DirectoryEntry;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.io.*;
import java.util.*;

/**
 * Word相关处理
 *
 * @author qq
 */
@Component
public class WordUtil {
    private static final Logger log = LoggerFactory.getLogger(WordUtil.class);

    private static RedisCache redisCache;

    public static RedisCache getRedisCache() {
        return redisCache;
    }

    @Autowired
    public void setRedisCache(RedisCache redisCache) {
        WordUtil.redisCache = redisCache;
    }

    public static AjaxResult exportWord(String content) {
        content = handleImg(content);
        OutputStream out = null;
        POIFSFileSystem poifs = new POIFSFileSystem();
        try {
            //这里是必须要设置编码的，不然导出中文就会乱码。
            byte b[] = content.getBytes("utf-8");
            //将字节数组包装到流中
            ByteArrayInputStream bais = new ByteArrayInputStream(b);
            //生成word
            DirectoryEntry directory = poifs.getRoot();
            String filename = encodingFilename("word");
            directory.createDocument(filename, bais);
            out = new FileOutputStream(getAbsoluteFile(filename));
            poifs.writeFilesystem(out);
            return AjaxResult.success(filename);
        } catch (Exception e) {
            log.error("导出Word异常{}", e.getMessage());
            throw new CustomException("导出Word失败，请联系网站管理员！");
        } finally {
            if (poifs != null) {
                try {
                    poifs.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e1) {
                    e1.printStackTrace();
                }
            }
        }
    }

    /**
     * 将html字符串中img的base64转为本地文件路径或七牛云地址
     *
     * @param html
     * @return
     */
    private static String handleImg(String html) {
        Document doc = Jsoup.parse(html);
        Elements nodes = doc.body().children();
        Map<String, String> imgSrcMap = findImgBase64(nodes);
        html = html.replaceAll("\\+", "-");
        Iterator<Map.Entry<String, String>> iterator = imgSrcMap.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry<String, String> next = iterator.next();
            String key = next.getKey();
            key = key.replaceAll("\\+", "-");
            String value = next.getValue();
            html = html.replaceAll(key, value);
        }
        return html;
    }

    /**
     * 找到将html中的base64图片转为本地或七牛云地址映射
     * @param nodes
     * @return
     */
    private static Map<String, String> findImgBase64(Elements nodes) {
        Map<String, String> imgSrcMap = new HashMap<>();
        nodes.forEach(node -> {
            if (node.children().size() > 0) {
                Map<String, String> imgBase64 = findImgBase64(node.children());
                imgSrcMap.putAll(imgBase64);
            }
            if (node.tagName().equals("img")) {
                String imgBase64 = node.attr("src");
                String imgRealPath = getImgRealPath(imgBase64,false);
                imgSrcMap.put(imgBase64, imgRealPath);
            }
        });
        return imgSrcMap;
    }

    /**
     * 获取下载路径
     *
     * @param filename 文件名称
     */
    private static String getAbsoluteFile(String filename) {
        String downloadPath = RuoYiConfig.getDownloadPath() + filename;
        File desc = new File(downloadPath);
        if (!desc.getParentFile().exists()) {
            desc.getParentFile().mkdirs();
        }
        return downloadPath;
    }

    /**
     * 编码文件名
     */
    private static String encodingFilename(String filename) {
        filename = UUID.randomUUID().toString() + "_" + filename + ".docx";
        return filename;
    }

    /**
     * 通过imgUrl获取本地图片路径
     *
     * @param imgUrl imgUrl
     * @return {@link String}
     * @author qq
     * @date 2020/09/10
     */
    private static String getImgRealPath(String imgUrl,boolean local) {
        if (imgUrl.startsWith("data:")) {
            imgUrl = imgUrl.replace("data:;base64,", "");
            imgUrl = imgUrl.split("base64,")[1];
            // 判断缓存中是否存在
            Object cacheObject = redisCache.getCacheObject(imgUrl);
            if(!Objects.isNull(cacheObject)){
                log.info("缓存中已经存在 ：" + cacheObject);
                return (String)cacheObject;
            }
            // base64转本地图片
            byte[] bytes = Base64.getDecoder().decode(imgUrl);
            String fileName = UUID.randomUUID().toString() + ".png";
            // 保存到本地
            if(local){
                String path = RuoYiConfig.getTempPath() + "/" + fileName;
                File file = new File(path);
                if (!file.getParentFile().exists()) {
                    file.getParentFile().mkdirs();
                }
                copyByte2File(bytes, file);
                redisCache.setCacheObject(imgUrl,path);
                return path;
            }else { // 上传到七牛服务器
                QiNiuUploadUtil qiNiuUploadUtil = new QiNiuUploadUtil();
                try {
                    String path = qiNiuUploadUtil.uploadFile(bytes, fileName);
                    log.info("七牛文件上传成功 》》》》》》" + path);
                    redisCache.setCacheObject(imgUrl,path);
                    return path;
                } catch (QiniuException e) {
                    e.printStackTrace();
                }
            }
        }
        return imgUrl;
    }

    private static boolean copyByte2File(byte[] bytes, File file) {
        FileOutputStream out = null;
        try {
            //转化为输入流
            ByteArrayInputStream in = new ByteArrayInputStream(bytes);
            //写出文件
            byte[] buffer = new byte[1024];
            out = new FileOutputStream(file);
            //写文件
            int len = 0;
            while ((len = in.read(buffer)) != -1) {
                out.write(buffer, 0, len);
            }
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
