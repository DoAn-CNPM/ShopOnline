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
public class CTLoaiMatHang {
    private  Long maLoaiMH;
    private String tenLoaiMH;
    private Long maLoai;
    public CTLoaiMatHang() {
    }

    public CTLoaiMatHang(Long maLoaiMH, String tenLoaiMH, Long maLoai) {
        this.maLoaiMH = maLoaiMH;
        this.tenLoaiMH = tenLoaiMH;
        this.maLoai = maLoai;
    }

    public long getMaLoaiMH() {
        return maLoaiMH;
    }

    public void setMaLoaiMH(Long maLoaiMH) {
        this.maLoaiMH = maLoaiMH;
    }

    public String getTenLoaiMH() {
        return tenLoaiMH;
    }

    public void setTenLoaiMH(String tenLoaiMH) {
        this.tenLoaiMH = tenLoaiMH;
    }

    public long getMaLoai() {
        return maLoai;
    }

    public void setMaLoai(Long maLoai) {
        this.maLoai = maLoai;
    }

   
}
