<%@page import="dao.Login082DAO"%>
<%@page import="model.user.User082"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String email = (String) request.getParameter("email");
    String password = (String) request.getParameter("password");
    
    Login082DAO login082DAO = new Login082DAO();
    User082 user = login082DAO.login(email, password);
    
if (user != null) {
        session.setAttribute("user", user);
        if (user.getId().startsWith("M")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/manager/gdMainManagement082.jsp");
                dispatcher.forward(request, response);
            }
        
        if (user.getId().startsWith("C")) {
                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/client/gdMainClient082.jsp");
                dispatcher.forward(request, response);
            }
    }
    else {
    session.setAttribute("error", "Email or password is not correct.");
    RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
                dispatcher.forward(request, response);
    }
%>