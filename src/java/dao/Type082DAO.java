/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.item.Type082;

/**
 *
 * @author maichu
 */
public class Type082DAO extends DAO{
    private Connection connection;
    
    public Type082DAO() throws SQLException, ClassNotFoundException {
        super();
        connection = super.getConnection();
    }
    
    
    public ArrayList<Type082> getAllType() {
        ArrayList<Type082> allType = new ArrayList<>();
        String SELECT_ALL_TYPE = "SELECT * FROM tblType082";
        
        try {
            
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE);
            ResultSet result = preparedStatement.executeQuery();

            while (result.next()) {
                String id = result.getString("id");
                String name = result.getString("name");
                String idParentType = result.getString("idParentType");
                if (idParentType != null) {
                    Type082 type = new Type082();
                    type.setId(id).setName(name);

                    allType.add(type);
                }
                
            }
        } catch (SQLException ex) {
            return null;
        }
        return allType;
    }
    
    public Type082 getType(String idIype) {
        String SELECT_ALL_TYPE = "SELECT * FROM tblType082 WHERE id=?";
        
        try {
           
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TYPE);
            preparedStatement.setString(1, idIype);
            ResultSet result = preparedStatement.executeQuery();

            while (result.next()) {
                String id = result.getString("id");
                String name = result.getString("name");
                String idParentType = result.getString("idParentType");
                Type082 type = new Type082();
                type.setId(id).setName(name);
                return type;
                
            }
        } catch (SQLException ex) {
            return null;
        }
        return null;
    }
   
}
