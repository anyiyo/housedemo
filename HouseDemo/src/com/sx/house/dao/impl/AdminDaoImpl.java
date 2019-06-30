package com.sx.house.dao.impl;

import com.sx.house.dao.AdminDao;
import com.sx.house.domain.pojo.Admin;
import com.sx.house.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class AdminDaoImpl implements AdminDao {
    private JdbcTemplate template =new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public Admin add(Admin admin) {
        String sql ="insert into admin values (null,?,?)  ";
        template.update(sql, admin.getUsername(), admin.getPassword());
        return admin;
    }

    @Override
    public Admin findAdmin(Admin admin) {
        try {
            String sql = "select * from admin where username = ? and password =? ";
            Admin login = template.queryForObject(sql, new BeanPropertyRowMapper<Admin>(Admin.class), admin.getUsername(), admin.getPassword());
            return login;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
}
