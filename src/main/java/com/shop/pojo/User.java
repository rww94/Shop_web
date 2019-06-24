package com.shop.pojo;

public class User {
    /*
    * 会员id
    * */
    private Integer id;
    /*
    * 会员登录名
    * */
    private String name;
    /*
    * 会员登陆密码
    * */
    private String password;
    /*
    * 会员性别
    * */
    private String sex;
    /*
    * 会员电话
    * */
    private String telephone;
    /*
    * 会员地址
    * */
    private String address;
    /*
    * 会员邮箱
    * */
    private String email;

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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
