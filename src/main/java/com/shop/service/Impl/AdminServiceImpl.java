package com.shop.service.Impl;

import com.shop.pojo.Admin;
import com.shop.mapper.AdminMapper;
import com.shop.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;
    public Admin queryForLogin(String name, String password) {
        return adminMapper.queryForLogin(name, password);
    }
}
