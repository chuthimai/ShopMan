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

    public OrderedItem082(Item082 item082, int orderedQuantity) {
        super(
                item082.getId(), 
                item082.getNameItem(), 
                item082.getExpiry(), 
                item082.getBrand(), 
                item082.getType(), 
                item082.getUnit(), 
                item082.getExportedPrice()
        );
        this.orderedQuantity = orderedQuantity;
    }
    
    

    

    // Getters and Setters
    public int getOrderedQuantity() { 
        return orderedQuantity; 
    }
    
    public void setOrderedQuantity(int orderedQuantity) { 
        this.orderedQuantity = orderedQuantity; 
    }
    
    public double getTotalPrice() {
        return orderedQuantity * this.getExportedPrice();
    }
}

