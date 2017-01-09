/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.NewsDAO;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.News;

/**
 *
 * @author kelvi
 */
public class LoadHANews extends HttpServlet {

    NewsDAO newsDAO=new NewsDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            News news = newsDAO.getwithID(Long.parseLong(request.getParameter("id")));
           
            Blob fileData = news.getHinhanh();
            try (InputStream is = fileData.getBinaryStream()) {
                byte[] bytes = new byte[1];
                int bytesRead;
                
                while ((bytesRead = is.read(bytes)) != -1) {
                    // Ghi dữ liệu ảnh vào Response.
                    response.getOutputStream().write(bytes, 0, bytesRead);
                }
            } catch (SQLException ex) {
                Logger.getLogger(LoadHANews.class.getName()).log(Level.SEVERE, null, ex);
            }

        } catch (IOException | NumberFormatException e) {
            throw new ServletException(e);
        }
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }
}
