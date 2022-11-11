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
        
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background-color: #F1F1F1">
          <!--navbar start-->
      
<nav class="navbar navbar-dark bg-dark ">
  <a class="navbar-brand" href="home.jsp">
      
<i class="fa fa-th-large"></i>
<b style="font-size:25px">Dynamic Tables</b>
  </a>
    <a  class="nav-link btn btn-dark" href="LogoutServlet" style="color: #fff; text-decoration: none"><span class="fa fa-user-circle"></span> Logout</a>
</nav>
        <!--navbar end-->
        <div class="text-center">
        <h1>Data Inserted Successfully</h1>
        <a href="home.jsp" class="btn btn-dark"  style="color: #fff; text-decoration: none">Back to Home Page</a>
        </div>
    </body>
</html>
