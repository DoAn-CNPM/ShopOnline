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
public class CTDonDatHang {
    private Long maMH;
    private Long maDDH;
    private String size;
    private String mauSac;
    private int slMua;
    private double donGia;
    private double tongTien;

    public CTDonDatHang() {
    }

    public CTDonDatHang(Long maMH, Long maDDH, String size, String mauSac, int slMua, double donGia, double tongTien) {
        this.maMH = maMH;
        this.maDDH = maDDH;
        this.size = size;
        this.mauSac = mauSac;
        this.slMua = slMua;
        this.donGia = donGia;
        this.tongTien = tongTien;
    }

    public long getMaMH() {
        return maMH;
    }

    public void setMaMH(Long maMH) {
        this.maMH = maMH;
    }

    public long getMaDDH() {
        return maDDH;
    }

    public void setMaDDH(Long maDDH) {
        this.maDDH = maDDH;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public String getMauSac() {
        return mauSac;
    }

    public void setMauSac(String mauSac) {
        this.mauSac = mauSac;
    }

    public int getSlMua() {
        return slMua;
    }

    public void setSlMua(int slMua) {
        this.slMua = slMua;
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

    public double getTongTien() {
        return tongTien;
    }

    public void setTongTien(double tongTien) {
        this.tongTien = tongTien;
    }
    
    
}
