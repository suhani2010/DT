
<%@page import="com.table.entities.Message"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
        
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark ">
  <a class="navbar-brand" href="home.jsp">
      
<i class="fa fa-th-large"></i>
<b style="font-size:25px">Dynamic Tables</b>
  </a>
    <!--<a  class="nav-link btn btn-dark" href="LogoutServlet" style="color: #fff; text-decoration: none"><span class="fa fa-user-circle"></span> Logout</a>-->
</nav>
        <main class="d-flex align-items-center banner-background p-5" style="background-color:whitesmoke">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header  text-center" style="background-color:black">
                                <span style="color:whitesmoke" class="fa fa-user-plus fa-3x"></span>
                                <br/>
                                <h3 style="color:whitesmoke">Login here</h3>
                            </div>
                           <%
                                Message m=(Message)session.getAttribute("msg");
                                if(m!=null)
                                {
                            %>
                            
                                    <div class="alert <%=m.getCssClass()%> " role="alert">
                                        <%=m.getContent()%>
                                    </div>
                            <%
                                session.removeAttribute("msg");
                                }
                            
                            
                            %>
                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group" style="position: relative;">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" name="password" required class="form-control" id="PasswordField" placeholder="Password">
                                        <i class="fa fa-eye-slash" id="eye" aria-hidden="true" style="position: absolute; right: 10px; margin-top: -27px;"></i>
                                    </div>
                                    <div class="container text-center">
                                        <p><span style="color: #888888">if not registered,</span> <a href="register_page.jsp">Click Here</a></h6>
                                    <button type="submit" class="btn btn-dark btn-lg mt-4">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
        
        
        
        
        
        

        <!--javascripts-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!--        <script src="js/myjs.js" type="text/javascript"></script>-->
        
        <script>
            $(document).ready(function(){
                $('#eye').click(function(){
                   if(document.getElementById("PasswordField").type=="password"){
                       document.getElementById("PasswordField").type="text";
                       this.classList.add("fa-eye");
                       this.classList.remove("fa-eye-slash");
                   }
                   else{
                       document.getElementById("PasswordField").type="password";
                       this.classList.remove("fa-eye");
                       this.classList.add("fa-eye-slash");
                   }
                });
            });
            
            
        </script>

    </body>
</html>
