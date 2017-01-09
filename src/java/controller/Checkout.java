/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CTDonDatHangDAO;
import dao.DonDatHangDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CTDonDatHang;
import model.Cart;
import model.DonDatHang;
import model.Items;
import model.SanPham;

/**
 *
 * @author kelvi
 */
public class Checkout extends HttpServlet {

    DonDatHangDAO datHangDAO = new DonDatHangDAO();
    CTDonDatHangDAO cTDonDatHangDAO = new CTDonDatHangDAO();
    SanPhamDAO sanPhamDAO = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

        String tenKH = request.getParameter("name");
        String diaChi = request.getParameter("address");
        String email = request.getParameter("email");
        String sdt = request.getParameter("sdt");
        String ghichu = request.getParameter("note");

        Cart cart = (Cart) session.getAttribute("cart");
        try {
            Long id = new Date().getTime();
            DonDatHang ddh = new DonDatHang();
            SanPham sp = new SanPham();
            ddh.setMaDDH(id);
            ddh.setTenKH(tenKH);
            ddh.setDiaChi(diaChi);
            ddh.setEmail(email);
            ddh.setSoDT(sdt);
            ddh.setGhiChu(ghichu);
            datHangDAO.insertDDH(ddh);
            for (Map.Entry<Long, Items> list : cart.getCartItems().entrySet()) {
                Double a = list.getValue().getQuantity() * list.getValue().getSanPham().getDonGia();
                cTDonDatHangDAO.insertCTDDH(new CTDonDatHang(list.getValue().getSanPham().getMaMH(), id,
                        list.getValue().getSize(), list.getValue().getColor(), list.getValue().getQuantity(),
                        list.getValue().getSanPham().getDonGia(), a - a * (list.getValue().getSanPham().getDiscount()) / 100));
                
            }
            cart = new Cart();
            session.setAttribute("cart", cart);
            response.sendRedirect(
                            "/ShopOnline/Home.jsp");
        } catch (SQLException e) {
        }
    }

}
