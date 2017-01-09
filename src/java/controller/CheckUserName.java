/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kelvin
 */
public class CheckUserName extends HttpServlet {

    UsersDAO usersDAO = new UsersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        try {
            if (usersDAO.check(request.getParameter("username"))) {
                response.getWriter().write("<i class=\"fa fa-times text-danger\"></i><span style=\"color:red;margin-left: 10px\">Tên đăng nhập đã tồn tại</span>");
            } else if (username.equals("")) {
                return;
            } else {
                response.getWriter().write("<img src=\"asset/Images/available.png\"><span style=\"color:green;margin-left:10px\">Bạn có thể sử dụng tên đăng nhập này</span>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CheckUserName.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
