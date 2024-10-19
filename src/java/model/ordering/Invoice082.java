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
    public Invoice082 setId(String id) {
        this.id = id; 
        return this;
    }

    public Date getOrderingTime() { 
        return orderingTime;
    }
    public Invoice082 setOrderingTime(Date orderingTime) { 
        this.orderingTime = orderingTime; 
        return this;
    }

    public Date getPaymentTime() { 
        return paymentTime; 
    }
    public Invoice082 setPaymentTime(Date paymentTime) { 
        this.paymentTime = paymentTime; 
        return this;
    }

    public Date getDeliveryTime() { 
        return deliveryTime;
    }
    public Invoice082 setDeliveryTime(Date deliveryTime) { 
        this.deliveryTime = deliveryTime; 
        return this;
    }

    public Client082 getClient() { 
        return client; 
    }
    public Invoice082 setClient(Client082 client) { 
        this.client = client;
        return this;
    }

    public Seller082 getSeller() { 
        return seller;
    }
    public Invoice082 setSeller(Seller082 seller) {
        this.seller = seller; 
        return this;
    }

    public Shipper082 getShipper() { 
        return shipper; 
    }
    public Invoice082 setShipper(Shipper082 shipper) { 
        this.shipper = shipper;
        return this;
    }

    public float getTotalPrice() { 
        return totalPrice; 
    }
    public Invoice082 setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice; 
        return this;
    }
}

