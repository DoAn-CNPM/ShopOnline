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
import model.LoaiSanPham;

/**
 *
 * @author kelvi
 */
public class LoaiSanPhamDAO {

    public ArrayList<LoaiSanPham> getListLoaiSP() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from loaimathang";

        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<LoaiSanPham> list = new ArrayList<>();

        while (rs.next()) {
            LoaiSanPham loaiSanPham = new LoaiSanPham();
            loaiSanPham.setMaLoai(rs.getLong("MaLoai"));
            loaiSanPham.setTenLoai(rs.getString("TenLoai"));

            list.add(loaiSanPham);
        }
        return list;
    }

    public LoaiSanPham getLSPWithMaLoai(Long maLoai) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from loaimathang where MaLoai='" + maLoai + "'";

        PreparedStatement ps = con.prepareCall(sql);
        LoaiSanPham loaiSanPham = new LoaiSanPham();
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            loaiSanPham.setTenLoai(rs.getString("TenLoai"));
        }
        return loaiSanPham;
    }
    public LoaiSanPham getLSPWithMaLoaiSP(Long maLoaiSP) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT lmh.TenLoai FROM "
                +"(SELECT MaLoai FROM ctloaimathang WHERE MaLoaiMH='"+maLoaiSP+"') a INNER JOIN loaimathang lmh on a.MaLoai=lmh.MaLoai";

        PreparedStatement ps = con.prepareCall(sql);
        LoaiSanPham loaiSanPham = new LoaiSanPham();
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            loaiSanPham.setTenLoai(rs.getString("TenLoai"));
        }
        return loaiSanPham;
    }
    public boolean insertLoaiSanPham(LoaiSanPham l) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "insert into loaimathang values(?,?)";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setLong(1, l.getMaLoai());
            ps.setString(2, l.getTenLoai());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(LoaiSanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean updateLoaiSanPham(LoaiSanPham l) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "update loaimathang set TenLoai=? where MaLoai=?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, l.getTenLoai());
            ps.setLong(2, l.getMaLoai());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(LoaiSanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean deleteLoaiSanPham(Long MaLoai) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "delete from loaimathang where MaLoai=?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setLong(1, MaLoai);
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(LoaiSanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public Long getMaLoaiMHDoNam() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT MaLoai from loaimathang WHERE TenLoai='Đồ nam'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Long maLoai = new Date().getTime();
        while (rs.next()) {
            maLoai = rs.getLong("MaLoai");
        }
        return maLoai;
    }
    public Long getMaLoaiMHDoNu() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT MaLoai from loaimathang WHERE TenLoai='Đồ nữ'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Long maLoai = new Date().getTime();
        while (rs.next()) {
            maLoai = rs.getLong("MaLoai");
        }
        return maLoai;
    }
    public Long getMaLoaiMHGiay() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql ="SELECT MaLoai from loaimathang WHERE TenLoai='Giày'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Long maLoai = new Date().getTime();
        while (rs.next()) {
            maLoai = rs.getLong("MaLoai");
        }
        return maLoai;
    }
    public Long getMaLoaiMHAoKhoac() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT MaLoai from loaimathang WHERE TenLoai='Áo khoác'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        Long maLoai = new Date().getTime();
        while (rs.next()) {
            maLoai = rs.getLong("MaLoai");
        }
        return maLoai;
    }
    public static void main(String[] args) {

    }
}
