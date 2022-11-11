


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
        <!--navbar start-->
      
<nav class="navbar navbar-dark bg-dark ">
  <a class="navbar-brand" href="home.jsp">
      
<i class="fa fa-th-large"></i>
<b style="font-size:25px">Dynamic Tables</b>
  </a>
    <a  class="nav-link btn btn-dark" href="LogoutServlet" style="color: #fff; text-decoration: none"><span class="fa fa-user-circle"></span> Logout</a>
</nav>
        <!--navbar end-->
       <main class="d-flex align-items-center banner-background p-5" >
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header  text-center" style="background-color:black">
                                <br/>
                                <h3 style="color: #ffffff">Give Details</h3>
                            </div>
                           
                            <div class="card-body">
        <%
            String tableName=request.getParameter("tablenameR");
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
        ArrayList<String> tfields=dao.getFields(tableName);
        ArrayList<String> tType=dao.getFieldTypes(tableName);
        if(tfields.size() == 0)
        {
           %>
           <h1>Table does not exists</h1>
        <%
        }
else{
        %>
        <form action="InsertDataServlet" id="recordform" method="post">
            <div class="row mt-2">
                      <div class="col-6 form-group">
                          <label>Table Name : </label>
                          <input type="text" name="tablenameR" class="form-control" value=<%=tableName%>>
                      </div>
         </div>
        <%
        for(int i=0;i<tfields.size();i++)
        {
         %>
         <div class="row mt-2">
                      <div class="col-6 form-group">
                          <label>Enter <%=tfields.get(i)%> : </label>
                          <%
                              if(tType.get(i).equalsIgnoreCase("varchar(51)")){
                          %>
                          <input type="email" name="<%=(i)%>" class="form-control" placeholder="Enter field name" required>
                          <%
                              }
                              if(tType.get(i).equalsIgnoreCase("varchar(255)")){
                          %>
                          <input type="text" name="<%=(i)%>" class="form-control" placeholder="Enter field name" required>
                          <%
                              }
                              if(tType.get(i).equalsIgnoreCase("tinyint(1)"))
                                      {
                          %>
                          <select class="form-control" name="<%=(i)%>">
                            <option value="1">true</option>
                            <option value="0">false</option>
                          </select>
                          <%
                              }
                              if(tType.get(i).equalsIgnoreCase("datetime")){
                          %>
                          <input type="date" name="<%=(i)%>" class="form-control" placeholder="Enter field name" required>
                          <%
                              }
                              if(tType.get(i).equalsIgnoreCase("int")){
                          %>
                          <input type="number" name="<%=(i)%>" class="form-control" placeholder="Enter field name" required>
                          <%
                              }
                          %>
                      </div>
         </div>
        <%
        }
        %>
        <div>
                        <button type="submit" class="btn btn-outline-dark mt-4">Insert</button>
        </div>
        </form>
        <%
            }
        %>
        </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>
