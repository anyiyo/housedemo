package com.sx.house.service.impl;

import com.sx.house.dao.AdminDao;
import com.sx.house.dao.impl.AdminDaoImpl;
import com.sx.house.domain.pojo.Admin;
import com.sx.house.service.AdminService;

public class AdminServiceImpl implements AdminService {
    private AdminDao dao=new AdminDaoImpl();
    @Override
    public Admin add(Admin admin) {
        return dao.add(admin);
    }

    @Override
    public Admin findAdmin(Admin admin) {
        return dao.findAdmin(admin);
    }
}
