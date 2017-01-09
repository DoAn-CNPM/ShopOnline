/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package connect;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Kelvin
 */
public class DBConnect {
     public static Connection getConnecttion() {
      Connection cons = null;
         try {
            Class.forName("com.mysql.jdbc.Driver");
            cons = DriverManager.getConnection(
                    //"jdbc:mysql://node178143-shoponline.jelastic.servint.net/1996s","root","XHOimp77690");
            "jdbc:mysql://localhost:3306/1996s", "root", "14110143");
            System.out.println("Ket noi thanh cong");
         } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            System.out.println("Ket noi that bai");
         }
         return cons;
    }
     public static void main(String[] args) {
        System.out.println(getConnecttion());
    }
}
