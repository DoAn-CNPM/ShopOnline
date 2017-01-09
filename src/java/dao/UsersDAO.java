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
import model.NhanVien;
import model.Role;

/**
 *
 * @author Kelvin
 */
public class UsersDAO {

    // Kiểm tra username
    public boolean check(String userName) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from nhanvien where UserName='" + userName + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    public boolean checkEmail(String userName, String email) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from nhanvien where UserName='" + userName + "' and Email='" + email + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return true;
            }
        } catch (SQLException e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    // lấy tất cả nhân viên
    public ArrayList<NhanVien> getListNV() throws SQLException {
        Connection connect = DBConnect.getConnecttion();
        String sql = "Select *  from nhanvien where UserName!='Admin'";
        PreparedStatement ps = connect.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<NhanVien> list = new ArrayList<>();

        while (rs.next()) {
            NhanVien nhanVien = new NhanVien();
            nhanVien.setMaNV(rs.getLong("MaNV"));
            nhanVien.setUserName(rs.getString("UserName"));
            nhanVien.setPassWord(rs.getString("PASSWORD"));
            nhanVien.setHoTen(rs.getString("HoTen"));
            nhanVien.setGioiTinh(rs.getString("GioiTinh"));
            nhanVien.setNgSinh(rs.getDate("NgSinh"));
            nhanVien.setSDT(rs.getString("SDT"));
            nhanVien.setEmail(rs.getString("Email"));
            nhanVien.setDiaChi(rs.getString("DChi"));
            nhanVien.setRoleID(rs.getString("RoleID"));
            list.add(nhanVien);
        }
        return list;
    }

    // Thêm nhân viên
    public boolean insertUsers(NhanVien u) throws SQLException {
        Connection con = DBConnect.getConnecttion();

        String sql = "insert into nhanvien values(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.setLong(1, u.getMaNV());
            ps.setString(2, u.getUserName());
            ps.setString(3, u.getPassWord());
            ps.setString(4, u.getHoTen());
            ps.setString(5, u.getGioiTinh());
            ps.setDate(6, u.getNgSinh());
            ps.setString(7, u.getSDT());
            ps.setString(8, u.getEmail());
            ps.setString(9, u.getImage());
            ps.setString(10, u.getDiaChi());
            ps.setString(11, u.getRoleID());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }

    // Đăng nhập
    public NhanVien login(String userName, String pass, String roleID) throws SQLException {
        Connection con = DBConnect.getConnecttion();

        String sql = "Select * from nhanvien where UserName='" + userName + "' and PASSWORD='" + pass + "' and RoleID='" + roleID + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                NhanVien nhanVien = new NhanVien();
                nhanVien.setMaNV(rs.getLong("MaNV"));
                nhanVien.setUserName(rs.getString("UserName"));
                nhanVien.setPassWord(rs.getString("PASSWORD"));
                nhanVien.setHoTen(rs.getString("HoTen"));
                nhanVien.setGioiTinh(rs.getString("GioiTinh"));
                nhanVien.setNgSinh(rs.getDate("NgSinh"));
                nhanVien.setSDT(rs.getString("SDT"));
                nhanVien.setImage(rs.getString("HinhAnh"));
                nhanVien.setEmail(rs.getString("Email"));
                nhanVien.setDiaChi(rs.getString("DChi"));
                nhanVien.setRoleID(rs.getString("RoleID"));
                con.close();
                return nhanVien;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<Role> getListRole() throws SQLException {
        Connection connect = DBConnect.getConnecttion();
        String sql = "Select *  from role";
        PreparedStatement ps = connect.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<Role> list = new ArrayList<>();
        while (rs.next()) {
            Role rl = new Role();
            rl.setRoleID(rs.getString("RoleID"));
            rl.setRoleName(rs.getString("RoleName"));
            list.add(rl);
        }
        return list;
    }

    public void updateNhanVien(NhanVien nv) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "update nhanvien set UserName=?,PASSWORD=?,HoTen=?,GioiTinh=?,NgSinh=?,SDT=?,Email=?,DChi=? where MaNV=?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, nv.getUserName());
            ps.setString(2, nv.getPassWord());
            ps.setString(3, nv.getHoTen());
            ps.setString(4, nv.getGioiTinh());
            ps.setDate(5, nv.getNgSinh());
            ps.setString(6, nv.getSDT());
            ps.setString(7, nv.getEmail());
            ps.setString(8, nv.getDiaChi());
            ps.setLong(9, nv.getMaNV());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public boolean deleteNhanVien(Long maNV) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "delete from nhanvien where MaNV='" + maNV + "'";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public NhanVien getNVwithMaNV(Long MaNV) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from nhanvien where MaNV='" + MaNV + "'";
        PreparedStatement ps;
        NhanVien nv = new NhanVien();
        ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            nv.setUserName(rs.getString("UserName"));
            nv.setPassWord(rs.getString("PASSWORD"));
            nv.setHoTen(rs.getString("HoTen"));
            nv.setGioiTinh(rs.getString("GioiTinh"));
            nv.setNgSinh(rs.getDate("NgSinh"));
            nv.setSDT(rs.getString("SDT"));
            nv.setEmail(rs.getString("Email"));
            nv.setDiaChi(rs.getString("DChi"));
            nv.setRoleID(rs.getString("RoleID"));
            nv.setImage(rs.getString("HinhAnh"));
        }
        return nv;
    }
    public NhanVien getNVwithTenNV(Long username) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Select * from nhanvien where UserName='" + username + "'";
        PreparedStatement ps;
        NhanVien nv = new NhanVien();
        ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            nv.setMaNV(rs.getLong("MaNV"));
            nv.setUserName(rs.getString("UserName"));
            nv.setPassWord(rs.getString("PASSWORD"));
            nv.setHoTen(rs.getString("HoTen"));
            nv.setGioiTinh(rs.getString("GioiTinh"));
            nv.setNgSinh(rs.getDate("NgSinh"));
            nv.setSDT(rs.getString("SDT"));
            nv.setEmail(rs.getString("Email"));
            nv.setDiaChi(rs.getString("DChi"));
            nv.setRoleID(rs.getString("RoleID"));
            nv.setImage(rs.getString("HinhAnh"));
        }
        return nv;
    }
    public void update(NhanVien nv) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "update nhanvien set PASSWORD=?,HoTen=?,GioiTinh=?,NgSinh=?,SDT=?,Email=?,DChi=? where MaNV=?";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setString(1, nv.getPassWord());
            ps.setString(2, nv.getHoTen());
            ps.setString(3, nv.getGioiTinh());
            ps.setDate(4, nv.getNgSinh());
            ps.setString(5, nv.getSDT());
            ps.setString(6, nv.getEmail());
            ps.setString(7, nv.getDiaChi());
            ps.setLong(8, nv.getMaNV());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UsersDAO.class.getName()).log(Level.SEVERE, null, ex);

        }
    }

    public boolean updateImage(String link, String maNV) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Update nhanvien set HinhAnh='" + link + "' where MaNV='" + maNV + "'";
        PreparedStatement ps = con.prepareCall(sql);
        ps.executeUpdate();
        return true;
    }

    public boolean updatePass(String pass, String maNV) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Update nhanvien set PASSWORD='" + pass + "' where MaNV='" + maNV + "'";
        PreparedStatement ps = con.prepareCall(sql);
        ps.executeUpdate();
        return true;
    }
 public boolean updatePassWithUsername(String pass, String username) throws SQLException {
        Connection con = DBConnect.getConnecttion();
        String sql = "Update nhanvien set PASSWORD='" + pass + "' where UserName='" + username + "'";
        PreparedStatement ps = con.prepareCall(sql);
        ps.executeUpdate();
        return true;
    }
    public static void main(String[] args) throws SQLException {
    }
}
