package com.example.mybatisdemo.service;

import com.example.mybatisdemo.bean.Image_table;
import com.example.mybatisdemo.bean.User;
import com.example.mybatisdemo.mapper.Image_tableMapper;
import com.example.mybatisdemo.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/20 13:28
 */
@Service
public class ImageService {
    @Autowired
    Image_tableMapper image_tableMapper;

    public List<Image_table> getAllImages() {
        return image_tableMapper.getAllImages();
    }

    public int addImg(Image_table img){
        return image_tableMapper.addImage(img);
    }

}
