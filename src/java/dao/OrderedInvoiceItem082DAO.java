/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Map;
import model.item.ImageItem082;
import model.ordering.OrderedItem082;
import model.ordering.ShoppingCart082;


/**
 *
 * @author maichu
 */
public class OrderedInvoiceItem082DAO extends DAO{
    private Connection connection;

    public OrderedInvoiceItem082DAO() throws SQLException, ClassNotFoundException {
        super();
        connection = super.getConnection();
    }
    
    
    
    boolean addOrderedInvoiceItem(String idInvoice, ShoppingCart082 shoppingCart) {
        String ADD_ORDER_INVOICE_ITEM = "CALL add_ordered_invoice_item(?, ?, ?)";
        
        for (Map.Entry<OrderedItem082, ImageItem082> item: shoppingCart.getItems().entrySet()) {
            try {
                PreparedStatement preparedStatement = connection.prepareStatement(ADD_ORDER_INVOICE_ITEM);
                preparedStatement.setString(1, item.getKey().getId());
                preparedStatement.setString(2, idInvoice);
                preparedStatement.setInt(3, item.getKey().getOrderedQuantity());
                preparedStatement.execute();
            } catch (SQLException e) {
                return false;
            }
        }
        return true;
         
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
