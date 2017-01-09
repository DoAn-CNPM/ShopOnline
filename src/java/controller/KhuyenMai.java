/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CTKhuyenMaiDAO;
import dao.KhuyenMaiDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CTKhuyenMai;

/**
 *
 * @author kelvi
 */
public class KhuyenMai extends HttpServlet {

    KhuyenMaiDAO khuyenMaiDAO = new KhuyenMaiDAO();
    CTKhuyenMaiDAO cTKhuyenMaiDAO = new CTKhuyenMaiDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String maKM = request.getParameter("makm");
        String mamh = request.getParameter("mamh");
        String tenkm = request.getParameter("tenkm");
        PrintWriter out = response.getWriter();
        try {
            if (cTKhuyenMaiDAO.delete(Long.parseLong(maKM), Long.parseLong(mamh))) {
                if (khuyenMaiDAO.delete(Long.parseLong(maKM))) {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Xóa thành công khuyến mãi " + tenkm + "');");
                    out.println("location='DSKhuyenMai.jsp';");
                    out.println("</script>");
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Xóa không thành công khuyến mãi " + tenkm + "', vui lòng xem lại dữ liệu);");
                    out.println("location='DSKhuyenMai.jsp';");
                    out.println("</script>");
                }
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Xóa không thành công khuyến mãi " + tenkm + "', vui lòng xem lại dữ liệu);");
                out.println("location='DSKhuyenMai.jsp';");
                out.println("</script>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(KhuyenMai.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String maKM = request.getParameter("makm");
        String tenKM = request.getParameter("tenkm");
        String tuNgay = request.getParameter("from");
        String denNgay = request.getParameter("to");
        String mamh = request.getParameter("mamh");
        String loaiKM = request.getParameter("loaiKM");
        switch (command) {
            case "insert":
                try {
                    Long makm = new Date().getTime();
                    khuyenMaiDAO.insert((new model.KhuyenMai(makm, tenKM, java.sql.Date.valueOf(tuNgay), java.sql.Date.valueOf(denNgay), Integer.parseInt(loaiKM))));
                    cTKhuyenMaiDAO.insert(new CTKhuyenMai(Long.parseLong(mamh), makm));
                    response.sendRedirect("/ShopOnline/KhuyenMai.jsp?MaLoai=1");

                } catch (SQLException ex) {
                    Logger.getLogger(KhuyenMai.class.getName()).log(Level.SEVERE, null, ex);
                }
                break;
            case "update": {
                try {
                    khuyenMaiDAO.update(new model.KhuyenMai(Long.parseLong(maKM), tenKM, java.sql.Date.valueOf(tuNgay), java.sql.Date.valueOf(denNgay), Integer.parseInt(loaiKM)));
                    response.sendRedirect("/ShopOnline/DSKhuyenMai.jsp");
                } catch (SQLException ex) {
                    Logger.getLogger(KhuyenMai.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            break;
        }
    }
}
