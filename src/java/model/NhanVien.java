/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Kelvin
 */
public class NhanVien {

    private Long maNV;
    private String userName;
    private String passWord;
    private String hoTen;
    private String gioiTinh;
    private Date ngSinh;
    private String SDT;
    private String Email;
    private String diaChi;
    private String roleID;
    private String Image;

    public NhanVien() {
    }

    public NhanVien(Long maNV, String userName, String passWord, String hoTen, String gioiTinh, Date ngSinh, String SDT, String Email, String diaChi, String roleID, String Image) {
        this.maNV = maNV;
        this.userName = userName;
        this.passWord = passWord;
        this.hoTen = hoTen;
        this.gioiTinh = gioiTinh;
        this.ngSinh = ngSinh;
        this.SDT = SDT;
        this.Email = Email;
        this.diaChi = diaChi;
        this.roleID = roleID;
        this.Image = Image;
    }

    public Long getMaNV() {
        return maNV;
    }

    public void setMaNV(Long maNV) {
        this.maNV = maNV;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getHoTen() {
        return hoTen;
    }

    public void setHoTen(String hoTen) {
        this.hoTen = hoTen;
    }

    public String getGioiTinh() {
        return gioiTinh;
    }

    public void setGioiTinh(String gioiTinh) {
        this.gioiTinh = gioiTinh;
    }

    public Date getNgSinh() {
        return ngSinh;
    }

    public void setNgSinh(Date ngSinh) {
        this.ngSinh = ngSinh;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getDiaChi() {
        return diaChi;
    }

    public void setDiaChi(String diaChi) {
        this.diaChi = diaChi;
    }

    public String getRoleID() {
        return roleID;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public String getImage() {
        return Image;
    }

    public void setImage(String Image) {
        this.Image = Image;
    }

}
