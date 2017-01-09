/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UsersDAO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.NhanVien;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author kelvi
 */
public class UpdateImage extends HttpServlet {

    UsersDAO usersDAO=new UsersDAO();
    NhanVien nv=new NhanVien();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        HttpSession session=request.getSession();
        String manv=session.getAttribute("manv").toString();
        if (!ServletFileUpload.isMultipartContent(request)) {
            out.println("Nothing to upload");
            return;
        }
        FileItemFactory itemfactory = new DiskFileItemFactory();
        ServletFileUpload upload = new ServletFileUpload(itemfactory);
        String a = "";
        try {
            List<FileItem> items = upload.parseRequest(request);
            for (FileItem item : items) {
                String myfolder = ("asset/Images/nhanvien") + "/";
                File uploadDir = new File("E:/Công nghệ phần mềm/Đồ Án/1996Shop/ShopOnline/web/asset/Images/nhanvien");
                File file = File.createTempFile("img", ".png", uploadDir);
                item.write(file);
                a = myfolder + file.getName();
                nv.setImage(a);
                usersDAO.updateImage(a, manv);
                response.sendRedirect("Profile.jsp?MaNV=" + manv + "");
           }

        } catch (FileUploadException e) {
            out.println("upload fail");
        } catch (Exception ex) {
            
        }
    }

}
