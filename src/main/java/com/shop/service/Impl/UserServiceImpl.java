package com.shop.service.Impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import com.shop.pojo.User;
import com.shop.service.UserService;
import com.shop.mapper.UserMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void deleteUser(Integer id) {
        userMapper.deleteUser(id);
    }

    @Override
    public List<User> getUserList() {
        return userMapper.getUserList();
    }

    @Override
    public User queryForLogin(String name,String password) {
        return userMapper.queryForLogin(name, password);
    }

    @Override
    public User getById(Integer id) {
        return userMapper.getById(id);
    }

    @Override
    public void editUser(User user) {
        userMapper.editUser(user);
    }

    @Override
    public void editUserByPassword(User user) {
        userMapper.editUserByPassword(user);
    }

    @Override
    public List<User> getByName(String name) {
        return userMapper.getByName(name);
    }
}

