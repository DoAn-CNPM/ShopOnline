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
import model.CTSanPham;

/**
 *
 * @author kelvi
 */
public class CTMatHangDAO {
    public boolean insert(CTSanPham ct) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "insert into ctmathang values(?,?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setLong(1, ct.getMaMH());
            ps.setString(2, ct.getSize());
            ps.setString(3, ct.getMauSac());
            ps.executeUpdate();
            return true;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
    }
    public ArrayList<CTSanPham> getListColor (Long maMH) throws SQLException
    {
        Connection con=DBConnect.getConnecttion();
        String sql="Select distinct(MauSac) from ctmathang where MaMH='"+maMH+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<CTSanPham> list=new ArrayList<>();
        
        while(rs.next()){
            CTSanPham cTSanPham=new CTSanPham();
            cTSanPham.setMauSac(rs.getString("MauSac"));
            list.add(cTSanPham);
        }
        return list;
    }
    public ArrayList<CTSanPham> getListSize (Long maMH) throws SQLException
    {
        Connection con=DBConnect.getConnecttion();
        String sql="Select distinct(Size) from ctmathang where MaMH='"+maMH+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<CTSanPham> list=new ArrayList<>();
        
        while(rs.next()){
            CTSanPham cTSanPham=new CTSanPham();
            cTSanPham.setSize(rs.getString("Size"));
            list.add(cTSanPham);
        }
        return list;
    }
   public CTSanPham getSPWithMaSP (Long maMH) throws SQLException
    {
        Connection con=DBConnect.getConnecttion();
        String sql="Select * from ctmathang where MaMH='"+maMH+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        CTSanPham cTSanPham=new CTSanPham();
        while(rs.next()){
             cTSanPham.setMaMH(rs.getLong("MaMH"));
             cTSanPham.setSize(rs.getString("Size"));
             cTSanPham.setMauSac(rs.getString("MauSac"));
        }
        return cTSanPham;
    }
   public ArrayList<CTSanPham> getListWithMaSP (Long maMH) throws SQLException
    {
        Connection con=DBConnect.getConnecttion();
        String sql="Select * from ctmathang where MaMH='"+maMH+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<CTSanPham> list=new ArrayList<>();
        while(rs.next()){
            CTSanPham cTSanPham=new CTSanPham();
             cTSanPham.setMaMH(rs.getLong("MaMH"));
             cTSanPham.setSize(rs.getString("Size"));
             cTSanPham.setMauSac(rs.getString("MauSac"));
             list.add(cTSanPham);
        }
        return list;
    }
   public boolean update(CTSanPham ct){
       Connection con = DBConnect.getConnecttion();
        String sql = "update ctmathang set MauSac=?,Size=? where MaMH=?";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setLong(3, ct.getMaMH());
            ps.setString(2, ct.getSize());
            ps.setString(1, ct.getMauSac());
            ps.executeUpdate();
            return true;
        }
        catch(SQLException ex){
            ex.printStackTrace();
        }
        return false;
   }
   public boolean delete(Long mamh,String mausac,String size){
       Connection con = DBConnect.getConnecttion();
        String sql = "delete from ctmathang where MaMH='"+mamh+"' and MauSac='"+mausac+"' and Size='"+size+"'";
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
    public static void main(String[] args) throws SQLException {
       
    }
}
