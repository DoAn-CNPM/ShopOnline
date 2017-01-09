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
import model.KhuyenMai;

/**
 *
 * @author kelvi
 */
public class KhuyenMaiDAO {
    Connection con=DBConnect.getConnecttion();
    public boolean insert(KhuyenMai km) throws SQLException
    {
        String sql="insert into khuyenmai values(?,?,?,?,?)";
        
        PreparedStatement ps;
        try{
            ps=con.prepareCall(sql);
            ps.setLong(1, km.getMaKM());
            ps.setString(2, km.getTenKM());
            ps.setDate(3, km.getNgayBD());
            ps.setDate(4, km.getNgayKT());
            ps.setInt(5, km.getLoai());
            ps.executeUpdate();
            return true;
            
        }catch(SQLException ex){
             Logger.getLogger(KhuyenMaiDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean update(KhuyenMai km) throws SQLException
    {
        String sql="update khuyenmai set TenKM=?, NgayBD=?,NgayKT=?,Loai=? where MaKM=?";
        
        PreparedStatement ps;
        try{
            ps=con.prepareCall(sql);
            ps.setLong(5, km.getMaKM());
            ps.setString(1, km.getTenKM());
            ps.setDate(2, km.getNgayBD());
            ps.setDate(3, km.getNgayKT());
            ps.setInt(4, km.getLoai());
            ps.executeUpdate();
            return true;
            
        }catch(SQLException ex){
             Logger.getLogger(KhuyenMaiDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public ArrayList<KhuyenMai> getListLoai() throws SQLException
    {
        String sql="select Loai from khuyemai";
        PreparedStatement ps=con.prepareCall(sql);
        
        ResultSet rs=ps.executeQuery();
        ArrayList<KhuyenMai> list=new ArrayList<>();
        while(rs.next()){
            KhuyenMai km=new KhuyenMai();
            km.setLoai(rs.getInt("Loai"));
            list.add(km);
        }
        return list;
    }
    public ArrayList<KhuyenMai> getListKM(String loai) throws SQLException{
        String sql="select TenKM,NgayBD,NgayKT from khuyemai where Loai='"+loai+"'";
        PreparedStatement ps=con.prepareCall(sql);
        
        ResultSet rs=ps.executeQuery();
        ArrayList<KhuyenMai> list=new ArrayList<>();
        while(rs.next()){
            KhuyenMai km=new KhuyenMai();
            km.setTenKM(rs.getString("TenKM"));
            km.setNgayBD(rs.getDate("NgayBD"));
            km.setNgayKT(rs.getDate("NgayKT"));
            list.add(km);
        }
        return list;
    }
    public KhuyenMai getWithMaKM(Long maKM) throws SQLException{
        String sql="select * from khuyenmai where MaKM='"+maKM+"'";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        KhuyenMai km=new KhuyenMai();
        while(rs.next()){
            km.setMaKM(rs.getLong("MaKM"));
            km.setTenKM(rs.getString("TenKM"));
            km.setNgayBD(rs.getDate("NgayBD"));
            km.setNgayKT(rs.getDate("NgayKT"));
            km.setLoai(rs.getInt("Loai"));
        }
        return km;
    }
    public ArrayList<KhuyenMai> getAll() throws SQLException{
        String sql="select * from khuyenmai";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<KhuyenMai> list=new ArrayList<>();
        while(rs.next()){
            KhuyenMai km=new KhuyenMai();
            km.setMaKM(rs.getLong("MaKM"));
            km.setTenKM(rs.getString("TenKM"));
            km.setNgayBD(rs.getDate("NgayBD"));
            km.setNgayKT(rs.getDate("NgayKT"));
            km.setLoai(rs.getInt("Loai"));
            list.add(km);
        }
        return list;
    }
    public boolean delete(Long makm) throws SQLException{
        String sql="delete from khuyenmai where MaKM='"+makm+"'";
        PreparedStatement ps;
        try{
            ps=con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        }
        catch(SQLException ex){
             Logger.getLogger(KhuyenMaiDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
