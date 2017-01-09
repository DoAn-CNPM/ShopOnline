/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SanPhamDAO;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kelvi
 */
public class UpdateSanPham extends HttpServlet {

    SanPhamDAO sanPhamDAO=new SanPhamDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String mamh = request.getParameter("mamh");
        String tenmathang = request.getParameter("tenmh");
        String mota = request.getParameter("mota");

        String soluong = request.getParameter("soluong");

        String dongia = request.getParameter("dongia");
        String maloaimh=request.getParameter("maloaimh");
        Date today = new java.sql.Date(System.currentTimeMillis());
        
        model.SanPham sanPham=new model.SanPham();
        sanPham.setMaMH(Long.parseLong(mamh));
        sanPham.setTenMH(tenmathang);
        sanPham.setMoTa(mota);
        sanPham.setSoLuong(Integer.parseInt(soluong));
        sanPham.setDonGia(Double.parseDouble(dongia));
        sanPham.setNgayThem(today);
        
        try {
            sanPhamDAO.updatesanpham(sanPham);
            response.sendRedirect("/ShopOnline/SanPham.jsp?MaLoaiMH="+maloaimh+"");
        } catch (SQLException ex) {
            Logger.getLogger(UpdateSanPham.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

}
