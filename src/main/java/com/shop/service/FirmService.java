package com.shop.service;

import com.shop.pojo.Firm;

public interface FirmService {
    /*
     * 根据name和password验证用户密码是否正确
     * */
    Firm queryForLogin(String name, String password);
}
