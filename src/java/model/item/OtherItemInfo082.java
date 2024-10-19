/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.item;

/**
 *
 * @author maichu
 */
public class OtherItemInfo082 {
    private String id;
    private String idItem;
    private String nameInfo;
    private String detailInfo;

    public OtherItemInfo082() {
    }
    
    

    public OtherItemInfo082(String id, String idItem, String nameInfo, String detailInfo) {
        this.id = id;
        this.idItem = idItem;
        this.nameInfo = nameInfo;
        this.detailInfo = detailInfo;
    }

    // Getters and Setters
    public String getId() { 
        return id; 
    }
    public OtherItemInfo082 setId(String id) { 
        this.id = id; 
        return this;
    }

    public String getIdItem() { 
        return idItem; 
    }
    public OtherItemInfo082 setIdItem(String idItem) { 
        this.idItem = idItem; 
        return this;
    }

    public String getNameInfo() { 
        return nameInfo; 
    }
    public OtherItemInfo082 setNameInfo(String nameInfo) { 
        this.nameInfo = nameInfo; 
        return this;
    }

    public String getDetailInfo() { 
        return detailInfo; 
    }
    public OtherItemInfo082 setDetailInfo(String detailInfo) { 
        this.detailInfo = detailInfo;
        return this;
    }
}

