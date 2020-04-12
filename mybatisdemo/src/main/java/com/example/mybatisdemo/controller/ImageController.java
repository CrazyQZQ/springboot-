package com.example.mybatisdemo.controller;

import com.example.mybatisdemo.bean.Image_table;
import com.example.mybatisdemo.service.ImageService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import sun.misc.BASE64Encoder;

import java.util.Base64;
import java.util.List;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/4/12 16:16
 */
@RestController
public class ImageController {
    @Autowired
    ImageService imageService;
    BASE64Encoder encoder = new BASE64Encoder();
    @GetMapping("/getImage")
    public Object getImage(@RequestParam("pageNo") Integer pageNo, @RequestParam("pageSize") Integer pageSize) {
        PageHelper.startPage(pageNo, pageSize);
        List<Image_table> allImages = imageService.getAllImages();
        for (int i = 0; i < allImages.size(); i++) {
            Image_table image_table = allImages.get(i);
            image_table.setBase64Img(encoder.encode(image_table.getImg()));
            image_table.setImg(null);
        }
        PageInfo<Image_table> pageInfo=new PageInfo<>(allImages);
        return pageInfo;
    }
}
