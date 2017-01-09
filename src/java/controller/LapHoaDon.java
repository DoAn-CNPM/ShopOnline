/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CTDonDatHangDAO;
import dao.HoaDonDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CTDonDatHang;
import model.HoaDon;

/**
 *
 * @author kelvi
 */
public class LapHoaDon extends HttpServlet {

    HoaDonDAO hoaDonDAO = new HoaDonDAO();
    CTDonDatHangDAO cTDonDatHangDAO = new CTDonDatHangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        Long manv = Long.parseLong(request.getParameter("manv"));
        Long maddh = Long.parseLong(request.getParameter("maddh"));
        Long mahd=new Date().getTime();
        Date date =new Date();
        Timestamp today=new Timestamp(date.getTime());
         HoaDon hd=new HoaDon();
        Double tongtien = 0.0;
        SanPhamDAO sanPhamDAO=new SanPhamDAO();
        model.SanPham sp=new model.SanPham();
        int old_sl=0;
        int new_sl=0;
        int sl=0;
        try {
            tongtien = cTDonDatHangDAO.getTT(maddh);
            hd.setMaHD(mahd);
            hd.setTongTien(tongtien);
            hd.setNgayTT(today);
            hd.setMaNV(manv);
            hd.setMaDDH(maddh);
            hoaDonDAO.insertHD(hd);
            for(CTDonDatHang ct:cTDonDatHangDAO.getSLmuaAndMaMH(maddh)){
                sp=sanPhamDAO.getSanPham(ct.getMaMH());
                old_sl=sp.getSoLuong();
                new_sl=ct.getSlMua();
                sl=old_sl-new_sl;
                sp.setSoLuong(sl);
                sp.setMaMH(ct.getMaMH());
                sanPhamDAO.updateSL(sp);
                response.sendRedirect("/ShopOnline/HoaDon.jsp");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
