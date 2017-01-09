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
public class CTHinhAnh {
    private Long maMh;
    private String hinhAnh;

    public CTHinhAnh() {
    }

    public CTHinhAnh(Long maMh, String hinhAnh) {
        this.maMh = maMh;
        this.hinhAnh = hinhAnh;
    }

    public Long getMaMh() {
        return maMh;
    }

    public void setMaMh(Long maMh) {
        this.maMh = maMh;
    }

    public String getHinhAnh() {
        return hinhAnh;
    }

    public void setHinhAnh(String hinhAnh) {
        this.hinhAnh = hinhAnh;
    }
    
    
}
