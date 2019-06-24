package com.shop.pojo;

public class Firm {
    /*
    * 厂商id
    * */
    private Integer id;
    /*
    * 厂商登录名
    * */
    private String name;
    /*
    * 厂商登陆密码
    * */
    private String password;
    /*
    * 厂商全称
    * */
    private String fullname;
    /*
    * 厂商信息
    * */
    private String message;

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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
