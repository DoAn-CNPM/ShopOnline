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
public class Items {
    private CTSanPham ctsanPham;
    private SanPham sanPham;
    private int quantity;
    private String color;
    private String size;

    public Items() {
    }

    public Items(CTSanPham ctsanPham, SanPham sanPham, int quantity, String color, String size) {
        this.ctsanPham = ctsanPham;
        this.sanPham = sanPham;
        this.quantity = quantity;
        this.color = color;
        this.size = size;
    }

    public CTSanPham getCtsanPham() {
        return ctsanPham;
    }

    public void setCtsanPham(CTSanPham ctsanPham) {
        this.ctsanPham = ctsanPham;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    
}
