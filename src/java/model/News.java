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
 * @author kelvi
 */
public class News {
    private Long id;
    private String title;
    private Blob hinhanh;
    private Date ngaydang;
    private Date tungay;
    private Date denngay;
    private String adcho;
    private String noidung;

    public News() {
    }

    public News(Long id, String title, Blob hinhanh, Date ngaydang, Date tungay, Date denngay, String adcho, String noidung) {
        this.id = id;
        this.title = title;
        this.hinhanh = hinhanh;
        this.ngaydang = ngaydang;
        this.tungay = tungay;
        this.denngay = denngay;
        this.adcho = adcho;
        this.noidung = noidung;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Blob getHinhanh() {
        return hinhanh;
    }

    public void setHinhanh(Blob hinhanh) {
        this.hinhanh = hinhanh;
    }

    public Date getNgaydang() {
        return ngaydang;
    }

    public void setNgaydang(Date ngaydang) {
        this.ngaydang = ngaydang;
    }

    public Date getTungay() {
        return tungay;
    }

    public void setTungay(Date tungay) {
        this.tungay = tungay;
    }

    public Date getDenngay() {
        return denngay;
    }

    public void setDenngay(Date denngay) {
        this.denngay = denngay;
    }

    public String getAdcho() {
        return adcho;
    }

    public void setAdcho(String adcho) {
        this.adcho = adcho;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }
    
    
}
