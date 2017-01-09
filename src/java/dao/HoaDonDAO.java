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
import java.util.Date;
import model.HoaDon;

/**
 *
 * @author kelvi
 */
public class HoaDonDAO {

    public int sumSL() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "select count(MaHD) as SLHD from hoadon";
        PreparedStatement ps;
        int SL = 0;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SL = rs.getInt("SLHD");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return SL;
    }

    public double tongTien() {
        Connection con = DBConnect.getConnecttion();
        String sql = "select sum(TongTien) as TongTien from hoadon";
        PreparedStatement ps;
        double SL = 0;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SL = rs.getInt("TongTien");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return SL;
    }
    public boolean insertHD(HoaDon ct) throws SQLException
    {
        Connection con=DBConnect.getConnecttion();
        String sql="Insert into hoadon values(?,?,?,?,?)";
        PreparedStatement ps;
        try{
            ps=con.prepareCall(sql);
            ps.setLong(1, ct.getMaHD());
            ps.setDouble(2, ct.getTongTien());
            ps.setTimestamp(3,ct.getNgayTT());
            ps.setLong(4, ct.getMaNV());
            ps.setLong(5, ct.getMaDDH());
            	            
            ps.executeUpdate();
            return true;
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return false;
    }
    public ArrayList<HoaDon> getlistHD() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from hoadon ORDER BY NgayThanhToan DESC";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<HoaDon> list = new ArrayList<>();
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setMaHD(rs.getLong("MaHD"));	
            hd.setTongTien(rs.getDouble("TongTien"));
            hd.setNgayTT(rs.getTimestamp("NgayThanhToan"));
            hd.setMaNV(rs.getLong("MaNV"));
            hd.setMaDDH(rs.getLong("MaDDH"));
            list.add(hd);	            
        }
        return list;
    }
    public ArrayList<HoaDon> getlistMonth(Date from, Date to) throws SQLException{
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from hoadon where NgayThanhToan between '"+from+"' and '"+to+"'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<HoaDon> list = new ArrayList<>();
        while (rs.next()) {
            HoaDon hd = new HoaDon();
            hd.setMaHD(rs.getLong("MaHD"));	
            hd.setTongTien(rs.getDouble("TongTien"));
            hd.setNgayTT(rs.getTimestamp("NgayThanhToan"));
            hd.setMaNV(rs.getLong("MaNV"));
            hd.setMaDDH(rs.getLong("MaDDH"));
            list.add(hd);	            
        }
        return list;
    }
}
