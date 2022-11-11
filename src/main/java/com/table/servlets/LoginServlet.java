/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.table.servlets;

import com.table.dao.UserDao;
import com.table.entities.Message;
import com.table.entities.User;
import com.table.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login_page.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
       String userEmail=request.getParameter("email");
       String userPassword=request.getParameter("password");
       // System.out.println(userPassword);
       UserDao dao=new UserDao(ConnectionProvider.getConnection());
       User userDetails=dao.getUserByEmailAndPassword(userEmail, userPassword);
       if(userDetails==null){
           //login error
           //out.println("Invalid details...please try again");
           Message msg=new Message("Invalid details...please try again","error","alert-danger");
           HttpSession session=request.getSession();
           session.setAttribute("msg",msg);
           response.sendRedirect("login_page.jsp");
       }
       else{
           //login success
           HttpSession session=request.getSession();
           session.setAttribute("currentUser", userDetails);          
              response.sendRedirect("home.jsp");
            
       }
    }  
}
