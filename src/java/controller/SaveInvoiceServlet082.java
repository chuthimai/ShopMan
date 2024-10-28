/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.Invoice082DAO;
import dao.OrderedInvoiceItem082DAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.item.ImageItem082;
import model.ordering.Invoice082;
import model.ordering.OrderedItem082;
import model.ordering.ShoppingCart082;
import model.user.Customer082;

/**
 *
 * @author maichu
 */
@WebServlet(name = "SaveInvoiceServlet", urlPatterns = {"/saveInvoiceServlet"})
public class SaveInvoiceServlet082 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        
        try {
            Invoice082DAO invoice082DAO = new Invoice082DAO();
            OrderedInvoiceItem082DAO orderedInvoiceItem082DAO = new OrderedInvoiceItem082DAO();
            
            Customer082 customer = (Customer082) session.getAttribute("user");
            ShoppingCart082 shoppingCart082 = (ShoppingCart082) session.getAttribute("shoppingCart");
            
            Map<OrderedItem082, ImageItem082> items = shoppingCart082.getItems();
            Invoice082 invoice = new Invoice082();
            double total = 0.0;
            for (Map.Entry<OrderedItem082, ImageItem082> item : items.entrySet()) {
                OrderedItem082 orderedItem = item.getKey();
                total += orderedItem.getTotalPrice();
            }
            
            invoice.setCustomer(customer).setTotalPrice((float) total);
            String idInvocie = invoice082DAO.addInvoice(invoice);
            invoice.setId(idInvocie);
            
            for (Map.Entry<OrderedItem082, ImageItem082> item : items.entrySet()) {
                OrderedItem082 orderedItem = item.getKey();
                orderedInvoiceItem082DAO.addOrderedInvoiceItem(
                        invoice, 
                        shoppingCart082
                );
            }
            shoppingCart082.resetShoppingCart();
            session.setAttribute("shoppingCart", shoppingCart082);
            session.setAttribute("success", "Lưu đơn hàng thành công");
            
        } catch (SQLException ex) {
            Logger.getLogger(SaveInvoiceServlet082.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("success", "Lưu đơn hàng thành công");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SaveInvoiceServlet082.class.getName()).log(Level.SEVERE, null, ex);
            session.setAttribute("success", "Lưu đơn hàng thành công");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/client/gdShoppingCart082.jsp");
        dispatcher.forward(request, response);
        
    }


}
