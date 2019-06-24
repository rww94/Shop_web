package com.shop.mapper;

import com.shop.pojo.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    Admin queryForLogin(@Param("name")String name, @Param("password")String password);
}
