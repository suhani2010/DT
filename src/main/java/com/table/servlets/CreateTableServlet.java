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
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class CreateTableServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login_page.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
       String tableName=request.getParameter("tablename");
//       String numberFields=request.getParameter("numberFields");
//        System.out.println(numberFields);
       //int n=Integer.parseInt(numberFields); 
       ArrayList<String> tableColumns=new ArrayList<>();
       int i=1;
       String pk=request.getParameter("fieldname1");
       while(true){
           String temp1 =request.getParameter("fieldname"+i);
           String temp2 =request.getParameter("fieldtype"+i);
           if(temp1 == null)break;
           tableColumns.add(temp1+ " " + temp2);
           System.out.println(temp1+ " " + temp2);
           i++;
       }
        System.out.println("tablename : "+tableName);
       tableColumns.add( "PRIMARY KEY ( "+pk+" ))");
       
       UserDao dao=new UserDao(ConnectionProvider.getConnection());
       HttpSession session=request.getSession(true);
       User user=(User)session.getAttribute("currentUser");
       String email=user.getEmail();
       Boolean b = dao.createNewTable(tableName, tableColumns,email);
       if(b){
           response.sendRedirect("successfull.jsp");
       }
       else{
           response.sendRedirect("failure.jsp");
       }
       
    }  

}
