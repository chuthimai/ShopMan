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
public class DAO {
    private Connection connection;
    
    public DAO() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager
            .getConnection("jdbc:mysql://localhost:3306/shop_man?useSSL=false", "root", "12345678");
    }

    public Connection getConnection() {
        return connection;
    }
        
}
