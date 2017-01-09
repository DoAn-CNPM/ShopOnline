/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.CTHinhAnh;

/**
 *
 * @author kelvi
 */
public class CTHinhAnhDAO {
 
    Connection con=DBConnect.getConnecttion();
    public ArrayList<CTHinhAnh> getlistWithMaMH(Long mamh) throws SQLException{
        String sql="select * from hinhanhct where MaMH='"+mamh+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<CTHinhAnh> list=new ArrayList<>();
        while(rs.next()){
            CTHinhAnh ct=new CTHinhAnh();
            ct.setHinhAnh(rs.getString("HinhAnh"));
            list.add(ct);
        }
        return list;
    }
    public CTHinhAnh getwithHinhAnh(String hinhanh) throws SQLException{
        String sql="select * from hinhanhct where HinhAnh='"+hinhanh+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        CTHinhAnh ct=new CTHinhAnh();
        while(rs.next()){
            ct.setMaMh(rs.getLong("MaMH"));
            ct.setHinhAnh(rs.getString("HinhAnh"));
       
        }
        return ct;
    }
    public ArrayList<CTHinhAnh> getListHinhAnh (Long maMH) throws SQLException
    {
        Connection con=DBConnect.getConnecttion();
        String sql="Select distinct(HinhAnh) from hinhanhct where MaMH='"+maMH+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<CTHinhAnh> list=new ArrayList<>();
        while(rs.next()){
             CTHinhAnh cTHinhAnh=new CTHinhAnh();
            cTHinhAnh.setHinhAnh(rs.getString("HinhAnh"));
            list.add(cTHinhAnh);
        }
        return list;
    }
    public boolean insert(CTHinhAnh ct) throws SQLException {
     
        String sql = "insert into hinhanhct values(?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setLong(1, ct.getMaMh());
            ps.setString(2, ct.getHinhAnh());
            ps.executeUpdate();
            return true;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }
    public boolean delete(Long mamh,String ha){
        String sql = "delete from hinhanhct where MaMH='"+mamh+"' and HinhAnh='"+ha+"'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }
}
