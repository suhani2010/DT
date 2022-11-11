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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author HP
 */
public class InsertDataServlet extends HttpServlet {
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login_page.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       String tableName=request.getParameter("tablenameR");
        System.out.println(tableName);
       ArrayList<String> tdata=new ArrayList<String>();
       int i=0;
       while(true)
       {
           String temp1 =request.getParameter(""+i);
           System.out.println(temp1);
           if(temp1 == null)break;
           tdata.add(temp1);
           i++;
       }
       
       
       UserDao dao=new UserDao(ConnectionProvider.getConnection());
       
       Boolean b = dao.insertData(tdata,tableName);
       if(b){
           HttpSession session=request.getSession();
            Message m=new Message("Data Inserted Succesfully","success","alert-success");
            session.setAttribute("msg", m);
            response.sendRedirect("home.jsp");
//       response.sendRedirect("inserted.jsp");
       }
       
       else{
           HttpSession session=request.getSession();
            Message m=new Message("Data insertion Failed!! (Primary key should be unique)","error","alert-danger");
            session.setAttribute("msg", m);
            response.sendRedirect("home.jsp");
//           response.sendRedirect("duplicate.jsp");
       }
       
       
//       HttpSession session=request.getSession(true);
//       User user=(User)session.getAttribute("currentUser");
//       String email=user.getEmail();
       
       
   
}
}
