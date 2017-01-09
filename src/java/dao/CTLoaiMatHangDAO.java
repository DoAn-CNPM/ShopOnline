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
import model.CTLoaiMatHang;

/**
 *
 * @author kelvi
 */
public class CTLoaiMatHangDAO {

    public ArrayList<CTLoaiMatHang> getAll() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from ctloaimathang";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<CTLoaiMatHang> list = new ArrayList<>();
        while (rs.next()) {
            CTLoaiMatHang cTLoaiMatHang = new CTLoaiMatHang();

            cTLoaiMatHang.setMaLoaiMH(rs.getLong("MaLoaiMH"));
            cTLoaiMatHang.setTenLoaiMH(rs.getString("TenLoaiMH"));
            cTLoaiMatHang.setMaLoai(rs.getLong("MaLoai"));
            list.add(cTLoaiMatHang);
        }
        return list;
    }

    public ArrayList<CTLoaiMatHang> getListCTLoaiMH(long maLoai) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from ctloaimathang where MaLoai='" + maLoai + "'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<CTLoaiMatHang> list = new ArrayList<>();
        while (rs.next()) {
            CTLoaiMatHang cTLoaiMatHang = new CTLoaiMatHang();

            cTLoaiMatHang.setMaLoaiMH(rs.getLong("MaLoaiMH"));
            cTLoaiMatHang.setTenLoaiMH(rs.getString("TenLoaiMH"));
            cTLoaiMatHang.setMaLoai(rs.getLong("MaLoai"));
            list.add(cTLoaiMatHang);
        }
        return list;
    }

    public CTLoaiMatHang getCTLoaiMH(Long maLoaiMH) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from ctloaimathang where MaLoaiMH='" + maLoaiMH + "'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        CTLoaiMatHang cTLoaiMatHang = new CTLoaiMatHang();
        while (rs.next()) {
            cTLoaiMatHang.setMaLoai(rs.getLong("MaLoai"));
            cTLoaiMatHang.setTenLoaiMH(rs.getString("TenLoaiMH"));
        }
        return cTLoaiMatHang;
    }

    public void insertCTLoaiMH(CTLoaiMatHang lsp) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Insert into ctloaimathang values(?,?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setLong(1, lsp.getMaLoaiMH());
            ps.setString(2, lsp.getTenLoaiMH());
            ps.setLong(3, lsp.getMaLoai());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CTLoaiMatHangDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    
    public void update(CTLoaiMatHang lsp) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "update ctloaimathang set TenLoaiMH=? where MaLoaiMH=?";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setString(1, lsp.getTenLoaiMH());
            ps.setLong(2, lsp.getMaLoaiMH());
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CTLoaiMatHangDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public void delete(Long maLoaiMH) {
        Connection con = DBConnect.getConnecttion();
        String sql = "Delete from ctloaimathang where MaLoaiMH='" + maLoaiMH + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(CTLoaiMatHangDAO.class.getName()).log(Level.SEVERE, null, e);
        }
    }

    public Long randomMaLoaiMH() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT MaLoaiMH from ctloaimathang ORDER BY RAND() LIMIT 0,1";
        PreparedStatement ps;

            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            Long maloaimh=new Date().getTime();
            while(rs.next()){
                maloaimh=rs.getLong("MaLoaiMH");
            }
        
        return  maloaimh;
    }
    public Long getMaLoaiMHGiayNam() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql ="SELECT ct.MaLoaiMH FROM "
                + "(SELECT MaLoai from loaimathang WHERE TenLoai='Giày') a INNER JOIN ctloaimathang ct on a.MaLoai=ct.MaLoai "
                + "WHERE ct.TenLoaiMH='Giày nam'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Long maLoai = new Date().getTime();
        while (rs.next()) {
            maLoai = rs.getLong("MaLoaiMH");
        }
        return maLoai;
    }

    public Long getMaLoaiMHGiayNu() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT ct.MaLoaiMH FROM "
                + "(SELECT MaLoai from loaimathang WHERE TenLoai='Giày') a INNER JOIN ctloaimathang ct on a.MaLoai=ct.MaLoai "
                + "WHERE ct.TenLoaiMH='Giày nữ'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Long maLoai = new Date().getTime();
        while (rs.next()) {
            maLoai = rs.getLong("MaLoaiMH");
        }
        return maLoai;
    }
}
