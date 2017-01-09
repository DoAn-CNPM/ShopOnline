/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.NhanVien;

/**
 *
 * @author kelvi
 */
public class Doimatkhau extends HttpServlet {

    
    UsersDAO usersDAO = new UsersDAO();
    NhanVien nv = new NhanVien();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String manv = request.getParameter("manv");
        String mkm = request.getParameter("matkhaumoi");
        String mkc = request.getParameter("matkhaucu");
        String xn = request.getParameter("xacnhan");
        try {
            nv = usersDAO.getNVwithMaNV(Long.parseLong(manv));
        } catch (SQLException ex) {
            Logger.getLogger(Doimatkhau.class.getName()).log(Level.SEVERE, null, ex);
        }
        if (nv.getPassWord().equals(mkc)) {
            if (mkm.equals(xn)) {
                try {
                    usersDAO.updatePass(mkm, manv);
                    response.sendRedirect("/ShopOnline/Login.jsp");
                } catch (SQLException ex) {
                    Logger.getLogger(Doimatkhau.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                out.println("<html>");
                out.println("<head>");
                out.println("<title>Thông báo</title>");
                out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"asset/bootstrap/css/bootstrap.min.css\">");
                out.println("</head>");
                out.println("<body>");
                out.println("<div class=\"alert alert-danger alert-dismissible\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
                        + ">Xác nhận mật khẩu không đúng, vui lòng nhấn <a href=\"Admin.jsp\"\">vào đây</a> để tiếp tục hoặc <a href=\"Home.jsp\">Trang chủ</a> để quay về trang chủ</div>");
                out.println("</body>");
                out.println("</html>");
            }
        } else {
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Thông báo</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"assets/bootstrap/css/bootstrap.min.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"alert alert-warning alert-dismissible\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
                    + ">Mật khẩu không đúng, vui lòng nhấn <a href=\"Admin.jsp\"\">vào đây</a> và tiếp tục hoặc <a href=\"index.jsp\">Trang chủ</a> để quay về trang chủ</div>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
