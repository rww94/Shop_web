package com.shop.mapper;

import com.shop.pojo.Firm;
import org.apache.ibatis.annotations.Param;

public interface FirmMapper {
    Firm queryForLogin(@Param("name")String name, @Param("password")String password);
}
