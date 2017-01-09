/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Blob;
import java.sql.Date;

/**
 *
 * @author Kelvin
 */
public class SanPham {

    private Long maMH;
    private String tenMH;
    private Blob hinhAnh;
    private String moTa;
    private int soLuong;
    private double donGia;
    private int discount;
    private Long maLoaiMH;
    private Date ngayThem;

    public SanPham() {
        super();
        // TODO Auto-generated constructor stub
    }

    public SanPham(Long maMH, String tenMH, Blob hinhAnh, String moTa, int soLuong, double donGia, int discount,
            Long maLoaiMH, Date ngayThem) {
        super();
        this.maMH = maMH;
        this.tenMH = tenMH;
        this.hinhAnh = hinhAnh;
        this.moTa = moTa;
        this.soLuong = soLuong;
        this.donGia = donGia;
        this.discount = discount;
        this.maLoaiMH = maLoaiMH;
        this.ngayThem = ngayThem;
    }

    public Long getMaMH() {
        return maMH;
    }

    public void setMaMH(Long maMH) {
        this.maMH = maMH;
    }

    public String getTenMH() {
        return tenMH;
    }

    public void setTenMH(String tenMH) {
        this.tenMH = tenMH;
    }

    public Blob getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(Blob hinhAnh) {
        this.hinhAnh = hinhAnh;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public double getDonGia() {
        return donGia;
    }

    public void setDonGia(double donGia) {
        this.donGia = donGia;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public Long getMaLoaiMH() {
        return maLoaiMH;
    }

    public void setMaLoaiMH(Long maLoaiMH) {
        this.maLoaiMH = maLoaiMH;
    }

    public Date getNgayThem() {
        return ngayThem;
    }

    public void setNgayThem(Date ngayThem) {
        this.ngayThem = ngayThem;
    }
}
