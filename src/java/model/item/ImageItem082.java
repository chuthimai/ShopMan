/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.item;

/**
 *
 * @author maichu
 */
public class ImageItem082 {
    private String id;
    private String idItem;
    private String link;

    public ImageItem082() {
    }

    public ImageItem082(String id, String idItem, String link) {
        this.idItem = idItem;
        this.link = link;
    }

    // Getters and Setters
    public String getId() {
        return id;
    }

    public ImageItem082 setId(String id) {
        this.id = id;
        return this;
    }

    public String getIdItem() { 
        return idItem; 
    }
    public ImageItem082 setIdItem(String idItem) { 
        this.idItem = idItem; 
        return this;
    }

    public String getLink() { 
        return link; 
    }
    public void setLink(String link) {
        this.link = link; 
    }
}

