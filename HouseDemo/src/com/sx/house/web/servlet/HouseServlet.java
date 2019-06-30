package com.sx.house.web.servlet;

import com.sx.house.domain.PageBean;
import com.sx.house.domain.pojo.House;
import com.sx.house.service.HouseService;
import com.sx.house.service.impl.HouseServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/house/*")
public class HouseServlet extends BaseServlet {
    private HouseService service = new HouseServiceImpl();
    public void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        House house = new House();
        try {
            BeanUtils.populate(house,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        service.addHouse(house);

        response.sendRedirect(request.getContextPath()+"/house/findByCondition");
    }

    public void deleteAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String[] ids = request.getParameterValues("hid");
        service.delSelectedHouse(ids);

        response.sendRedirect(request.getContextPath()+"/house/findByCondition");
    }

    public void deleteOne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        service.deleteHouse(id);

        response.sendRedirect(request.getContextPath()+"/house/findByCondition");
    }

    public void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();
        House house = new House();
        try {
            BeanUtils.populate(house,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        service.updateHouse(house);

        response.sendRedirect(request.getContextPath()+"/house/findByCondition");
    }

    public void findById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        House house = service.findHouseById(id);

        request.setAttribute("house",house);
        request.getRequestDispatcher("/update.jsp").forward(request,response);

    }

    public void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<House> houses = service.findAll();

        request.setAttribute("houses",houses);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    public void findByCondition(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPage = request.getParameter("currentPage");
        String rows = request.getParameter("rows");
        if(currentPage == null || "".equals(currentPage)||currentPage=="0"){
            currentPage = "1";
        }
        if(rows == null || "".equals(rows)){
            rows = "5";
        }
        Map<String, String[]> condition = request.getParameterMap();
        PageBean<House> pb = service.findHouseByPage(currentPage,rows,condition);
        request.setAttribute("pb",pb);
        request.setAttribute("condition",condition);
        request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

}
