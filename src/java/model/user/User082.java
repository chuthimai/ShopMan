/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.user;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author maichu
 */
public class User082 {
    private String id;
    private String fullName;
    private Date dateOfBirth;
    private String email;
    private String password;
    private String address;
    private boolean gender;
    private SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");

    public User082(
            String id, 
            String fullName, 
            String dateOfBirth, 
            String email, 
            String password, 
            String address, 
            boolean gender
    ) {
        this.id = id;
        this.fullName = fullName;
        try {
            this.dateOfBirth = format.parse(dateOfBirth);
        } catch (ParseException ex) {
            this.dateOfBirth = null;
        }
        this.email = email;
        this.password = password;
        this.address = address;
        this.gender = gender;
    }

    public User082() {
    }

    // Getters and Setters
    public String getId() { 
        return id; 
    }
    public User082 setId(String id) { 
        this.id = id; 
        return this;
    }

    public String getFullName() { 
        return fullName; 
    }
    public User082 setFullName(String fullName) {
        this.fullName = fullName; 
        return this;
    }

    public Date getDateOfBirth() { 
        return dateOfBirth; 
    }
    public User082 setDateOfBirth(String dateOfBirth) throws ParseException { 
        this.dateOfBirth = format.parse(dateOfBirth);
        return this;
    }

    public String getEmail() { 
        return email; 
    }
    public User082 setEmail(String email) {
        this.email = email; 
        return this;
    }

    public String getPassword() { 
        return password; 
    }
    public User082 setPassword(String password) { 
        this.password = password; 
        return this;
    }

    public String getAddress() {
        return address; 
    }
    public User082 setAddress(String address) {
        this.address = address; 
        return this;
    }

    public boolean getGender() {
        return gender;
    }
    public User082 setGender(boolean gender) { 
        this.gender = gender;
        return this;
    }
}

