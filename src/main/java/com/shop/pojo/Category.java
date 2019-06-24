package com.shop.pojo;

import java.util.List;

public class Category {
    /*
    * 类别id
    * */
    private Integer id;
    /*
    * 类别名称
    * */
    private String name;
    /*
    * 对应厂商id
    * */
    private Integer fid;
    /*
    * 类别下的商品列表
    * */
    private List<Product> products;

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

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Integer getFid() {
        return fid;
    }

    public void setFid(Integer fid) {
        this.fid = fid;
    }
}
