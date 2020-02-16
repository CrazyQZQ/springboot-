package com.example.cacheredis;

import lombok.Data;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author 秦强
 * @version 1.0
 * @date 2020/2/13 12:18
 */
@Data
@ToString
public class User implements Serializable {
    private Integer id;
    private String name;
    private String address;
}
