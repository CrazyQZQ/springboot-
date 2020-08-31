package com.example.mybatisplusdemo.controller;


import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.OrderItem;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.mybatisplusdemo.entity.Book;
import com.example.mybatisplusdemo.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import org.springframework.stereotype.Controller;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 图书表 前端控制器
 * </p>
 *
 * @author qq
 * @since 2020-08-07
 */
@RestController
public class BookController {

    @Autowired
    private IBookService iBookService;

    @GetMapping("/book/{id}")
    public ResponseEntity<Book> getById(@PathVariable("id") String id){
        return new ResponseEntity<Book>(iBookService.getById(id),HttpStatus.OK);
    }

    @PutMapping("/book")
    public ResponseEntity<Book> update(Book book){
        iBookService.updateById(book);
        return new ResponseEntity<Book>(HttpStatus.OK);
    }

    @GetMapping("/books")
    public ResponseEntity<Page<Book>> getAllByPage(int pageNum, int pageSize){
        Page<Book> bookPage = new Page<>(pageNum, pageSize);
        ArrayList<OrderItem> orderItems = new ArrayList<>();
        orderItems.add(OrderItem.asc("number"));
        bookPage.setOrders(orderItems);
        Page<Book> page = iBookService.page(bookPage);
        return new ResponseEntity<Page<Book>>(page,HttpStatus.OK);
    }

    @PostMapping("book")
    public ResponseEntity<String> add(Book book) {
        iBookService.save(book);
        return new ResponseEntity<String>("success",HttpStatus.OK);
    }

    @DeleteMapping("/book/{id}")
    public ResponseEntity<String> delete(@PathVariable("id") String id) {
        iBookService.removeById(id);
        return new ResponseEntity<String>("success",HttpStatus.OK);
    }
}

