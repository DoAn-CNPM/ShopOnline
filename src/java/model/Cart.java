/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author kelvi
 */
public class Cart {

    private HashMap<Long, Items> cartItems;

    public Cart() {
        cartItems = new HashMap<>();
    }

    public Cart(HashMap<Long, Items> cartItems) {
        this.cartItems = cartItems;
    }

    public HashMap<Long, Items> getCartItems() {
        return cartItems;
    }

    public void setCartItems(HashMap<Long, Items> cartItems) {
        this.cartItems = cartItems;
    }

    public void plustoCart(Long key, int soluong, String color, String size, Items item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            item.setQuantity(soluong);
            item.setColor(color);
            item.setSize(size);
            cartItems.put(key, item);
        } else {
            cartItems.put(key, item);
        }
    }

    public void subtoCart(Long key, int soLuong, Items item) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            item.setQuantity(soLuong);
            cartItems.put(key, item);
        } else {
            cartItems.put(key, item);
        }
    }

    public void removetoCart(Long key) {
        boolean check = cartItems.containsKey(key);
        if (check) {
            cartItems.remove(key);
        }
    }

    public int countCart() {
        return cartItems.size();
    }

    public double totalCart() {
        double count = 0;
        double tmp=0;
        
        for (Map.Entry<Long, Items> list : cartItems.entrySet()) {
            tmp += list.getValue().getSanPham().getDonGia() * list.getValue().getQuantity();
           
            int discount = list.getValue().getSanPham().getDiscount();
            count += tmp-tmp*discount/ 100;

        }
        return count;
    }
}
