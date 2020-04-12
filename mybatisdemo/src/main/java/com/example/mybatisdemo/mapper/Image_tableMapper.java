package com.example.mybatisdemo.mapper;

import com.example.mybatisdemo.bean.Image_table;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/4/12 14:16
 */
@Component
@Mapper
public interface Image_tableMapper {
    List<Image_table> getAllImages();

    Integer addImage(Image_table img);

    Integer updateImageById(Image_table img);

    Integer deleteImageById(String id);
}
