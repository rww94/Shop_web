package com.shop.mapper;

import com.shop.pojo.Firm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FirmMapper {
    Firm queryForLogin(@Param("name")String name, @Param("password")String password);
    List<Firm> getFirmList();
}
