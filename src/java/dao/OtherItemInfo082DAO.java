/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.item.OtherItemInfo082;

/**
 *
 * @author maichu
 */
public class OtherItemInfo082DAO extends DAO{
    
    private Connection connection;

    public OtherItemInfo082DAO() throws SQLException, ClassNotFoundException {
        super();
        connection = super.getConnection();
    }
    
    
    public boolean addOtherItemInfo082(OtherItemInfo082 info) {
        String ADD_OTHER_ITEM_INFO = "CALL add_other_item_info(?, ?, ?)";
        
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_OTHER_ITEM_INFO);
            preparedStatement.setString(1, info.getIdItem());
            preparedStatement.setString(2, info.getNameInfo());
            preparedStatement.setString(3, info.getDetailInfo());
            System.out.println(preparedStatement);
            preparedStatement.execute();
            System.out.println("After execute add other info: " + preparedStatement);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
