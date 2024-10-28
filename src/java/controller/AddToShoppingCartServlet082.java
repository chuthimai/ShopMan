/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Map;
import model.item.ImageItem082;
import model.item.Item082;
import model.ordering.OrderedItem082;
import model.ordering.ShoppingCart082;

/**
 *
 * @author maichu
 */
@WebServlet(name = "AddToShoppingCartServlet", urlPatterns = {"/addToShoppingCartServlet/*"})
public class AddToShoppingCartServlet082 extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String pathInfo = request.getPathInfo(); // Ví dụ: "/1"
        
        // Kiểm tra và xử lý tham số từ đường dẫn
        if (pathInfo != null) {
            String[] parts = pathInfo.split("/");
            String itemSTT = parts[1]; // lấy "1"
            
            String quanity = request.getParameter("quanity" + itemSTT);
            
            int index = Integer.parseInt(itemSTT);
            ArrayList<Item082> items = (ArrayList<Item082>) session.getAttribute("items");
            ArrayList<ImageItem082> images = (ArrayList<ImageItem082>) session.getAttribute("images");
            
            ShoppingCart082 shoppingCart = (ShoppingCart082) session.getAttribute("shoppingCart");
            
            // kiểm tra xem có trùng hàng với trước đó
            boolean isDiff = true;
            for (Map.Entry<OrderedItem082, ImageItem082> item : shoppingCart.getItems().entrySet()) {
                OrderedItem082 orderedItem = item.getKey();
                if (orderedItem.getNameItem().equals(items.get(index).getNameItem())) {
                    isDiff = false;
                    orderedItem.setOrderedQuantity(orderedItem.getOrderedQuantity() + Integer.parseInt(quanity));
                    shoppingCart.getItems().remove(item.getKey());
                    shoppingCart.addItem(orderedItem, images.get(index));
                    break;
                }
                
            }
            
            if (isDiff) {
                shoppingCart.addItem(
                    new OrderedItem082(items.get(index), Integer.parseInt(quanity)),
                    images.get(index)
                    );
            }
            session.setAttribute("shoppingCart", shoppingCart);
            session.setAttribute("success", "Thêm vào giỏ hàng thành công");
        } else {
            session.setAttribute("error", "Thêm vào giỏ hàng thất bại");
        }
        
        RequestDispatcher dispatcher = request.getRequestDispatcher("/views/client/gdOrdering082.jsp");
        dispatcher.forward(request, response);
    }

}
