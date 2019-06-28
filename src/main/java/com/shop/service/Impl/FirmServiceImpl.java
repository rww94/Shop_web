package com.shop.service.Impl;

import com.shop.mapper.FirmMapper;
import com.shop.pojo.Firm;
import com.shop.service.FirmService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FirmServiceImpl implements FirmService {
    @Autowired
    FirmMapper firmMapper;
    @Override
    public Firm queryForLogin(String name, String password) {
        return firmMapper.queryForLogin(name, password);
    }

    @Override
    public List<Firm> getFirmList() {
        return firmMapper.getFirmList();
    }
}
