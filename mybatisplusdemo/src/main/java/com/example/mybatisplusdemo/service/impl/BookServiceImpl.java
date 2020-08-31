package com.example.mybatisplusdemo.service.impl;

import com.example.mybatisplusdemo.entity.Book;
import com.example.mybatisplusdemo.mapper.BookMapper;
import com.example.mybatisplusdemo.service.IBookService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 图书表 服务实现类
 * </p>
 *
 * @author qq
 * @since 2020-08-07
 */
@Service
public class BookServiceImpl extends ServiceImpl<BookMapper, Book> implements IBookService {

}
