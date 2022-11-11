
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


public class DeleteDataServlet extends HttpServlet {

    
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login_page.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        String tableName=request.getParameter("tablenameR");
        String pkvalue=request.getParameter("pkvalue");
        String pkfield=request.getParameter("pkfield");
        
        UserDao dao=new UserDao(ConnectionProvider.getConnection());
       
       Boolean b = dao.deleteData(pkvalue,pkfield,tableName);
       if(b){
           HttpSession session=request.getSession();
            Message m=new Message("Data Deleted Succesfully","success","alert-success");
            session.setAttribute("msg", m);
            response.sendRedirect("home.jsp");
//       response.sendRedirect("inserted.jsp");
       }
       
       else{
           HttpSession session=request.getSession();
            Message m=new Message("Data pragya Failed!!","error","alert-danger");
            session.setAttribute("msg", m);
            response.sendRedirect("home.jsp");
//           response.sendRedirect("duplicate.jsp");
       }
       
       
//       HttpSession session=request.getSession(true);
//       User user=(User)session.getAttribute("currentUser");
//       String email=user.getEmail();
    }
    

}
