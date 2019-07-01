package com.shop.pojo;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

public class Product {
    /*
    * 商品id
    * */
    private Integer id;
    /*
    * 商品名称
    * */
    private String name;
    /*
    * 商品图片名称
    * */
    private String image;
    /*
    * 原始价格
    * */
    private float original_price;
    /*
    * 现在促销价格
    * */
    private float now_price;
    /*
    * 库存
    * */
    private Integer stock_number;
    /*
    * 对应种类id
    * */
    private Integer cid;
    /*
    * 添加日期
    * */
    private Date create_date;
    /*
    * 商品详细信息
    * */
    private String message;
    /*
    * 图片文件
    * */
    private MultipartFile file;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public float getOriginal_price() {
        return original_price;
    }

    public void setOriginal_price(float original_price) {
        this.original_price = original_price;
    }

    public float getNow_price() {
        return now_price;
    }

    public void setNow_price(float now_price) {
        this.now_price = now_price;
    }

    public Integer getStock_number() {
        return stock_number;
    }

    public void setStock_number(Integer stock_number) {
        this.stock_number = stock_number;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
}
