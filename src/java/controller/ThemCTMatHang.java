/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CTMatHangDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CTSanPham;

/**
 *
 * @author kelvi
 */
public class ThemCTMatHang extends HttpServlet {

    CTMatHangDAO cTMatHangDAO = new CTMatHangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mamh = request.getParameter("MaMH");
        String mausac = request.getParameter("mausac");
        String size = request.getParameter("size");
        cTMatHangDAO.delete(Long.parseLong(mamh),mausac,size);
        response.sendRedirect("/ShopOnline/CTSanPham.jsp?MaMH="+mamh+"");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String mausac = request.getParameter("mausac");
        String size = request.getParameter("size");
        String mamh = request.getParameter("mamh");
        CTSanPham ct = new CTSanPham();
        ct.setMaMH(Long.parseLong(mamh));
        ct.setSize(size);
        ct.setMauSac(mausac);
        switch (command) {
            case "insert":
                try {
                    cTMatHangDAO.insert(ct);
                    response.sendRedirect("/ShopOnline/CTSanPham.jsp?MaMH=" + mamh + "");
                } catch (SQLException ex) {
                    Logger.getLogger(ThemCTMatHang.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "update":
                cTMatHangDAO.update(ct);
                response.sendRedirect("/ShopOnline/CTSanPham.jsp?MaMH=" + mamh + "");
                break;
        }

    }
}
