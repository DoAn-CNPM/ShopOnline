package controller;

import dao.CTLoaiMatHangDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoaiSanPhamDAO;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CTLoaiMatHang;
import model.LoaiSanPham;

/**
 * Servlet implementation class QLLoaiSPServlet
 */
@WebServlet("/QLLoaiSPServlet")
public class QLLoaiSPServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    LoaiSanPhamDAO loaisanphamDAO = new LoaiSanPhamDAO();
    CTLoaiMatHangDAO cTLoaiMatHangDAO = new CTLoaiMatHangDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String command = request.getParameter("command");
        String maLoai = request.getParameter("maLoai");
        String maLoaiMH=request.getParameter("maLoaiMH");
        try {
            switch (command) {
                case "deleteLSP":
                    loaisanphamDAO.deleteLoaiSanPham(Long.parseLong(maLoai));
                    response.sendRedirect("/ShopOnline/DanhMucSP.jsp");
                    break;
                case "deleteCTLSP":
                    cTLoaiMatHangDAO.delete(Long.parseLong(maLoaiMH));
                    response.sendRedirect("/ShopOnline/UpdateLSP.jsp?maLoai="+Long.parseLong(maLoai)+"");
                    break;
            }
        } catch (SQLException e) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String command = request.getParameter("command");
        String tenLoaiMH = request.getParameter("tenlmh");
        String mactloaiMH=request.getParameter("mactlmh");
        String tenCTLoaiMH = request.getParameter("tenctlmh");
        String maLoaiMH=request.getParameter("maloai");
        try {
            switch (command) {
                case "insert":
                    loaisanphamDAO.insertLoaiSanPham(new LoaiSanPham(new Date().getTime(), tenLoaiMH));
                    response.sendRedirect("/ShopOnline/DanhMucSP.jsp");
                    break;
                case "insertCTLMH":
                    cTLoaiMatHangDAO.insertCTLoaiMH(new CTLoaiMatHang(new Date().getTime(), tenCTLoaiMH, Long.parseLong(maLoaiMH)));
                    response.sendRedirect("/ShopOnline/UpdateLSP.jsp?maLoai="+maLoaiMH+"");
                    break;
                case "updateLMH":
                    String maloai=request.getParameter("malmh");
                    loaisanphamDAO.updateLoaiSanPham(new LoaiSanPham(Long.parseLong(maloai),tenLoaiMH));
                    response.sendRedirect("/ShopOnline/DanhMucSP.jsp");
                    break;
                case "updateCTLMH":
                    cTLoaiMatHangDAO.update(new CTLoaiMatHang(Long.parseLong(mactloaiMH),tenCTLoaiMH,Long.parseLong(maLoaiMH)));
                    response.sendRedirect("/ShopOnline/UpdateLSP.jsp?maLoai="+maLoaiMH+"");
                    break;
            }

        } catch (SQLException e) {
            Logger.getLogger(QLLoaiSPServlet.class.getName()).log(Level.SEVERE, null, e);
        }
    }
}
