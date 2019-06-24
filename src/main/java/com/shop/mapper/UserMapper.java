package com.shop.mapper;
import java.util.List;
import com.shop.pojo.User;
import org.apache.ibatis.annotations.Param;

public interface UserMapper {
    User queryForLogin(@Param("name")String name, @Param("password")String password);
    List<User> getUserList();
    void deleteUser(Integer id);
    void addUser(User user);
    User getById(Integer id);
    void  editUser(User user);
    void editUserByPassword(User user);
    List<User> getByName(String name);
}
