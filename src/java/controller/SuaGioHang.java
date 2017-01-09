/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CTMatHangDAO;
import dao.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CTSanPham;
import model.Cart;
import model.Items;
import model.SanPham;

/**
 *
 * @author kelvi
 */
public class SuaGioHang extends HttpServlet {

    SanPhamDAO sanPhamDAO = new SanPhamDAO();
    CTMatHangDAO cTMatHangDAO=new CTMatHangDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String productID = request.getParameter("productID");
        int soLuong = Integer.parseInt(request.getParameter("soluong"));
        Cart cart = (Cart) session.getAttribute("cart");
        Long pro=Long.parseLong(productID);
        try {
            SanPham sanPham = sanPhamDAO.getSanPham(pro);
            CTSanPham cTSanPham=cTMatHangDAO.getSPWithMaSP(pro);
            if (cart.getCartItems().containsKey(pro)) {
                cart.subtoCart(pro, soLuong, new Items(cTSanPham,sanPham,
                        cart.getCartItems().get(pro).getQuantity(), cart.getCartItems().get(pro).getColor(),
                        cart.getCartItems().get(pro).getSize()));
            } else {
                cart.subtoCart(pro, soLuong, new Items(cTSanPham,sanPham,
                        soLuong, cart.getCartItems().get(pro).getColor(),
                        cart.getCartItems().get(pro).getSize()));
            }
            session.setAttribute("cart", cart);
            response.sendRedirect("/ShopOnline/GioHang.jsp?cart");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/ShopOnline/ChiTietMatHang.jsp?productID=" + productID);
        }
    }
}
