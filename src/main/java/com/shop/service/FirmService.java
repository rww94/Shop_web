package com.shop.service;

import com.shop.pojo.Firm;

import javax.print.DocFlavor;
import java.util.List;

public interface FirmService {
    /*
     * 根据name和password验证用户密码是否正确
     * */
    Firm queryForLogin(String name, String password);
    /*
    * 得到厂商列表
    * */
    List<Firm> getFirmList();
    /*
    * 删除厂商信息
    * */
    void deleteFirm(Integer id);
    /*
    * 添加厂商
    * */
    void addFirm(Firm firm);
    /*
    * 通过厂商名得到厂商信息
    * */
    List<Firm> getByName(String name);
}
