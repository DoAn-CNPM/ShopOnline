/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import connect.DBConnect;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.application.Application;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.JasperRunManager;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;

/**
 *
 * @author kelvi
 */
public class InHoaDon extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String mahd = request.getParameter("MaHD");
        Connection con = DBConnect.getConnecttion();
        File file = new File(getServletContext().getRealPath("/asset/report/Hoadon.jasper"));
        
        Map parameters = new HashMap();
        parameters.put("MaHD", Long.parseLong(mahd));
        try {
            byte[] bytes = JasperRunManager.runReportToPdf(file.getPath(), parameters, con);

            response.setContentType("application/pdf");
            response.setContentLengthLong(bytes.length);
            response.setCharacterEncoding("utf-8");
            try (ServletOutputStream outputStream = response.getOutputStream()) {
                outputStream.write(bytes, 0, bytes.length);
                outputStream.flush();
            }
        } catch (JRException ex) {
            Logger.getLogger(InHoaDon.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mahd = request.getParameter("MaHD");
        Connection con = DBConnect.getConnecttion();
        File file = new File(getServletContext().getRealPath("/asset/report/Hoadon.jasper"));
        Map parameters = new HashMap();
        parameters.put("MaHD", Long.parseLong(mahd));
File file1 = new File(getServletContext().getRealPath("/asset/report/Hoadon.jrxml"));
        try {
            
            JasperDesign jd = JRXmlLoader.load(file1.getPath());
            JasperReport jr = JasperCompileManager.compileReport(file.getPath());
            JasperPrint jp = JasperFillManager.fillReport(jr, parameters, con);
            JasperViewer.viewReport(jp);
            JasperExportManager.exportReportToPdfFile(jp, "E:\\Công nghệ phần mềm\\Đồ Án\\1996Shop\\ShopOnline\\src\\java\\report\\HoaDon.jasper");
        } catch (JRException ex) {
            Logger.getLogger(InHoaDon.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
