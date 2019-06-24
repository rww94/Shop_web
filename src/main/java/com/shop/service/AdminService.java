package com.shop.service;

import com.shop.pojo.Admin;

public interface AdminService {
    /*
     * 根据name和password验证用户密码是否正确
     * */
    Admin queryForLogin(String name, String password);
}
