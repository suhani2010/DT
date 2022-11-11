 <%-- 
    Document   : viewTables
    Created on : 3 Mar, 2022, 9:49:19 AM
    Author     : HP
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.table.helper.ConnectionProvider"%>
<%@page import="com.table.dao.UserDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

        
    </head>
    <body>
        <div class="text-center mt-5">
        <h1>Table Details</h1>
        </div>
        
        <%
            String tableName=request.getParameter("tablenameR");
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
            ArrayList<String> tfields=dao.getFields(tableName);
            try{
           Statement st=ConnectionProvider.getConnection().createStatement();
            String query=request.getParameter("query");
            System.out.println("tablename = "+tableName);
            System.out.println("query = "+query);
            ResultSet rs=st.executeQuery(query);
            
        %>
        <div class="container">
            <div class="text-center mt-5"><a  class="btn btn-success" href="filter.jsp?tablenameR=<%=tableName%>" style="color: #fff; text-decoration: none"><span class="fa fa-filter mr-2"></span>Filters</a></div>
            
            <table class="table table-bordered m-5" style="border: 1px ">
                <thead class="thead-light">
                    <tr>
                    <%
                        for(int i=0;i<tfields.size();i++){
                    %>
                    
                        <th><%=tfields.get(i)%></th>
                    
                    <%
                        }%>
                    </tr>
                </thead>                    
                <%
                   
            while(rs.next())
            {
               
                %><tr><%
                for(int i=1;i<=tfields.size();i++){
                     System.out.println("for i = "+i+" , "+rs.getString(i));
                %>
                <td><%=rs.getString(i)%></td>
               <%
                   }
                %></tr><%
            }%>
                    
            </table>
        </div>
            <div class="text-center">
                <a class="btn btn-dark " href="home.jsp">Go to Home Page</a>
            </div>
        <%
            }
           catch(Exception e)
           {
               e.printStackTrace();
           }
        %>
    </body>
</html>
