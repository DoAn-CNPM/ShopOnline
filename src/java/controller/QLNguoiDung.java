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
import tools.SendMail;

/**
 *
 * @author kelvi
 */
public class QLNguoiDung extends HttpServlet {

    UsersDAO usersDAO = new UsersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maNV = request.getParameter("maNV");
        try {
            usersDAO.deleteNhanVien(Long.parseLong(maNV));
        } catch (SQLException ex) {
            Logger.getLogger(QLNguoiDung.class.getName()).log(Level.SEVERE, null, ex);
        }
        response.sendRedirect("/ShopOnline/QLNguoiDung.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        String command = request.getParameter("command");
        String userName = request.getParameter("userName");
        String passWord = request.getParameter("passWord");
        String hoTen = request.getParameter("hoTen");
        String SDT = request.getParameter("sdt");
        String Email = request.getParameter("Email");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngaySinh = request.getParameter("ngaySinh");
        String diaChi = request.getParameter("diachi");
        String roleID = request.getParameter("roleID");
        Date today = new Date(System.currentTimeMillis());
        NhanVien nv = new NhanVien();
        SendMail sendMail=new SendMail();
        
        try {
            switch (command) {
                case "insert":
                    nv.setMaNV(new java.util.Date().getTime());
                    nv.setUserName(userName);
                    nv.setPassWord(passWord);
                    nv.setEmail(Email);
                    nv.setHoTen(hoTen);
                    nv.setRoleID(roleID);
                    nv.setSDT(SDT);
                    nv.setNgSinh(today);
                    usersDAO.insertUsers(nv);
                    sendMail.sendMail(Email,"Welcome to 1996s" , "Hello, "+Email+":\n\tYour account is now ready and waiting for you to go 1996s. "
                            + "Go to the dashboard at 1996s.vn and login in with these details:\n"
                            + "\t\tLogin: "+userName+"\n"
                                    + "\t\tPassword: "+passWord+"");
                    response.sendRedirect("/ShopOnline/QLNguoiDung.jsp");
                    break;
                case "update":
                     nv=usersDAO.getNVwithMaNV(Long.parseLong(request.getParameter("maNV")));
                    usersDAO.updateNhanVien(new NhanVien(Long.parseLong(request.getParameter("maNV")), userName, passWord, hoTen, gioiTinh, java.sql.Date.valueOf(ngaySinh), SDT, Email, diaChi, roleID,nv.getImage()));
                    response.sendRedirect("/ShopOnline/QLNguoiDung.jsp");
                    break;
              
            }
        } catch (SQLException ex) {
            Logger.getLogger(NhanVienServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
