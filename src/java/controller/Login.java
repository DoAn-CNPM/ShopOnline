/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.NhanVien;

/**
 *
 * @author Kelvin
 */
public class Login extends HttpServlet {

    UsersDAO usersDAO = new UsersDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        NhanVien nhanVien = new NhanVien();
        String username = request.getParameter("username");
        String passs = request.getParameter("password");
        String roleid = request.getParameter("Role");
        try {
            nhanVien = usersDAO.login(username, passs, roleid);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        HttpSession session = request.getSession();
        if (nhanVien != null) {
            if (roleid.equals("Admin")) {
                session.setAttribute("userAdmin", nhanVien);
                response.sendRedirect("/ShopOnline/Admin.jsp");
            }
            if (roleid.equals("NhanVien")) {
                session.setAttribute("userNV", nhanVien);
                response.sendRedirect("/ShopOnline/NhanVien.jsp");
            }

        } else {
            out.println("<script type=\"text/javascript\">");
                    out.println("alert('Sai tên tài khoản hoặc mật khẩu');");
                    out.println("location='Login.jsp';");
                    out.println("</script>");
        }
    }
}
