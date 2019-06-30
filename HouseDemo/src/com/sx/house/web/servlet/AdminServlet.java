package com.sx.house.web.servlet;

import com.sx.house.domain.pojo.Admin;
import com.sx.house.service.AdminService;
import com.sx.house.service.impl.AdminServiceImpl;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet("/admin/*")
public class AdminServlet extends BaseServlet {
    private AdminService service =new AdminServiceImpl();


    public void addAdmin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, String[]> map = request.getParameterMap();

        Admin admin = new Admin();
        try {
            BeanUtils.populate(admin,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }

        service.add(admin);
        request.getRequestDispatcher(request.getContextPath()+"/login.jsp").forward(request,response);

    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        Map<String, String[]> map = request.getParameterMap();
        Admin admin = new Admin();
        try {
            BeanUtils.populate(admin,map);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        Admin login = service.findAdmin(admin);
        if(login != null){
            session.setAttribute("login",login);
            response.sendRedirect("/house/findByCondition");
        }else{
            request.setAttribute("login_msg","用户名或密码错误！");
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    public void exit(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath()+"/login.jsp");
    }
}
