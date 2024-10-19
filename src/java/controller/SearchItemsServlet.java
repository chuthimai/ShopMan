/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ImageItem082DAO;
import dao.Item082DAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.item.ImageItem082;
import model.item.Item082;

/**
 *
 * @author maichu
 */
@WebServlet(name = "SearchItemsServlet", urlPatterns = {"/searchItems"})
public class SearchItemsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try {
            String searchQuery = request.getParameter("search");
            HttpSession session = request.getSession();
            session.setAttribute("searchQuery", searchQuery);
            
            Item082DAO item082DAO = new Item082DAO();
            ImageItem082DAO imageItem082DAO = new ImageItem082DAO();
            ArrayList<Item082> items = item082DAO.findItems(searchQuery);
            
            ArrayList<ImageItem082> images = new ArrayList<>();
            for (Item082 item: items) {
                ImageItem082 image = imageItem082DAO.getAnImage(item.getId());
                images.add(image);
            }
            request.setAttribute("items", items);
            request.setAttribute("images", images);
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/client/gdOrdering082.jsp");
            dispatcher.forward(request, response);
        } catch (Exception ex) {
            System.out.println("SearchItemsServlet ---> " + ex.toString());
        }
    }
    
}
