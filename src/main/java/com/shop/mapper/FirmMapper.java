package com.shop.mapper;

import com.shop.pojo.Firm;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface FirmMapper {
    Firm queryForLogin(@Param("name")String name, @Param("password")String password);
    List<Firm> getFirmList();
    void deleteFirm(Integer id);
    void addFirm(Firm firm);
    List<Firm> getByName(String name);
}
