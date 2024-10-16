/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.ordering;

/**
 *
 * @author maichu
 */
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.util.Date;
import model.user.Client082;
import model.user.Seller082;
import model.user.Shipper082;

public class Invoice082 {
    private String id;
    private Date orderingTime;
    private Date paymentTime;
    private Date deliveryTime;
    private Client082 client;
    private Seller082 seller;
    private Shipper082 shipper;
    private float totalPrice;
    private final SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");

    public Invoice082(Client082 client, float totalPrice) throws ParseException {
        this.client = client;
        this.totalPrice = totalPrice;
//        this.orderingTime = Date.from(Instant.now()); //  sử dụng múi giờ UTC
        this.orderingTime = new Date();
    }

    public Invoice082() {
    }
    
    

    public Invoice082(
            String id, 
            Date orderingTime,
            Date paymentTime, 
            Date deliveryTime, 
            Client082 client, 
            Seller082 seller, 
            Shipper082 shipper, 
            float totalPrice
    ) {
        this.id = id;
        this.orderingTime = orderingTime;
        this.paymentTime = paymentTime;
        this.deliveryTime = deliveryTime;
        this.client = client;
        this.seller = seller;
        this.shipper = shipper;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public String getId() { 
        return id; 
    }
    public void setId(String id) {
        this.id = id; 
    }

    public Date getOrderingTime() { 
        return orderingTime;
    }
    public void setOrderingTime(Date orderingTime) { 
        this.orderingTime = orderingTime; 
    }

    public Date getPaymentTime() { 
        return paymentTime; 
    }
    public void setPaymentTime(Date paymentTime) { 
        this.paymentTime = paymentTime; 
    }

    public Date getDeliveryTime() { 
        return deliveryTime;
    }
    public void setDeliveryTime(Date deliveryTime) { 
        this.deliveryTime = deliveryTime; 
    }

    public Client082 getClient() { 
        return client; 
    }
    public void setClient(Client082 client) { 
        this.client = client; 
    }

    public Seller082 getSeller() { 
        return seller;
    }
    public void setSeller(Seller082 seller) {
        this.seller = seller; 
    }

    public Shipper082 getShipper() { 
        return shipper; 
    }
    public void setShipper(Shipper082 shipper) { 
        this.shipper = shipper; 
    }

    public float getTotalPrice() { 
        return totalPrice; 
    }
    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice; 
    }
}

