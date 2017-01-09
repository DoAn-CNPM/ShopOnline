/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.util.ArrayList;
import model.Role;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Kelvin
 */
public class RoleDAO {
    public ArrayList<Role> getListRole() throws SQLException{
       Connection con=DBConnect.getConnecttion();
        String sql="select * from role";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<Role> list=new ArrayList<>();
        while(rs.next()){
            Role role=new Role();
            role.setRoleID(rs.getString("RoleID"));
            role.setRoleName(rs.getString("RoleName"));
            list.add(role);
        }
        return list;
    }
    public static void main(String[] args) throws SQLException {
        RoleDAO roleDAO=new RoleDAO();
       for(Role c:roleDAO.getListRole()){
           System.out.println("'"+c.getRoleID()+"'");
       }
    }
}
