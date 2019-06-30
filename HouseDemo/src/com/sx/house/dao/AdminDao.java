package com.sx.house.dao;

import com.sx.house.domain.pojo.Admin;

public interface AdminDao {

    Admin add(Admin admin);

    Admin findAdmin(Admin admin);
}
