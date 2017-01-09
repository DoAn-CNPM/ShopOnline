/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author kelvi
 */
public class HoaDon {
    private Long maHD;
    private Double tongTien;
    private Timestamp ngayTT;
    private Long maNV;
    private Long maDDH;

    public HoaDon() {
    }

    public HoaDon(Long maHD, Double tongTien, Timestamp ngayTT, Long maNV, Long maDDH) {
        this.maHD = maHD;
        this.tongTien = tongTien;
        this.ngayTT = ngayTT;
        this.maNV = maNV;
        this.maDDH = maDDH;
    }

    public Long getMaHD() {
        return maHD;
    }

    public void setMaHD(Long maHD) {
        this.maHD = maHD;
    }

    public Double getTongTien() {
        return tongTien;
    }

    public void setTongTien(Double tongTien) {
        this.tongTien = tongTien;
    }

    public Timestamp getNgayTT() {
        return ngayTT;
    }

    public void setNgayTT(Timestamp ngayTT) {
        this.ngayTT = ngayTT;
    }

    public Long getMaNV() {
        return maNV;
    }

    public void setMaNV(Long maNV) {
        this.maNV = maNV;
    }

    public Long getMaDDH() {
        return maDDH;
    }

    public void setMaDDH(Long maDDH) {
        this.maDDH = maDDH;
    }
    
    
}
