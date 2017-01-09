/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NhanVien;

/**
 *
 * @author kelvi
 */
public class Profile extends HttpServlet {

    UsersDAO usersDAO=new UsersDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String manv = request.getParameter("maNV");
        String passWord = request.getParameter("password");
        String hoTen = request.getParameter("hoten");
        String gioitinh = request.getParameter("gender");
        String SDT = request.getParameter("sdt");
        String Email = request.getParameter("email");
        String ngaySinh = request.getParameter("birthday");
        String diaChi = request.getParameter("diachi");

        NhanVien nv = new NhanVien();
        nv.setPassWord(passWord);
        nv.setHoTen(hoTen);
        nv.setGioiTinh(gioitinh);
        nv.setNgSinh(Date.valueOf(ngaySinh));
        nv.setSDT(SDT);
        nv.setEmail(Email);
        nv.setDiaChi(diaChi);
        nv.setMaNV(Long.parseLong(manv));
        try {
            usersDAO.update(nv);
            response.sendRedirect("/ShopOnline/Profile.jsp?MaNV=" + manv + "");
        } catch (SQLException ex) {
            Logger.getLogger(Profile.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}

