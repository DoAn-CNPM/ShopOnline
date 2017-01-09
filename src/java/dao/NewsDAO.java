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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.News;

/**
 *
 * @author kelvi
 */
public class NewsDAO {

    Connection con = DBConnect.getConnecttion();

    public boolean insert(News n, InputStream is) throws SQLException {

        String sql = "insert into news values(?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ps.setLong(1, n.getId());
            ps.setString(2, n.getTitle());
            ps.setBlob(3, is);
            ps.setDate(4, n.getNgaydang());
            ps.setDate(5, n.getTungay());
            ps.setDate(6, n.getDenngay());
            ps.setString(7, n.getAdcho());
            ps.setString(8, n.getNoidung());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean update(News n) throws SQLException {
        String sql = "update news set Title=?,TuNgay=?,DenNgay=?,ADCho=?,NoiDung=? where ID=?";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);

            ps.setString(1, n.getTitle());
            ps.setDate(2, n.getTungay());
            ps.setDate(3, n.getDenngay());
            ps.setString(4, n.getAdcho());
            ps.setString(5, n.getNoidung());
            ps.setLong(6, n.getId());
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public News getwithID(Long id) {
        String sql = "select * from news where ID='" + id + "'";
        try {
            PreparedStatement ps = con.prepareCall(sql);
            ResultSet rs = ps.executeQuery();

            News n = new News();
            while (rs.next()) {
                n.setId(rs.getLong("ID"));
                n.setTitle(rs.getString("Title"));
                n.setHinhanh(rs.getBlob("HinhAnh"));
                n.setNgaydang(rs.getDate("NgayDang"));
                n.setTungay(rs.getDate("TuNgay"));
                n.setDenngay(rs.getDate("DenNgay"));
                n.setAdcho(rs.getString("ADCho"));
                n.setNoidung(rs.getString("NoiDung"));
            }
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean delete(Long id) throws SQLException {
        String sql = "delete from news where ID='" + id + "'";
        PreparedStatement ps;
        try {
            ps = con.prepareCall(sql);
            ps.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(NewsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<News> getAll() throws SQLException {
        String sql = "select * from news";
        PreparedStatement ps;
        ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<News> list = new ArrayList<>();
        while (rs.next()) {
            News n = new News();
            n.setId(rs.getLong("ID"));
            n.setTitle(rs.getString("Title"));
            n.setHinhanh(rs.getBlob("HinhAnh"));
            n.setNgaydang(rs.getDate("NgayDang"));
            n.setTungay(rs.getDate("TuNgay"));
            n.setDenngay(rs.getDate("DenNgay"));
            n.setAdcho(rs.getString("ADCho"));
            n.setNoidung(rs.getString("NoiDung"));
            list.add(n);
        }
        return list;
    }
    public ArrayList<News> getrandom() throws SQLException
    {
        String sql = "select * from news order by rand() limit 0,4";
        PreparedStatement ps;
        ps = con.prepareCall(sql);
        ResultSet rs = ps.executeQuery();
        ArrayList<News> list = new ArrayList<>();
        while (rs.next()) {
            News n = new News();
            n.setId(rs.getLong("ID"));
            n.setTitle(rs.getString("Title"));
            n.setHinhanh(rs.getBlob("HinhAnh"));
            n.setNgaydang(rs.getDate("NgayDang"));
            n.setTungay(rs.getDate("TuNgay"));
            n.setDenngay(rs.getDate("DenNgay"));
            n.setAdcho(rs.getString("ADCho"));
            n.setNoidung(rs.getString("NoiDung"));
            list.add(n);
        }
        return list;
    }
}
