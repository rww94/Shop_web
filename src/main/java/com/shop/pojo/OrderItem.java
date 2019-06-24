package com.shop.pojo;

public class OrderItem {
    /*
    * 订单元素id
    * */
    private Integer id;
    /*
    * 所属订单id
    * */
    private Integer oid;
    /*
    * 所属用户id
    * */
    private Integer uid;
    /*
    * 产品id
    * */
    private Integer pid;
    /*
    * 下单时产品价格
    * */
    private float price;
    /*
    * 购买数量
    * */
    private Integer number;
    /*
    * 填充商品信息
    * */
    private Product product;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getOid() {
        return oid;
    }

    public void setOid(Integer oid) {
        this.oid = oid;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
