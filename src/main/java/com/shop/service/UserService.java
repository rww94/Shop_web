package com.shop.service;

import com.shop.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    /*
    * 添加用户
    * */
    void addUser(User user);
    /*
    * 根据id删除用户
    * */
    void deleteUser(Integer id);
    /*
    * 获取所有用户列表
    * */
    List<User> getUserList();
    /*
    * 根据name和password验证用户密码是否正确
    * */
    User queryForLogin(String name,String password);
    /*
    * 通过用户查询用户信息
    * */
    User getById(Integer id);
    /*
    * 编辑用户信息
    * */
    void editUser(User user);
    /*
    * 修改用户密码
    * */
    void editUserByPassword(User user);
    /*
    * 通过用户姓名查询用户
    * */
    List<User> getByName(String name);
}
