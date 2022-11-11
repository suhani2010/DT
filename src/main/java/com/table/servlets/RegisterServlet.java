
package com.table.servlets;

import com.table.dao.UserDao;
import com.table.entities.User;
import com.table.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@MultipartConfig
public class RegisterServlet extends HttpServlet {

 public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("register_page.jsp");
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String check=request.getParameter("check");
        
            String name=request.getParameter("user_name");
            String email=request.getParameter("user_email");     
            String password=request.getParameter("user_password"); 
            String gender=request.getParameter("gender");
            
            
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            User user=new User(name,email,password,gender);
            if(dao.saveUser(user))out.println("REGISTERED");
            else out.println("NOT REGISTERED!!...PLEASE TRY AGAIN..");
        
    }
}
