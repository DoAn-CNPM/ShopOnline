package dao;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.Part;

import connect.DBConnect;

public class XULYFILE {
	public InputStream getFile(Part part) throws IOException, SQLException {
        Connection conn = null;

        // Kết nối tới Database
        // (Xem thêm tài liệu JDBC).
        conn = DBConnect.getConnecttion();
        conn.setAutoCommit(false);

        // Danh mục các phần đã upload lên (Có thể là nhiều file).
        InputStream is = part.getInputStream();

        conn.commit();
        // Upload thành công.
        return is;
    }


    public String extractFileName(Part part) {
        // form-data; name="file"; filename="C:\file1.zip"
        // form-data; name="file"; filename="C:\Note\file2.zip"
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                // C:\file1.zip
                // C:\Note\file2.zip
                String clientFileName = s.substring(s.indexOf("=") + 2, s.length() - 1);
                clientFileName = clientFileName.replace("\\", "/");
                int i = clientFileName.lastIndexOf('/');
                // file1.zip
                // file2.zip
                return clientFileName.substring(i + 1);
            }
        }
        return null;
    }

}
