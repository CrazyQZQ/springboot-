package com.example.mybatisplusdemo.mapper;

import com.example.mybatisplusdemo.entity.Book;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 * 图书表 Mapper 接口
 * </p>
 *
 * @author qq
 * @since 2020-08-07
 */
@Mapper
public interface BookMapper extends BaseMapper<Book> {

}
