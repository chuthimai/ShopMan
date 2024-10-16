/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.item;

/**
 *
 * @author maichu
 */
public class Type082 {
    private String id;
    private String name;
    private Type082 parentType = null;

    public Type082() {
    }

    public Type082(String id, String name) {
        this.id = id;
        this.name = name;
    }

    public String getId() {
        return id;
    }

    public Type082 setId(String id) {
        this.id = id;
        return this;
    }

    public String getName() {
        return name;
    }

    public Type082 setName(String name) {
        this.name = name;
        return this;
    }

    public Type082 getParentType() {
        return parentType;
    }

    public void setParentType(Type082 parentType) {
        this.parentType = parentType;
    }
    
    
}
