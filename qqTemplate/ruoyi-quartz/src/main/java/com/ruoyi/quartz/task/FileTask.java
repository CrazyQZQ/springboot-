package com.ruoyi.quartz.task;

import cn.hutool.core.io.FileUtil;
import com.ruoyi.common.config.RuoYiConfig;
import org.springframework.stereotype.Component;

/**
 * 文件定时任务
 */
@Component("FileTask")
public class FileTask {
    /**
     * 删除试卷导出的临时文件
     */
    public void deleteTempFile(){
        String tempPath = RuoYiConfig.getTempPath();
        System.out.println("删除文件夹："+tempPath);
        boolean del = FileUtil.del(tempPath);
        System.out.println("删除文件夹："+del);
    }
}
