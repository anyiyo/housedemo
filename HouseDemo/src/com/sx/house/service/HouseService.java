package com.sx.house.service;

import com.sx.house.domain.pojo.House;
import com.sx.house.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface HouseService {

    List<House> findAll();

    void addHouse(House house);


    void deleteHouse(String id);

    House findHouseById(String id);

    void updateHouse(House house);

    void delSelectedHouse(String[] ids);

    PageBean<House> findHouseByPage(String currentPage, String rows, Map<String, String[]> condition);

}
