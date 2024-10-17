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
public class Employee082 extends User082 {
    private String position;

    public Employee082(
            String id, 
            String fullName, 
            String dateOfBirth, 
            String email, 
            String password, 
            String address, 
            boolean gender, 
            String position
    ) throws ParseException {
        super(id, fullName, dateOfBirth, email, password, address, gender);
        this.position = position;
    }

    public Employee082() {
    }
    
    

    // Getters and Setters
    public String getPosition() { 
        return position; 
    }
    public void setPosition(String position) { 
        this.position = position; 
    }
}
