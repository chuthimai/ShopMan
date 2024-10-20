/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.ordering;
import java.util.HashMap;
import java.util.Map;
import model.item.ImageItem082;

/**
 *
 * @author maichu
 */
public class ShoppingCart082 {
    private Map<OrderedItem082, ImageItem082> items;

    public ShoppingCart082() {
        items = new HashMap<>();
    }

    public Map<OrderedItem082, ImageItem082> getItems() {
        return items;
    }
    
    public void addItem(OrderedItem082 orderedItem, ImageItem082 image) {
        items.put(orderedItem, image);
    }
    
    public void resetShoppingCart() {
        items.clear();
    }
    
}
