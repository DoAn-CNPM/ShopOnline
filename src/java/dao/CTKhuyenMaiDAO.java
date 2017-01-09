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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CTKhuyenMai;

/**
 *
 * @author kelvi
 */
public class CTKhuyenMaiDAO {

    Connection con = DBConnect.getConnecttion();

    public boolean insert(CTKhuyenMai ct) throws SQLException {
        String sql = "insert into ctkhuyenmai values(?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setLong(1, ct.getMaMH());
            ps.setLong(2, ct.getMaKM());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(CTKhuyenMaiDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public ArrayList<CTKhuyenMai> getlistCTKMNgayBD() throws SQLException{
        String sql="SELECT ct.MaMH,ct.MaKM FROM khuyenmai km INNER JOIN ctkhuyenmai ct on km.MaKM=ct.MaKM WHERE NgayBD=CURDATE()";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<CTKhuyenMai> list=new ArrayList<>();
        while(rs.next()){
            CTKhuyenMai ct=new CTKhuyenMai();
            ct.setMaMH(rs.getLong("MaMH"));
            ct.setMaKM(rs.getLong("MaKM"));
            list.add(ct);
        }
        return list;
    }
    public ArrayList<CTKhuyenMai> getlistCTKMNgayKT() throws SQLException{
        String sql="SELECT ct.MaMH,ct.MaKM FROM khuyenmai km INNER JOIN ctkhuyenmai ct on km.MaKM=ct.MaKM WHERE NgayKT=CURDATE()";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<CTKhuyenMai> list=new ArrayList<>();
        while(rs.next()){
            CTKhuyenMai ct=new CTKhuyenMai();
            ct.setMaMH(rs.getLong("MaMH"));
            ct.setMaKM(rs.getLong("MaKM"));
            list.add(ct);
        }
        return list;
    }
    public CTKhuyenMai getWithMaKM(Long makm) throws SQLException
    {
        String sql="select * from ctkhuyenmai where MaKM='"+makm+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        CTKhuyenMai ct=new CTKhuyenMai();
        while(rs.next()){
            ct.setMaKM(rs.getLong("MaKM"));
            ct.setMaMH(rs.getLong("MaMH"));
            
        }
        return ct;
    }
    public boolean delete(Long makm,Long mamh) throws SQLException{
        String sql="delete from ctkhuyenmai where MaKM='"+makm+"' and MaMH='"+mamh+"'";
         PreparedStatement ps;
         try{
             ps=con.prepareCall(sql);
             ps.executeUpdate();
             return true;
        }catch (SQLException ex) {
            Logger.getLogger(CTKhuyenMaiDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
