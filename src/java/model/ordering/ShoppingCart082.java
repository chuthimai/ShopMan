/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.ordering;

import java.util.ArrayList;

/**
 *
 * @author maichu
 */
public class ShoppingCart082 {
    final private static ShoppingCart082 shoppingCart = new ShoppingCart082();
    private ArrayList<OrderedItem082> items;

    public ShoppingCart082() {
        items = new ArrayList<>();
    }

    public ArrayList<OrderedItem082> getItems() {
        return items;
    }

    public static ShoppingCart082 getShoppingCart() {
        return shoppingCart;
    }
    
    public void addItem(OrderedItem082 orderedItem) {
        items.add(orderedItem);
    }
    
    public void resetShoppingCart() {
        items = new ArrayList<>();
    }
    
}
