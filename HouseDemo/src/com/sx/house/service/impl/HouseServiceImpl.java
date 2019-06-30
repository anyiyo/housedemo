package com.sx.house.service.impl;

import com.sx.house.dao.HouseDao;
import com.sx.house.dao.impl.HouseDaoImpl;
import com.sx.house.domain.pojo.House;
import com.sx.house.domain.PageBean;
import com.sx.house.service.HouseService;

import java.util.List;
import java.util.Map;

public class HouseServiceImpl implements HouseService {
    private HouseDao dao = new HouseDaoImpl();

    @Override
    public List<House> findAll() {
        return dao.findAll();
    }

    @Override
    public void addHouse(House house) {
        dao.add(house);
    }

    @Override
    public void deleteHouse(String id) {
        dao.delete(Integer.parseInt(id));
    }

    @Override
    public House findHouseById(String id) {
        return dao.findById(Integer.parseInt(id));
    }

    @Override
    public void updateHouse(House house) {
        dao.update(house);
    }

    @Override
    public void delSelectedHouse(String[] ids) {
        if (ids != null && ids.length > 0) {
            for (String id : ids) {
                dao.delete(Integer.parseInt(id));
            }
        }
    }

    @Override
    public PageBean<House> findHouseByPage(String currentPage, String rows, Map<String, String[]> condition) {
        int currentPages = Integer.parseInt(currentPage);
        if (currentPages <=1) {
            currentPages = 1;
        }
        PageBean<House> pb = new PageBean<House>();
        int row = Integer.parseInt(rows);
        int totalCount = dao.findTotalCount(condition);
        pb.setTotalCount(totalCount);
        int start = (currentPages - 1) * row;
        List<House> list = dao.findByPage(start, row, condition);
        pb.setList(list);
        int totalPage = (totalCount % row) == 0 ? totalCount / row : (totalCount / row) + 1;
        pb.setTotalPage(totalPage);
        if (currentPages>=totalPage-1){
            currentPages =totalPage-1;
        }
        pb.setRows(row);
        pb.setCurrentPage(currentPages);
        return pb;
    }
}
