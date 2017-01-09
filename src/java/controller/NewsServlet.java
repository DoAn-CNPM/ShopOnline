/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.NewsDAO;
import dao.XULYFILE;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
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
import model.News;

/**
 *
 * @author kelvi
 */
@MultipartConfig(maxFileSize = 16177215)
public class NewsServlet extends HttpServlet {

    XULYFILE xlfile = new XULYFILE();
    NewsDAO newsDAO = new NewsDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("ID");
        try {
            newsDAO.delete(Long.parseLong(id));
            response.sendRedirect("/ShopOnline/QLNews.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(NewsServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        // gets values of text fields
        String command = request.getParameter("command");
        String id = request.getParameter("id");
        String noidung = request.getParameter("noidung");
        String tieude = request.getParameter("tieude");
        String tungay = request.getParameter("tungay");
        String denngay = request.getParameter("denngay");
        String apdung = request.getParameter("apdung");
        Date today = new Date(System.currentTimeMillis());
        News n = new News();
        try {
            switch (command) {
                case "insert":
                    Part part = request.getPart("hinhanh");
                    InputStream is = null;
                    is = xlfile.getFile(part);

                    n.setId(new java.util.Date().getTime());
                    n.setTitle(tieude);
                    n.setNoidung(noidung);
                    n.setTungay(Date.valueOf(tungay));
                    n.setDenngay(Date.valueOf(denngay));
                    n.setAdcho(apdung);
                    n.setNgaydang(today);
                    newsDAO.insert(n, is);
                    response.sendRedirect("/ShopOnline/QLNews.jsp");
                    break;
                case "update":
                    n.setId(Long.parseLong(id));
                    n.setTitle(tieude);
                    n.setNoidung(noidung);
                    n.setTungay(Date.valueOf(tungay));
                    n.setDenngay(Date.valueOf(denngay));
                    n.setAdcho(apdung);
                    newsDAO.update(n);
                    response.sendRedirect("/ShopOnline/QLNews.jsp");
                    break;
            }

        } catch (SQLException ex) {
            Logger.getLogger(SanPham.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
