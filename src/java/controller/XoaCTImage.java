/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CTHinhAnhDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CTHinhAnh;

/**
 *
 * @author kelvi
 */
public class XoaCTImage extends HttpServlet {

    CTHinhAnhDAO cTHinhAnhDAO = new CTHinhAnhDAO();
    CTHinhAnh ct = new CTHinhAnh();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mamh = request.getParameter("mamh");
        String ha = request.getParameter("hinhanh");

        cTHinhAnhDAO.delete(Long.parseLong(mamh), ha);
        response.sendRedirect("/ShopOnline/CTSanPham.jsp?MaMH=" + mamh + "");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
