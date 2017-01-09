/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import connect.DBConnect;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.SanPham;

/**
 *
 * @author Kelvin
 */
public class SanPhamDAO {

    // lấy sản phẩm theo loại sản phẩm
    public ArrayList<SanPham> getlistSpWithMaLoai(Long maLoaiMH) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from mathang where MaLoaiMH='" + maLoaiMH + "'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<SanPham> list = new ArrayList<>();
        while (rs.next()) {
            SanPham sanPham = new SanPham();

            sanPham.setMaMH(rs.getLong("MaMH"));
            sanPham.setTenMH(rs.getString("TenMH"));
            sanPham.setSoLuong(rs.getInt("SoLuong"));
            sanPham.setDonGia(rs.getDouble("DonGia"));
            sanPham.setMoTa(rs.getString("MoTa"));
            sanPham.setHinhAnh(rs.getBlob("HinhAnh"));
            sanPham.setDiscount(rs.getInt("Discount"));
            sanPham.setMaLoaiMH(rs.getLong("MaLoaiMH"));
            sanPham.setNgayThem(rs.getDate("NgayThem"));
            list.add(sanPham);
        }
        return list;
    }

    // Lấy sản phẩm theo mã sản phẩm
    public SanPham getSanPham(Long maMH) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from mathang where MaMH='" + maMH + "'";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        SanPham sanPham = new SanPham();
        while (rs.next()) {
            sanPham.setMaMH(rs.getLong("MaMH"));
            sanPham.setTenMH(rs.getString("TenMH"));
            sanPham.setHinhAnh(rs.getBlob("HinhAnh"));
            sanPham.setMoTa(rs.getString("MoTa"));
            sanPham.setSoLuong(rs.getInt("SoLuong"));
            sanPham.setDonGia(rs.getDouble("DonGia"));
            sanPham.setMaLoaiMH(rs.getLong("MaLoaiMH"));
            sanPham.setDiscount(rs.getInt("Discount"));
            sanPham.setNgayThem(rs.getDate("NgayThem"));
        }
        return sanPham;
    }

    // Update số lượng mặt hàng
    public boolean updateSL(SanPham sp) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Update mathang set SoLuong=? where MaMH=?";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setInt(1, sp.getSoLuong());
            ps.setLong(2, sp.getMaMH());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
        }
        return false;
    }

    // Lấy số lượng sản phẩm theo mã sản phẫm
    public int getSL(Long maMH) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select SoLuong from mathang where MaMH='" + maMH + "'";
        PreparedStatement ps;
        ps = con.prepareCall(sql);
        int SL = 0;
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            SL = rs.getInt("SoLuong");
        }
        return SL;
    }

    //
    public int sumSL() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "select sum(SoLuong) as SLSP from mathang";
        PreparedStatement ps;
        int SL = 0;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                SL = rs.getInt("SLSP");
            }
        } catch (SQLException ex) {
        }
        return SL;
    }

    public boolean UpdateDiscount(SanPham sp, String From) {
        Connection con = DBConnect.getConnecttion();
        String sql = "update mathang set Discount=? where MaLoaiMH=? and CURDATE()='" + From + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setInt(1, sp.getDiscount());
            ps.setLong(2, sp.getMaLoaiMH());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
        }
        return false;
    }

    // lấy danh sách sản phẩm
    public ArrayList<SanPham> getListProductByNav(long categoryID, int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM mathang WHERE MaLoaiMH = '" + categoryID + "' limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<SanPham> list = new ArrayList<>();
        while (rs.next()) {
            SanPham sp = new SanPham();
            sp.setMaMH(rs.getLong("MaMH"));
            sp.setTenMH(rs.getString("TenMH"));
            sp.setHinhAnh(rs.getBlob("HinhAnh"));
            sp.setMoTa(rs.getString("MoTa"));
            sp.setSoLuong(rs.getInt("SoLuong"));
            sp.setDonGia(rs.getDouble("DonGia"));
            sp.setDiscount(rs.getInt("Discount"));
            sp.setMaLoaiMH(rs.getLong("MaLoaiMH"));
            list.add(sp);
        }
        return list;
    }
   
    // tính tổng sản phẩm
    public int countProductByCategory(long categoryID) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(MaMH) FROM mathang WHERE MaLoaiMH = '" + categoryID + "'";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    // lấy danh sách sản phẩm mới
    public ArrayList<SanPham> getListNewProduct(int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM mathang WHERE CURDATE() <= ADDDATE(NgayThem,7) order by RAND()  limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<SanPham> list = new ArrayList<>();
        while (rs.next()) {
            SanPham sp = new SanPham();
            sp.setMaMH(rs.getLong("MaMH"));
            sp.setTenMH(rs.getString("TenMH"));
            sp.setHinhAnh(rs.getBlob("HinhAnh"));
            sp.setMoTa(rs.getString("MoTa"));
            sp.setSoLuong(rs.getInt("SoLuong"));
            sp.setDonGia(rs.getDouble("DonGia"));
            sp.setDiscount(rs.getInt("Discount"));
            sp.setMaLoaiMH(rs.getLong("MaLoaiMH"));
            list.add(sp);
        }
        return list;
    }
     public ArrayList<SanPham> getListProductByMaLoai(long maLoai, int firstResult, int maxResult) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT mh.MaMH,mh.TenMH,mh.HinhAnh,mh.DonGia,mh.Discount,a.MaLoaiMH "
                        +"from (select MaLoaiMH FROM ctloaimathang WHERE MaLoai='"+maLoai+"') a "
                        + "INNER JOIN mathang mh on a.MaLoaiMH=mh.MaLoaiMH limit ?,?";
        PreparedStatement ps = connection.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<SanPham> list = new ArrayList<>();
        while (rs.next()) {
            SanPham sp = new SanPham();
            sp.setMaMH(rs.getLong("MaMH"));
            sp.setTenMH(rs.getString("TenMH"));
            sp.setHinhAnh(rs.getBlob("HinhAnh"));
            sp.setDonGia(rs.getDouble("DonGia"));
            sp.setDiscount(rs.getInt("Discount"));
            sp.setMaLoaiMH(rs.getLong("MaLoaiMH"));
            list.add(sp);
        }
        return list;
    }
     public int countProductByMaLoai(long maloai) throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(mh.MaMH) from (select MaLoaiMH FROM ctloaimathang WHERE MaLoai='"+maloai+"') a "
                        + "INNER JOIN mathang mh on a.MaLoaiMH=mh.MaLoaiMH";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }
    // tính tổng sản phẩm mới
    public int countNewProduct() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT count(MaMH) FROM mathang WHERE CURDATE() <= ADDDATE(NgayThem,7)";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }

    // random sản phẩm
    public ArrayList<SanPham> ranListProduct() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT * FROM mathang ORDER BY RAND() LIMIT 0,8";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<SanPham> list = new ArrayList<>();
        while (rs.next()) {
            SanPham sp = new SanPham();
            sp.setMaMH(rs.getLong("MaMH"));
            sp.setTenMH(rs.getString("TenMH"));
            sp.setHinhAnh(rs.getBlob("HinhAnh"));
            sp.setMoTa(rs.getString("MoTa"));
            sp.setSoLuong(rs.getInt("SoLuong"));
            sp.setDonGia(rs.getDouble("DonGia"));
            sp.setDiscount(rs.getInt("Discount"));
            sp.setMaLoaiMH(rs.getLong("MaLoaiMH"));
            list.add(sp);
        }
        return list;
    }

    public ArrayList<SanPham> getListSPNB1() throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT mh.MaMH,mh.TenMH,mh.HinhAnh,mh.DonGia,mh.Discount "
                + "FROM (SELECT MaMH,SUM(SLMua) as SL from ctdondathang GROUP BY MaMH) a INNER JOIN mathang mh on a.MaMH=mh.MaMH "
                + "WHERE a.SL>10 ORDER BY RAND() LIMIT 0,6";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<SanPham> list = new ArrayList<>();
        while (rs.next()) {
            SanPham sp = new SanPham();
            sp.setMaMH(rs.getLong("MaMH"));
            sp.setTenMH(rs.getString("TenMH"));
            sp.setHinhAnh(rs.getBlob("HinhAnh"));
            sp.setDonGia(rs.getDouble("DonGia"));
            sp.setDiscount(rs.getInt("Discount"));
            list.add(sp);
        }
        return list;
    }
    // tính tổng sản phẩm nổi bật

    public int countProductNB() throws SQLException {
        Connection connection = DBConnect.getConnecttion();
        String sql = "SELECT Count(mh.MaMH) "
                + "FROM (SELECT MaMH,SUM(SLMua) as SL from ctdondathang GROUP BY MaMH) a INNER JOIN mathang mh on a.MaMH=mh.MaMH "
                + "WHERE a.SL>10";
        PreparedStatement ps = connection.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        int count = 0;
        while (rs.next()) {
            count = rs.getInt(1);
        }
        return count;
    }

    public ArrayList<SanPham> getListSPNB2(int firstResult, int maxResult) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT mh.MaMH,mh.TenMH,mh.HinhAnh,mh.MoTa,mh.SoLuong,mh.DonGia,mh.Discount "
                + "FROM (SELECT MaMH,SUM(SLMua) as SL from ctdondathang GROUP BY MaMH) a INNER JOIN mathang mh on a.MaMH=mh.MaMH "
                + "WHERE a.SL>10 ORDER BY RAND() LIMIT ?,?";
        PreparedStatement ps = con.prepareCall(sql);
        ps.setInt(1, firstResult);
        ps.setInt(2, maxResult);
        ResultSet rs = ps.executeQuery();
        ArrayList<SanPham> list = new ArrayList<>();
        while (rs.next()) {
            SanPham sp = new SanPham();
            sp.setMaMH(rs.getLong("MaMH"));
            sp.setTenMH(rs.getString("TenMH"));
            sp.setHinhAnh(rs.getBlob("HinhAnh"));
            sp.setMoTa(rs.getString("MoTa"));
            sp.setSoLuong(rs.getInt("SoLuong"));
            sp.setDonGia(rs.getDouble("DonGia"));
            sp.setDiscount(rs.getInt("Discount"));
            list.add(sp);
        }
        return list;
    }

    public ArrayList<SanPham> getWithMaLoai(Long maLoai) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "SELECT mh.MaMH,mh.TenMH FROM "
                + "(SELECT MaLoaiMH FROM ctloaimathang WHERE MaLoai='" + maLoai + "') a INNER JOIN mathang mh on a.MaLoaiMH=mh.MaLoaiMH";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<SanPham> list = new ArrayList<>();
        while (rs.next()) {
            SanPham sp = new SanPham();
            sp.setMaMH(rs.getLong("MaMH"));
            sp.setTenMH(rs.getString("TenMH"));
            list.add(sp);
        }
        return list;
    }

    public boolean updateDiscount(Long mamh, int discount) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "update mathang set Discount='" + discount + "' where MaMH='" + mamh + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
        }
        return false;
    }

    public boolean updateDiscount0(Long mamh) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "update mathang set Discount='0' where MaMH='" + mamh + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
        }
        return false;
    }
    public boolean insertsanpham(SanPham sp, InputStream is) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "insert into mathang  values(?,?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setLong(1, sp.getMaMH());
            ps.setString(2, sp.getTenMH());
            ps.setBlob(3, is);
            ps.setString(4, sp.getMoTa());
            ps.setInt(5, sp.getSoLuong());
            ps.setDouble(6, sp.getDonGia());
            ps.setInt(7, sp.getDiscount());
            ps.setLong(8, sp.getMaLoaiMH());
            ps.setDate(9, sp.getNgayThem());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public boolean updatesanpham(SanPham sp) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "update mathang set TenMH=?, Mota=?, SoLuong=?, DonGia=?, NgayThem=? where MaMH=?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
           
            ps.setString(1, sp.getTenMH());
            ps.setString(2, sp.getMoTa());
            ps.setInt(3, sp.getSoLuong());
            ps.setDouble(4, sp.getDonGia());
            ps.setDate(5, sp.getNgayThem());
             ps.setLong(6, sp.getMaMH());
            return ps.executeUpdate() == 1;
        } catch (SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public Long randomMaMH() throws SQLException{
        Connection con = DBConnect.getConnecttion();
        String sql = "select MaMH from mathang order by RAND() limit 0,1";
        PreparedStatement ps = con.prepareCall(sql);
        ResultSet rs=ps.executeQuery();
        Long mamh=new Date().getTime();
        while(rs.next()){
            mamh=rs.getLong("MaMH");
        }
        return mamh;
    }
    public boolean delete(Long mamh) throws SQLException{
        Connection con = DBConnect.getConnecttion();
        String sql = "delete from mathang where MaMH='"+mamh+"'";
        PreparedStatement ps;
        try{
            ps= con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        }catch(SQLException ex) {
            Logger.getLogger(SanPhamDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    public static void main(String[] args) throws SQLException {
        SanPhamDAO sanPhamDAO = new SanPhamDAO();
        for (SanPham sp : sanPhamDAO.getlistSpWithMaLoai(Long.parseLong("1"))) {
            System.out.println(sp.getHinhAnh());
        }
    }
}
