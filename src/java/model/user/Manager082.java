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
public class Manager082 extends Employee082 {
    public Manager082(
            String id, 
            String fullName, 
            String dateOfBirth, 
            String email, 
            String password, 
            String address, 
            boolean gender 
    ) throws ParseException{
        super(id, fullName, dateOfBirth, email, password, address, gender, "Manager");
    }
    
}
