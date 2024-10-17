/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.text.ParseException;
import model.user.Client082;
import model.user.Manager082;
import model.user.Seller082;
import model.user.User082;

/**
 *
 * @author maichu
 */
public class Login082DAO extends DAO{
    private Connection connection;

    public Login082DAO() throws SQLException, ClassNotFoundException {
        super();
        connection = super.getConnection();
    }
    
    public User082 login(String email, String password) throws ParseException {
        String SELECT_USER = "SELECT * FROM tblUser082 "
                + "WHERE (email=? AND password=?)";
                
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, password);
            
            ResultSet rs = preparedStatement.executeQuery();
            System.out.println(">>>> " + preparedStatement.toString());
            
            while (rs.next()) {    
                String id = rs.getString("id");
                System.out.println("id: " + id);
                String fullName = rs.getString("fullName");
                String address = rs.getString("address");
                String phoneNumber = rs.getString("phoneNumber");
                boolean gender = rs.getBoolean("gender");
             
                if (id.startsWith("C")) {
                    boolean isMember = isMember(id);
                    Client082 client = new Client082();
                    client.setId(id).setFullName(fullName).setEmail(email).setAddress(address).setGender(gender);
                    client.setMember(isMember);
                    return client;
                } else if (id.startsWith("M")) {
                    Manager082 manager = new Manager082();
                    manager.setId(id).setFullName(fullName).setEmail(email).setAddress(address).setPassword(password).setGender(gender);
                    return manager;
                } else if (id.startsWith("S")) {
                    Seller082 seller = new Seller082(id, fullName, null, email, password, address, gender);
                    return seller;
                }
                
            }
        } catch (SQLException ex) {
            printSQLException(ex);
            System.out.println(">>>> try catch");
            return null;
        }
        return null;
         
    }
    
    private String getPosition(String id) {
        String SELECT_EMPLOYEE = "SELECT * FROM tblEmployee082 WHERE id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE);
            preparedStatement.setString(1, id);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {                
                String position = rs.getString("position");
                return position;           
            }
                    
        } catch (SQLException ex) {
            printSQLException(ex);
        }
        return null;
    }
    
    private boolean isMember(String id) {
        String SELECT_CLIENT = "SELECT * FROM tblClient082 WHERE id=?";
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_CLIENT);
            preparedStatement.setString(1, id);
            
            ResultSet rs = preparedStatement.executeQuery();
            
            while (rs.next()) {                
                boolean isMember = rs.getBoolean("isMember");
                return isMember;           
            }
                    
        } catch (SQLException ex) {
            printSQLException(ex);
        }
        return false;
    }
    
    private void printSQLException(SQLException ex) {
        for (Throwable e: ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
