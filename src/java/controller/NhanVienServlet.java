package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsersDAO;
import java.sql.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.NhanVien;

/**
 * Servlet implementation class NhanVienServlet
 */
@WebServlet("/NhanVienServlet")
public class NhanVienServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    UsersDAO usersDAO = new UsersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        String maNV = request.getParameter("maNV");
        Long MaNV = Long.parseLong(maNV);
        String url = "";
        switch (command) {
            case "delete": {
                try {
                    usersDAO.deleteNhanVien(MaNV);
                } catch (SQLException ex) {
                    Logger.getLogger(NhanVienServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            url = "/AdminManager.jsp";
            break;
        }
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        String command = request.getParameter("command");
        String userName = request.getParameter("userName");
        String passWord = request.getParameter("passWord");
        String hoTen = request.getParameter("hoTen");
        String gioiTinh = request.getParameter("gioiTinh");
        String ngSinh = request.getParameter("ngSinh");
        String SDT = request.getParameter("SDT");
        String Email = request.getParameter("Email");
        String diaChi = request.getParameter("diaChi");
        String roleID = request.getParameter("roleID");
        Long date = new java.util.Date().getTime();
        Date today = new Date(System.currentTimeMillis());
        NhanVien nv = new NhanVien();
        try {
            switch (command) {

                case "insert":
                    nv.setMaNV(date);
                    nv.setUserName(userName);
                    nv.setPassWord(passWord);
                    nv.setEmail(Email);
                    nv.setHoTen(hoTen);
                    nv.setRoleID(roleID);
                    nv.setSDT(SDT);
                    nv.setNgSinh(today);
                    usersDAO.insertUsers(nv);
                    response.sendRedirect("/ShopOnline/AdminManager.jsp");
                    break;
                case "update":
                    nv = usersDAO.getNVwithMaNV(Long.parseLong(request.getParameter("maNV")));
                    usersDAO.updateNhanVien(new NhanVien(Long.parseLong(request.getParameter("maNV")), userName, passWord, hoTen, gioiTinh, java.sql.Date.valueOf(ngSinh), SDT, Email, diaChi, roleID, nv.getImage()));
                    response.sendRedirect("/ShopOnline/AdminManager.jsp");
                    break;
            }
        } catch (SQLException ex) {
            Logger.getLogger(NhanVienServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
