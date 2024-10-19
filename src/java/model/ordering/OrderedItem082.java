/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.ordering;

import model.item.Item082;
import model.item.Type082;

/**
 *
 * @author maichu
 */
public class OrderedItem082 extends Item082{
    private int orderedQuantity;

    public OrderedItem082(
            String id, 
            String nameItem, 
            String expiry, 
            String brand, 
            Type082 type, 
            String unit, 
            float exportedPrice,
            int orderedQuantity
    ) {
        super(id, nameItem, expiry, brand, type, unit, exportedPrice);
        this.orderedQuantity = orderedQuantity;
    }

    

    // Getters and Setters
    public int getOrderedQuantity() { 
        return orderedQuantity; 
    }
    
    public void setOrderedQuantity(int orderedQuantity) { 
        this.orderedQuantity = orderedQuantity; 
    }
}

