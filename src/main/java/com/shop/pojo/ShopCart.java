package com.shop.pojo;

public class ShopCart {
    /*
    * 购物车信息id
    * */
    private Integer id;
    /*
    * 购物车用户id
    * */
    private Integer uid;
    /*
    * 购物车产品id
    * */
    private Integer pid;
    /*
    * 产品数量
    * */
    private Integer number;
    /*
    * 购物车所属用户
    * */
    private User user;
    /*
     * 购物车所拥有的产品
     * */
    private Product product;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
