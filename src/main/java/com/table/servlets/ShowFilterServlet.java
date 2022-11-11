/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.table.servlets;

import com.table.dao.UserDao;
import com.table.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author HP
 */
public class ShowFilterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login_page.jsp");
    }

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       PrintWriter out = response.getWriter();
       String tableName=request.getParameter("tablenameR");
       UserDao dao=new UserDao(ConnectionProvider.getConnection());
        ArrayList<String> tfields=dao.getFields(tableName);
        ArrayList<String> tType=dao.getFieldTypes(tableName);
        String query="select * from "+tableName+" where ";
        int f=0;
        for(int i=0;i<tfields.size();i++)
        {
            String s=request.getParameter(tfields.get(i));
            String r=request.getParameter(tfields.get(i)+"op");
            if(s!=null)
            {
                if(s.equalsIgnoreCase("null"))
                    {
                        if(f==1)
                        query=query+ " AND "+tfields.get(i)+ " IS NULL";
                        else if(f==0)
                        {
                            query=query+tfields.get(i)+ " IS NULL";
                            f=1;
                        }
                        
                    }
                    
                    else if(s.equalsIgnoreCase("notnull"))
                    {
                        if(f==1)
                        query=query+ " AND "+tfields.get(i)+ " IS NOT NULL";
                        else if(f==0)
                        {
                            query=query+tfields.get(i)+ " IS NOT NULL";
                            f=1;
                        }
                        
                    }
                    else if(s.equalsIgnoreCase("true"))
                    {
                        if(f==1)
                        query=query+ " AND "+tfields.get(i)+ " = '1'";
                        else if(f==0)
                        {
                            query=query+tfields.get(i)+ " = '1'";
                            f=1;
                        }
                        
                    }
                    else if(s.equalsIgnoreCase("false"))
                    {
                        if(f==1)
                        query=query+ " AND "+tfields.get(i)+ " = '0";
                        else if(f==0)
                        {
                            query=query+tfields.get(i)+ " = '0'";
                            f=1;
                        }
                        
                    }
                    else if(r!=null)
                    {
                        if(s.equalsIgnoreCase("iseq"))
                        {
                            if(f==1)
                                query=query+ " AND "+tfields.get(i)+ " = '"+r+"'";
                                else if(f==0)
                                {
                                    query=query+tfields.get(i)+ " = '"+r+"'";
                                    f=1;
                                }

                        }
                        else if(s.equalsIgnoreCase("noteq"))
                        {
                            if(f==1)
                                query=query+ " AND "+tfields.get(i)+ " != '"+r+"'";
                                else if(f==0)
                                {
                                    query=query+tfields.get(i)+ " != '"+r+"'";
                                    f=1;
                                }

                        }
                        else if(s.equalsIgnoreCase("greater"))
                        {
                            if(f==1)
                                query=query+ " AND "+tfields.get(i)+ " > "+r;
                                else if(f==0)
                                {
                                    query=query+tfields.get(i)+ " > "+r;
                                    f=1;
                                }

                        }
                        else if(s.equalsIgnoreCase("lesser"))
                        {
                            if(f==1)
                                query=query+ " AND "+tfields.get(i)+ " < "+r;
                                else if(f==0)
                                {
                                    query=query+tfields.get(i)+ " < "+r;
                                    f=1;
                                }

                        }
                        else if(s.equalsIgnoreCase("startswith"))
                        {
                            if(f==1)
                                query=query+ " AND "+tfields.get(i)+ " LIKE '"+r+"%'";
                                else if(f==0)
                                {
                                    query=query+tfields.get(i)+ " LIKE '"+r+"%'";
                                    f=1;
                                }

                        }
                        else if(s.equalsIgnoreCase("endswith"))
                        {
                            if(f==1)
                                query=query+ " AND "+tfields.get(i)+ " LIKE '%"+r+"'";
                                else if(f==0)
                                {
                                    query=query+tfields.get(i)+ " LIKE '%"+r+"'";
                                    f=1;
                                }

                        }
                        else if(s.equalsIgnoreCase("contain"))
                        {
                            if(f==1)
                                query=query+ " AND "+tfields.get(i)+ " LIKE '%"+r+"%'";
                                else if(f==0)
                                {
                                    query=query+tfields.get(i)+ " LIKE '%"+r+"%'";
                                    f=1;
                                }

                        }
                        else if(s.equalsIgnoreCase("notconatin"))
                        {
                            if(f==1)
                                query=query+ " AND "+tfields.get(i)+ " NOT LIKE '%"+r+"%'";
                                else if(f==0)
                                {
                                    query=query+tfields.get(i)+ " NOT LIKE '%"+r+"%'";
                                    f=1;
                                }
                        }
            }
                    
           }
         }
        System.out.println(query);
        
        out.println("<html>");
        out.println("<head>");
        out.println("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css\" integrity=\"sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm\" crossorigin=\"anonymous\">");
        
        out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">");
        out.println("<link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css\">");

        
        out.println("</head>");

        out.println("<body>");
        out.println("<div class=\"text-center mt-5\">");
        out.println("<h1>Table Details</h1>");
        out.println("</div>");
            try{
           Statement st=ConnectionProvider.getConnection().createStatement();
           
            System.out.println("tablename = "+tableName);
            System.out.println("query = "+query);
            ResultSet rs=st.executeQuery(query);
            
        
        out.println("<div class=\"container\">");
            
            
            out.println("<table class=\"table table-bordered m-5\" style=\"border: 1px \">");
               out.println(" <thead class=\"thead-light\">");
                   out.println(" <tr>");
                    
                        for(int i=0;i<tfields.size();i++){
                    
                    
                        out.println("<th>"+tfields.get(i)+"</th>");
                    
                    
                        }
                    out.println("</tr>");
                out.println("</thead>");                
                
            while(rs.next())
            {
               
                out.println("<tr>");
                for(int i=1;i<=tfields.size();i++){
                     System.out.println("for i = "+i+" , "+rs.getString(i));
                
                out.println("<td>"+rs.getString(i)+"</td>");
               
                   }
                out.println("</tr>");
            }
                    
            out.println("</table>");
        out.println("</div>");
            out.println("<div class=\"text-center\">");
               out.println(" <a class=\"btn btn-dark \" href=\"home.jsp\">Go to Home Page</a>");
           out.println(" </div>");
        
            }
           catch(Exception e)
           {
               e.printStackTrace();
           }
        
   out.println(" </body>");
out.println("</html>");

        }
}

