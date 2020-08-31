package com.example.mybatisplusdemo.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 图书表
 * </p>
 *
 * @author qq
 * @since 2020-08-07
 */
public class Book extends Model<Book> {

    private static final long serialVersionUID=1L;

    /**
     * 图书ID
     */
    @TableId(value = "book_id", type = IdType.AUTO)
    private Long bookId;

    /**
     * 图书名称
     */
    private String name;

    /**
     * 馆藏数量
     */
    private Integer number;


    public Long getBookId() {
        return bookId;
    }

    public void setBookId(Long bookId) {
        this.bookId = bookId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    @Override
    protected Serializable pkVal() {
        return this.bookId;
    }

    @Override
    public String toString() {
        return "Book{" +
        "bookId=" + bookId +
        ", name=" + name +
        ", number=" + number +
        "}";
    }
}
