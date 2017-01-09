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
import model.DonDatHang;

/**
 *
 * @author kelvi
 */
public class DonDatHangDAO {

    public void insertDDH(DonDatHang ddh) throws SQLException {
        Connection conn = DBConnect.getConnecttion();
        String sql = "Insert into dondathang values(?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = conn.prepareCall(sql);
            ps.setLong(1, ddh.getMaDDH());
            ps.setString(2, ddh.getTenKH());
            ps.setString(3, ddh.getDiaChi());
            ps.setString(4, ddh.getEmail());
            ps.setString(5, ddh.getSoDT());
            ps.setString(6, ddh.getGhiChu());
            ps.executeUpdate();

        } catch (SQLException e) {
            Logger.getLogger(DonDatHangDAO.class.getName()).log(Level.SEVERE, null, e);
        }

    }

    public int sumSL() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT count(MaDDH) as SLDDH from dondathang";
        PreparedStatement ps;
        int SL = 0;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SL = rs.getInt("SLDDH");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return SL;
    }

    public ArrayList<DonDatHang> getlistDDH() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from dondathang";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<DonDatHang> list = new ArrayList<>();
        while (rs.next()) {
            DonDatHang ddh = new DonDatHang();
            ddh.setMaDDH(rs.getLong("MaDDH"));
            ddh.setTenKH(rs.getString("TenKH"));
            ddh.setDiaChi(rs.getString("DChi"));
            ddh.setEmail(rs.getString("Email"));
            ddh.setSoDT(rs.getString("SDT"));
            ddh.setGhiChu(rs.getString("GhiChu"));
            list.add(ddh);

        }
        return list;
    }
    public ArrayList<DonDatHang> getDDHnotHD() throws SQLException{
        Connection con=DBConnect.getConnecttion();
        String sql="SELECT * from dondathang where MaDDH not in (SELECT MaDDH from hoadon)";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<DonDatHang> list = new ArrayList<>();
        while (rs.next()) {
            DonDatHang ddh = new DonDatHang();
            ddh.setMaDDH(rs.getLong("MaDDH"));
            ddh.setTenKH(rs.getString("TenKH"));
            ddh.setDiaChi(rs.getString("DChi"));
            ddh.setEmail(rs.getString("Email"));
            ddh.setSoDT(rs.getString("SDT"));
            ddh.setGhiChu(rs.getString("GhiChu"));
            list.add(ddh);

        }
        return list;
    }
    public DonDatHang getDDHbyID(long maDDH) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from dondathang where MaDDH = " + maDDH;
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        DonDatHang ddh = new DonDatHang();
        while (rs.next()) {

            ddh.setMaDDH(rs.getLong("MaDDH"));
            ddh.setTenKH(rs.getString("TenKH"));
            ddh.setDiaChi(rs.getString("DChi"));
            ddh.setEmail(rs.getString("Email"));
            ddh.setSoDT(rs.getString("SDT"));
            ddh.setGhiChu(rs.getString("GhiChu"));

        }
        return ddh;
    }
     public Long randomMaDDH() throws SQLException{
        Connection con = DBConnect.getConnecttion();
        String sql = "select MaDDH from dondathang order by RAND() limit 0,1";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        Long maddh=new Date().getTime();
        while(rs.next()){
            maddh=rs.getLong("MaDDH");
        }
        return maddh;
    }
     public ArrayList<DonDatHang> getListDDHcoHD() throws SQLException
    {
        Connection con=DBConnect.getConnecttion();
        String sql="SELECT ct.MaDDH,ct.TenKH,ct.DChi,ct.Email,ct.SDT,ct.GhiChu "
                +"from hoadon hd inner join dondathang ct on hd.MaDDH=ct.MaDDH ";
        PreparedStatement ps=con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        ArrayList<DonDatHang> list=new ArrayList<>();
        while(rs.next()){
            DonDatHang ddh=new DonDatHang();
            ddh.setMaDDH(rs.getLong("MaDDH"));
            ddh.setTenKH(rs.getString("TenKH"));
            ddh.setDiaChi(rs.getString("DChi"));
            ddh.setEmail(rs.getString("Email"));
            ddh.setSoDT(rs.getString("SDT"));
            ddh.setGhiChu(rs.getString("GhiChu"));
            list.add(ddh);
        }
        return list;
    }
     public boolean delete(Long maDDH) throws SQLException{
          Connection con=DBConnect.getConnecttion();
        String sql="delete from dondathang where MaDDH='"+maDDH+"'";
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
    
}
