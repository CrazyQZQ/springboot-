package com.example.mybatisdemo;

import com.example.mybatisdemo.bean.Image_table;
import com.example.mybatisdemo.service.ImageService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@SpringBootTest
class MybatisdemoApplicationTests {

    @Autowired
    ImageService imageService;

    @Test
    void contextLoads() {
        try {
            File imgDir = new File("F:\\ours\\11\\秦授和流氓");
            File[] files = imgDir.listFiles();
            for (int i = 0; i < files.length; i++) {
                Image_table img = new Image_table();
                img.setId(UUID.randomUUID().toString());
                img.setImg(Files.readAllBytes(files[i].toPath()));
                img.setDate(new Date());
                System.out.println(files[i].getName());
                int result = imageService.addImg(img);
                System.out.println(result);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
