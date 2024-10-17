/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.user;

import java.text.ParseException;

/**
 *
 * @author maichu
 */
public class Client082 extends User082 {
    private boolean isMember = false;

    public Client082(
            String id, 
            String fullName, 
            String dateOfBirth, 
            String email, 
            String password, 
            String address, 
            boolean gender
    ) throws ParseException {
        super(id, fullName, dateOfBirth, email, password, address, gender);
    }

    public Client082() {
    }
    
    

    // Getters and Setters
    public boolean isMember() { 
        return isMember; 
    }
    public void setMember(boolean isMember) { 
        this.isMember = isMember; 
    }
}

