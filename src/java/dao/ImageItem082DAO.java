/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import model.item.ImageItem082;
import java.sql.ResultSet;

/**
 *
 * @author maichu
 */
public class ImageItem082DAO extends DAO {
    private Connection connection;

    public ImageItem082DAO() throws SQLException, ClassNotFoundException {
        super();
        connection = super.getConnection();
    }
    
    
    public boolean addImageItem082(ImageItem082 imageItem) {
        String ADD_IMAGE_ITEM = "CALL add_image_item(?, ?)";
        
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(ADD_IMAGE_ITEM);
            preparedStatement.setString(1, imageItem.getIdItem());
            preparedStatement.setString(2, imageItem.getLink());
            System.out.println(preparedStatement);
            preparedStatement.execute();
            System.out.println("After execute add image: " + preparedStatement);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
    
    public ImageItem082 getAnImage(String idItem) {
        String SELECT_AN_IMAGE = "SELECT * FROM tblImageItem082 WHERE idItem = ?";
        
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_AN_IMAGE);
            preparedStatement.setString(1, idItem);
            ResultSet result = preparedStatement.executeQuery();
            
            while (result.next()) {
                String id = result.getString("id");
                String idI = result.getString("idItem");
                String link = result.getString("link");
                
                ImageItem082 image = new ImageItem082(id, idItem, link);
                return image;
            }
        } catch (Exception e) {
            return null;
        }
        return null;
    }
}
