/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.Connection;
/**
 *
 * @author maichu
 */
public class DAO {
    private Connection082 connection082 = Connection082.getInstance();
    public DAO() {
       
    }

    public Connection getConnection() {
        return connection082.getConnection();
    }
        
}
