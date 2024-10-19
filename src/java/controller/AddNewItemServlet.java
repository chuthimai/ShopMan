/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.ImageItem082DAO;
import dao.Item082DAO;
import dao.OtherItemInfo082DAO;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.item.ImageItem082;
import model.item.Item082;
import model.item.OtherItemInfo082;
import model.item.Type082;

/**
 *
 * @author maichu
 */
@WebServlet(name = "AddNewItemServlet", urlPatterns = {"/doAddNewItem"})
@MultipartConfig
public class AddNewItemServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        return;
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String nameItem = (String) request.getParameter("nameItem");
            String idType = (String) request.getParameter("type");
            String brand = (String) request.getParameter("brand");
            String expiry = (String) request.getParameter("expiry");
            float exportedPrice =  Float.parseFloat(request.getParameter("exportedPrice"));
            String unit = (String) request.getParameter("unit");
            
            Item082DAO item082DAO = new Item082DAO();
            ImageItem082DAO imageItem082DAO = new ImageItem082DAO();
            OtherItemInfo082DAO otherItemInfo082DAO = new OtherItemInfo082DAO();
            
            Item082 item = new Item082();
            item.setNameItem(nameItem)
                    .setBrand(brand)
                    .setExpiry(expiry)
                    .setExportedPrice(exportedPrice)
                    .setUnit(unit)
                    .setType((new Type082()).setId(idType));
            String idItem = item082DAO.addItem(item);
            System.out.println("idItem: " + idItem);
            
            boolean isAddInfo = true;
            int infoIndex = 1;
            while (idItem != null) {
                String nameInfo = request.getParameter("nameInfo" + Integer.toString(infoIndex));
                String describeInfo = request.getParameter("describeInfo" + Integer.toString(infoIndex));
                System.out.println("nameInfo: " + nameInfo);
                if (nameInfo != null && !nameInfo.isEmpty()) {
                    OtherItemInfo082 otherInfo = new OtherItemInfo082();
                    otherInfo.setIdItem(idItem).setNameInfo(nameInfo).setDetailInfo(describeInfo);
                    otherItemInfo082DAO.addOtherItemInfo082(otherInfo);
                } else {
                    break;
                }
                infoIndex++;
            }
            
            System.out.println("Add info success");
            
            boolean isAddImage = true;
            int imageIndex = 1;
            String uploadPath = "/Users/maichu/NetBeansProjects/ShopMan/web/images/items/" + idItem;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            
            while (idItem != null) {
                try {
                    // Xử lý hình ảnh
                    Part filePart = request.getPart("image" + Integer.toString(imageIndex)); // Lấy tệp hình ảnh
                    String filePath = uploadPath + "/image" + Integer.toString(imageIndex) + ".png"; // Đường dẫn đầy đủ để lưu tệp
                    
                    // Ghi tệp hình ảnh vào server
                    try (InputStream fileContent = filePart.getInputStream();
                         FileOutputStream fos = new FileOutputStream(new File(filePath))) {
                        byte[] buffer = new byte[1024];
                        int bytesRead;
                        while ((bytesRead = fileContent.read(buffer)) != -1) {
                            fos.write(buffer, 0, bytesRead);
                        }
                    }
                    

                    ImageItem082 image = new ImageItem082();
                    image.setIdItem(idItem)
                            .setLink("http://localhost:8080/ShopMan/images/items/"+ 
                                    idItem + "/image"+ Integer.toString(imageIndex) +".png");
                    imageItem082DAO.addImageItem082(image);
                } catch (Exception e) {
                    System.out.println(e.toString());
                    break;
                }
                imageIndex++;
            }
            
            System.out.println("Add img success");
            
            if (idItem != null && isAddImage && isAddInfo) {
                HttpSession session = request.getSession();
                session.setAttribute("success", "Thêm mặt hàng mới thành công");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("error", "Thêm mặt hàng mới thất bại");
            }
            
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/manager/gdItemManagement082.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(AddNewItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AddNewItemServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
