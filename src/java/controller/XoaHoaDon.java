/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CTDonDatHangDAO;
import dao.DonDatHangDAO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author kelvi
 */
public class XoaHoaDon extends HttpServlet {

    DonDatHangDAO donDatHangDAO=new DonDatHangDAO();
    CTDonDatHangDAO cTDonDatHangDAO=new CTDonDatHangDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String maDDH=request.getParameter("MaDDH");
        
        try {
            cTDonDatHangDAO.delete(Long.parseLong(maDDH));
             donDatHangDAO.delete(Long.parseLong(maDDH));
            response.sendRedirect("/ShopOnline/DonDatHang.jsp");
        } catch (SQLException ex) {
            Logger.getLogger(XoaHoaDon.class.getName()).log(Level.SEVERE, null, ex);
        }
           
    
    } 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
