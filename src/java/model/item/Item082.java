/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.item;

/**
 *
 * @author maichu
 */
public class Item082 {
    private String id;
    private String nameItem;
    private String expiry;
    private String brand;
    private Type082 type;
    private String unit;
    private float exportedPrice;

    public Item082() {
    }

    public Item082(String id, String nameItem, String expiry, String brand, Type082 type, String unit, float exportedPrice) {
        this.id = id;
        this.nameItem = nameItem;
        this.expiry = expiry;
        this.brand = brand;
        this.type = type;
        this.unit = unit;
        this.exportedPrice = exportedPrice;
    }

    public String getId() {
        return id;
    }

    public Item082 setId(String id) {
        this.id = id;
        return this;
    }

    public String getNameItem() {
        return nameItem;
    }

    public Item082 setNameItem(String nameItem) {
        this.nameItem = nameItem;
        return this;
    }

    public String getExpiry() {
        return expiry;
    }

    public Item082 setExpiry(String expiry) {
        this.expiry = expiry;
        return this;
    }

    public String getBrand() {
        return brand;
    }

    public Item082 setBrand(String brand) {
        this.brand = brand;
        return this;
    }

    public Type082 getType() {
        return type;
    }

    public Item082 setType(Type082 type) {
        this.type = type;
        return this;
    }

    public String getUnit() {
        return unit;
    }

    public Item082 setUnit(String unit) {
        this.unit = unit;
        return this;
    }

    public float getExportedPrice() {
        return exportedPrice;
    }

    public Item082 setExportedPrice(float exportedPrice) {
        this.exportedPrice = exportedPrice;
        return this;
    }
    
}
