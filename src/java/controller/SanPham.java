/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SanPhamDAO;
import dao.XULYFILE;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author kelvi
 */
@MultipartConfig(maxFileSize = 16177215)
public class SanPham extends HttpServlet {
    
    model.SanPham sanpham = new model.SanPham();
    SanPhamDAO sanphamDAO = new SanPhamDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       String mamh=request.getParameter("MaMH");
       String maloaimh=request.getParameter("MaLoaiMH");
        try {
            sanphamDAO.delete(Long.parseLong(mamh));
            response.sendRedirect("/ShopOnline/SanPham.jsp?MaLoaiMH="+maloaimh+"");
        } catch (SQLException ex) {
            Logger.getLogger(SanPham.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    model.SanPham sp = new model.SanPham();
    XULYFILE xlfile = new XULYFILE();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        // gets values of text fields
        String tenmathang = request.getParameter("tenmh");
        String mota = request.getParameter("mota");
        
        String soluong = request.getParameter("soluong");
        
        String dongia = request.getParameter("dongia");
        String maloaimh = request.getParameter("maloaimh");
        try {
            Part part = request.getPart("hinhanh");
            InputStream is = null;
            is = xlfile.getFile(part);
            
            Date today = new Date(System.currentTimeMillis());
            sp.setMaMH(new java.util.Date().getTime());
            sp.setTenMH(tenmathang);
            sp.setMoTa(mota);
            sp.setSoLuong(Integer.valueOf(soluong));
            sp.setDonGia(Double.parseDouble(dongia));
            sp.setMaLoaiMH(Long.parseLong(maloaimh));
            sp.setNgayThem(today);
            
            sanphamDAO.insertsanpham(sp, is);
            response.sendRedirect("/ShopOnline/SanPham.jsp?MaLoaiMH=" + maloaimh + "");
            
        } catch (SQLException ex) {
            Logger.getLogger(SanPham.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
