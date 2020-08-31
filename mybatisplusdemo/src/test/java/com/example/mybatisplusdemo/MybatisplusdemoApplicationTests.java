package com.example.mybatisplusdemo;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.mybatisplusdemo.entity.Book;
import com.example.mybatisplusdemo.service.IBookService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MybatisplusdemoApplicationTests {
    @Autowired
    IBookService bookService;
    @Test
    void contextLoads() {
//        bookService.getById(1000);
        IPage<Book> bookIPage = new Page<>(1,1);
        IPage<Book> page = bookService.page(bookIPage);
        page.getRecords().forEach(book -> {
            System.out.println(book.getName());
        });
        int count = bookService.count();
        System.out.println(count);
    }

}
