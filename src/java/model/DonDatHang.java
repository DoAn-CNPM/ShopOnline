/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author kelvi
 */
public class DonDatHang {
    private Long maDDH;
    private String tenKH;
    private String diaChi;
    private String Email;
    private String soDT;
    private String ghiChu;
    public DonDatHang() {
    }

    public DonDatHang(Long maDDH, String tenKH, String diaChi, String Email, String soDT, String ghiChu) {
        this.maDDH = maDDH;
        this.tenKH = tenKH;
        this.diaChi = diaChi;
        this.Email = Email;
        this.soDT = soDT;
        this.ghiChu = ghiChu;
    }

    public long getMaDDH() {
        return maDDH;
    }

    public void setMaDDH(Long maDDH) {
        this.maDDH = maDDH;
    }

    public String getTenKH() {
        return tenKH;
    }

    public void setTenKH(String tenKH) {
        this.tenKH = tenKH;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getSoDT() {
        return soDT;
    }

    public void setSoDT(String soDT) {
        this.soDT = soDT;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }

    
}
