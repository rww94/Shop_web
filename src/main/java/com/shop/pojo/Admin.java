package com.shop.pojo;

public class Admin {
    /*
    * 普通会员id
    * */
    private Integer id;
    /*
    * 普通会员登陆名称
    * */
    private String name;
    /*
    * 普通会员登陆密码
    * */
    private String password;
    /*
    * 管理员类型
    * */
    private String type;

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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
