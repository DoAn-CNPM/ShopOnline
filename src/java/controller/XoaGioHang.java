/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SanPhamDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Items;
import model.SanPham;

/**
 *
 * @author kelvi
 */
public class XoaGioHang extends HttpServlet {

    SanPhamDAO sanPhamDAO = new SanPhamDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String productID = request.getParameter("productID");
        Long pro=Long.parseLong(productID);
        Cart cart = (Cart) session.getAttribute("cart");
        cart.removetoCart(pro);
  
        
        response.sendRedirect("/ShopOnline/GioHang.jsp?cart");
    }
}
