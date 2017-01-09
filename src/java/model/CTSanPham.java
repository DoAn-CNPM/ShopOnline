/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Kelvin
 */
public class CTSanPham {
    private Long maMH;
    private String size;
    private String mauSac;
    public CTSanPham() {
    }

    public CTSanPham(Long maMH, String size, String mauSac) {
        this.maMH = maMH;
        this.size = size;
        this.mauSac = mauSac;
    }

    public Long getMaMH() {
        return maMH;
    }

    public void setMaMH(Long maMH) {
        this.maMH = maMH;
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
}
