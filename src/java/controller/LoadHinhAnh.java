/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.SanPhamDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kelvi
 */
public class LoadHinhAnh extends HttpServlet {

    SanPhamDAO sanPhamDAO=new SanPhamDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            Connection conn = null;
        try {
            model.SanPham sanpham = sanPhamDAO.getSanPham(Long.parseLong(request.getParameter("mamh")));
           
            Blob fileData = sanpham.getHinhAnh();
            try (InputStream is = fileData.getBinaryStream()) {
                byte[] bytes = new byte[1];
                int bytesRead;
                
                while ((bytesRead = is.read(bytes)) != -1) {
                    // Ghi dữ liệu ảnh vào Response.
                    response.getOutputStream().write(bytes, 0, bytesRead);
                }
            }

        } catch (IOException | NumberFormatException | SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

}
