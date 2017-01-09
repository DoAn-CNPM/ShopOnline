/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Array;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.catalina.filters.CorsFilter;
import tools.SendMail;
import tools.randomPass;

/**
 *
 * @author vin
 */
public class Quenmatkhau extends HttpServlet {

    UsersDAO usersDAO=new UsersDAO();
    SendMail sendMail=new SendMail();
    randomPass pass=new randomPass();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
       String username=request.getParameter("username");
       String email=request.getParameter("email");
       PrintWriter out=response.getWriter();
        try {
            if(usersDAO.checkEmail(username,email)){
               sendMail.sendMail(email, "Forget pass", "Employyee "+username+" is reset password at website 1996s.vn.\n"
                       + "Your new password is: "+pass.generateRandomPassword()+"");
               usersDAO.updatePassWithUsername(pass.generateRandomPassword(), username);
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Thông báo</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"asset/bootstrap/css/bootstrap.min.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"alert alert-success\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
                    + ">Một Email đã được gửi đến đỉa chỉ Email "+email+",<br> vui lòng nhấn kiểm tra email và nhấn vào đây <a href=\"Login.jsp\">Đăng nhập</a> để đăng nhập lại hoặc <a href=\"index.jsp\">trang chủ</a> để quay về trang chủ</div>");
            out.println("</body>");
            out.println("</html>");
            }
            else{
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Thông báo</title>");
            out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"asset/bootstrap/css/bootstrap.min.css\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<div class=\"alert alert-danger alert-dismissible\" role=\"alert\" style=\"text-align: center\"><strong>Thông báo! </strong"
                    + ">Tên tài khoản hoặc email không đúng, vui lòng nhấn vào đây <a href=\"Login.jsp\">Đăng nhập</a> và tiếp tục</div>");
            out.println("</body>");
            out.println("</html>");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Quenmatkhau.class.getName()).log(Level.SEVERE, null, ex);
        }
       
    }

}
