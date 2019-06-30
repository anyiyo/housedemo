package com.sx.house.dao.impl;

import com.sx.house.dao.HouseDao;
import com.sx.house.domain.pojo.House;
import com.sx.house.utils.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class HouseDaoImpl implements HouseDao {
    private JdbcTemplate template =new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List<House> findAll() {
        String sql = "select * from house";
        List<House> houses = template.query(sql, new BeanPropertyRowMapper<House>(House.class));
        return houses;
    }

    @Override
    public void add(House house) {
        String sql = "insert into house values(null,?,?,?,?)";
        template.update(sql,house.getTypename(),house.getAddress(),house.getSize(),house.getPrice());
    }

    @Override
    public void delete(int id) {
        String sql = "delete from house  where id = ?";
        template.update(sql, id);
    }

    @Override
    public House findById(int id) {
        String sql = "select * from house where id = ?";
        return template.queryForObject(sql, new BeanPropertyRowMapper<House>(House.class), id);
    }

    @Override
    public void update(House house) {
        String sql = "update house set typename = ?,address = ? ,size = ? , price = ? where id =?";
        template.update(sql, house.getTypename(), house.getAddress(), house.getSize(), house.getPrice(),house.getId());
    }

    @Override
    public int findTotalCount(Map<String, String[]> condition) {
            String sql = "select count(*) from house where 1 = 1 ";
            StringBuilder sb = new StringBuilder(sql);
            Set<String> keySet = condition.keySet();
            List<Object> params = new ArrayList<Object>();
            for (String key : keySet) {
                if("currentPage".equals(key) || "rows".equals(key)){
                    continue;
                }
                String value = condition.get(key)[0];
                if(value != null && !"".equals(value)){
                    sb.append(" and "+key+" like ? ");
                    params.add("%"+value+"%");
                }
            }
            return template.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<House> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from house  where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        Set<String> keySet = condition.keySet();
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            String value = condition.get(key)[0];
            if(value != null && !"".equals(value)){
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        sb.append(" limit ?,? ");
        params.add(start);
        params.add(rows);
        sql = sb.toString();
        return template.query(sql,new BeanPropertyRowMapper<House>(House.class),params.toArray());
    }
}
