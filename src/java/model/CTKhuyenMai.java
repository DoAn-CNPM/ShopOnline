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
public class CTKhuyenMai {
    private Long maMH;
    private Long maKM;

    public CTKhuyenMai() {
    }

    public CTKhuyenMai(Long maMH, Long maKM) {
        this.maMH = maMH;
        this.maKM = maKM;
    }

    public Long getMaMH() {
        return maMH;
    }

    public void setMaMH(Long maMH) {
        this.maMH = maMH;
    }

    public Long getMaKM() {
        return maKM;
    }

    public void setMaKM(Long maKM) {
        this.maKM = maKM;
    }
    
    
}
