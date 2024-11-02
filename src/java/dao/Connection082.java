/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author maichu
 */
public class Connection082 {
    private static final Connection082 connection082 = new Connection082();
    private Connection connection;

    public Connection082() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/shop_man?useSSL=false", "root", "12345678");
        } catch (ClassNotFoundException | SQLException ex) {
            System.out.println("Error connection 082");
        }
        
    }
    
    public static Connection082 getInstance() {
        return connection082;
    }

    public Connection getConnection() {
        return connection;
    }
    
}
