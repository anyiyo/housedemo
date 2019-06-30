package com.sx.house.dao;

import com.sx.house.domain.pojo.House;

import java.util.List;
import java.util.Map;

public interface HouseDao {
    List<House> findAll();

    void add(House house);

    void delete(int id);

    House findById(int id);

    void update(House house);

    int findTotalCount(Map<String, String[]> condition);

    List<House> findByPage(int start, int rows, Map<String, String[]> condition);
}
