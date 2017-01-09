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
public class ThemGioHang extends HttpServlet {

    SanPhamDAO sanPhamDAO = new SanPhamDAO();
    CTMatHangDAO cTMatHangDAO=new CTMatHangDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");

        HttpSession session = request.getSession();
        String productID = request.getParameter("productID");
        String muangay = request.getParameter("muangay");
        Long pro = Long.parseLong(productID);
        String color = request.getParameter("color");
        String size = request.getParameter("size");
        int soluong = Integer.parseInt(request.getParameter("soluong"));

        Cart cart = (Cart) session.getAttribute("cart");
        try {
            SanPham sanPham = sanPhamDAO.getSanPham(pro);
            CTSanPham cTSanPham=cTMatHangDAO.getSPWithMaSP(pro);
            int cur_SL = sanPhamDAO.getSL(pro);
            if (muangay == null) {
                if (soluong <= cur_SL) {
                    if (cart.getCartItems().containsKey(pro)) {
                        cart.plustoCart(pro, soluong, color, size, new Items(cTSanPham, sanPham,
                                cart.getCartItems().get(pro).getQuantity(), cart.getCartItems().get(pro).getColor(),
                                cart.getCartItems().get(pro).getSize()));
                    } else {
                        cart.plustoCart(pro, soluong, color, size, new Items(cTSanPham,sanPham,
                                soluong, color, size));
                    }
                    session.setAttribute("cart", cart);
                    response.sendRedirect("/ShopOnline/ChiTietMatHang.jsp?productID=" + productID);
                } else {
                    try (PrintWriter out = response.getWriter()) {
                        /* TODO output your page here. You may use following sample code. */
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Thông báo</title>");
                        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"asset/bootstrap/css/bootstrap.min.css\">");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
                                + ">Hiện tại shop không thể đáp ứng đủ yêu cầu số lượng mà bạn đặt mua, vui lòng quay lại <a href=\"Home.jsp\">trang chủ</a> và tiếp tục</div>");
                        out.println("</body>");
                        out.println("</html>");
                    }
                }

            } else {
                if (soluong <= cur_SL) {
                    if (cart.getCartItems().containsKey(pro)) {
                        cart.plustoCart(pro, soluong, color, size, new Items(cTSanPham,sanPham,
                                cart.getCartItems().get(pro).getQuantity(), cart.getCartItems().get(pro).getColor(),
                                cart.getCartItems().get(pro).getSize()));
                    } else {
                        cart.plustoCart(pro, soluong, color, size, new Items(cTSanPham,sanPham,
                                soluong, color, size));
                    }
                    session.setAttribute("cart", cart);
                    response.sendRedirect("/ShopOnline/GioHang.jsp?cart");
                } else {
                    try (PrintWriter out = response.getWriter()) {
                        /* TODO output your page here. You may use following sample code. */
                        out.println("<!DOCTYPE html>");
                        out.println("<html>");
                        out.println("<head>");
                        out.println("<title>Thông báo</title>");
                        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"asset/bootstrap/css/bootstrap.min.css\">");
                        out.println("</head>");
                        out.println("<body>");
                        out.println("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
                                + ">Hiện tại shop không thể đáp ứng đủ yêu cầu số lượng mà bạn đặt mua, vui lòng quay lại <a href=\"Home.jsp\">trang chủ</a> và tiếp tục</div>");
                        out.println("</body>");
                        out.println("</html>");
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("/ShopOnline/ChiTietMatHang.jsp?productID=" + productID);
        }
    }

}
