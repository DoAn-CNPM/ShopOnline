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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.CTDonDatHang;

/**
 *
 * @author kelvi
 */
public class CTDonDatHangDAO {

    public ArrayList<CTDonDatHang> getlistDDH(Long maDDH) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from ctdondathang where MaDDH = '" + maDDH + "'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<CTDonDatHang> list = new ArrayList<>();
        while (rs.next()) {
            CTDonDatHang ddh = new CTDonDatHang();
            ddh.setMaMH(rs.getLong("MaMH"));
            ddh.setSize(rs.getString("Size"));
            ddh.setMauSac(rs.getString("MauSac"));
            ddh.setSlMua(rs.getInt("SLMua"));
            ddh.setDonGia(rs.getDouble("DonGia"));
            ddh.setTongTien(rs.getDouble("TongTien"));
            list.add(ddh);
        }
        return list;
    }

    public void insertCTDDH(CTDonDatHang ct) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Insert into ctdondathang values(?,?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setLong(1, ct.getMaMH());
            ps.setLong(2, ct.getMaDDH());
            ps.setString(3, ct.getSize());
            ps.setString(4, ct.getMauSac());
            ps.setInt(5, ct.getSlMua());
            ps.setDouble(6, ct.getDonGia());
            ps.setDouble(7, ct.getTongTien());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getSLMuatheoMAMH(Long maMH) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT SUM(ct.SLMua) as SL FROM ctdondathang ct INNER JOIN hoadon hd on ct.MaDDH=hd.MaDDH "
                + "WHERE MaMH='" + maMH + "' GROUP BY MaMH";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int SL = 0;
        while (rs.next()) {
            SL = rs.getInt("SL");
        }
        return SL;
    }
    
    public double getTT(long maDDH) throws SQLException
    {
        Connection con=DBConnect.getConnecttion();
        String sql="select sum(TongTien) as TT  from ctdondathang where MaDDH = '"+maDDH+"'";
        PreparedStatement ps;
        ps = (PreparedStatement)con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        double TT = 0;
        while(rs.next()){
        	TT = rs.getDouble("TT");
        }
        return TT;
    }
    public boolean delete(Long maDDH) throws SQLException{
        Connection con=DBConnect.getConnecttion();
        String sql="delete from ctdondathang where MaDDH='"+maDDH+"'";
        PreparedStatement ps;
        try{
            ps=con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        }catch(SQLException e){
            Logger.getLogger(DonDatHangDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
     } 
    public ArrayList<CTDonDatHang> getSLmuaAndMaMH(Long maDDH) throws SQLException{
        Connection con=DBConnect.getConnecttion();
        String sql="select MaMH,SLMua from ctdondathang where MaDDH = '"+maDDH+"'";
        PreparedStatement ps;
        ps = (PreparedStatement)con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<CTDonDatHang> list=new ArrayList<>();
       
        while(rs.next()){
             CTDonDatHang ct=new CTDonDatHang();
        	ct.setMaMH(rs.getLong("MaMH"));
                ct.setSlMua(rs.getInt("SLMua"));
                list.add(ct);
        }
        return list;
    }
}
