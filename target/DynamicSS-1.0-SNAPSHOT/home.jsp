

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.table.helper.ConnectionProvider"%>
<%@page import="com.table.dao.UserDao"%>
<%@page import="com.table.entities.Message"%>
<%@page import="com.table.entities.User"%>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null)
{
    Message m=new Message("You are not logged in!!","error","alert-danger");
        session.setAttribute("msg", m);
    response.sendRedirect("login_page.jsp");
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
          <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

        
        <style>
            .btn-outline-info{
                color: #000;
            }
             .btn-outline-info:hover {
    background-color: #4494AD;
    color: #fff;
}
        </style>
    <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="background: #F2F4F2" >
        
        <!--navbar start-->
      
<nav class="navbar navbar-dark bg-dark ">
  <a class="navbar-brand" href="home.jsp">
      
<i class="fa fa-th-large ml-5 pl-1"></i>
<b style="font-size:25px">Dynamic Tables</b>
  </a>
    <a  class="nav-link btn btn-dark" href="LogoutServlet" style="color: #fff; text-decoration: none"><span class="fa fa-user-circle"></span> Logout</a>
</nav>
        <!--navbar end-->
        
        <div>
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
        </div>
        
        
        
            <div class="container-fluid">
                <div class="row">
                  <div class="col">
                      <div class="m-5 pt-5" style="font-family: montserrat">
                      <h1 style="font-size:55px"><span style="color:#367588">Dynamic Tables.</span> Mysql's UI to Create and manage your customized tables with ease.</h1>
                         <h4 class="pt-4 pb-4" style="color:#808080">Harness the power of your data by building and managing your data in Mysql UI tool.</h4>
                     
                         
                    <button class="btn btn-outline-info btn-lg mr-2" data-toggle="modal" data-target="#table-modal" >Create table</button>
                    <button class="btn btn-outline-info btn-lg mr-2" data-toggle="modal" data-target="#record-modal"  >Insert Data</button>
                    <button class="btn btn-outline-info btn-lg" data-toggle="modal" data-target="#mytables-modal"  >My Tables</button>
                      </div>
                  </div>
                  <div class="col">
                      <div class="text-center mt-3">
                      <img src="images/dbimage2.jpg" alt="alt" height="8%" width="88%"/>
                      </div>
                  </div>
                </div>
            </div>
            
            
        
      
 

<!-- Modal -->
<div class="modal fade" id="table-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
    <div class="modal-header"><h3 class="mt-2 text-center"id="exampleModalLabel" >Give Table Details</h3>
    <!--<h5 class="modal-title" id="exampleModalLabel">SKS</h5>-->
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body">
      <h6 style="color : #FF0800">**first field will be the primary key</h6>
          <div id="table-details">
              
              
              <form action="CreateTableServlet" id="tableDetails-form" method="post">
                  
<!--                   <div class="row" id="row0">
                      <div class="col-6">
                          <label>Enter Table Name</label>
                          <input type="text" name="tablename" class="form-control" placeholder="Enter table name">
                      </div>
                   </div>-->
                       

                  
              </form>
              <button class="btn btn-dark mt-2" id="btnadd" onclick="add_more_field()">Add fields +</button>
            </div>

  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
  </div>
</div>
</div>
</div>
    <%--end of table modal--%>

    <!--Record Modal -->
<div class="modal fade" id="record-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
<div class="modal-dialog" role="document">
<div class="modal-content">
    <div class="modal-header"><h3 class="mt-2 text-center"id="exampleModalLabel" >Give Table Details</h3>
    <!--<h5 class="modal-title" id="exampleModalLabel">SKS</h5>-->
    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
  </div>
  <div class="modal-body">
      
          <div id="table-details">
              
              
              <form action="fields.jsp" id="record-form" method="post">
                  
                   <div class="row" id="row0">
                      <div class="col-6">
                            <label>Select Table Name</label>
                          <select name="tablenameR" size="1" id="Points">
                          <%
                              String email=user.getEmail();
                              Connection con=ConnectionProvider.getConnection();
                              try{
                                Statement st=con.createStatement();
                                String email1=user.getEmail();
                                String query="Select tablename from userInfo where email = '"+email+"'";
                                ResultSet rs=st.executeQuery(query);
                              while(rs.next())
                              {
                          %>
                          
                            <option value=<%=rs.getString(1)%> selected><%=rs.getString(1)%></option>
                         
                          <%
                              }
                          }        
                        catch(Exception e)
                        {
                            e.printStackTrace();
                        }

                     %>
                      </select>
                          <!--<input type="text" name="tablenameR" class="form-control" placeholder="Enter table name" autocomplete="off">-->
                      </div>
                   </div>
                       
                  <div>
                        <button type="submit" class="btn btn-outline-dark mt-4">Next</button>
                  </div>
                  
              </form>
             
            </div>

  </div>
  <div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
  </div>
</div>
</div>
</div>
    <%--end of record modal--%>
    
    <!--My Tables Model-->
    <div class="modal fade text-center" id="mytables-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg"  role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">My Tables</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body text-center">
        <%
            con=ConnectionProvider.getConnection();
           try{
            Statement st=con.createStatement();
           String email1=user.getEmail();
           String query="SELECT tablename FROM userInfo where email="+"'"+email+"'";
            ResultSet rs=st.executeQuery(query);
            System.out.println(query);
            int flag=0;
            %>
            <div class="container text-center pr-5">
            <table class="table table-bordered ml-3" style="border: 1px ">
                <thead class="thead-light">
                    <tr>
                        <th scope="col">Table Names</th>
                    </tr>
                </thead>    
          <%
              
            while(rs.next())
            {
                
                %><tr>
                <td><a href="viewTables.jsp?tablenameR=<%=rs.getString(1)%>" class="list-group-item list-group-item-action title " ><%out.print(rs.getString(1)+"\t");%></a></td>
                </tr><%
                  flag=1;  
                
            }
                if(flag == 0){%>
                <h2>You have not created any table</h2>
                <%}%>
            
            </table></div><%
           }        
           catch(Exception e)
           {
               e.printStackTrace();
           }
        
        %>
      </div>
    </div>
    </div>
    </div>
    <!--end of My Tables Model-->

<!--javascripts-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="js/myjs.js" type="text/javascript"></script>

 
        <!--javascripts-->
 <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>       
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>




<!--<script>
 $(document).ready(function(){
$('#tableDetails-form').on('submit',function(event){
    event.preventDefault();
    let form=new FormData(this);
    
    //sending data to register servlet through ajax
    $.ajax({
        url:"CreateTableServlet",
        type:'post',
        data:form,
        success: function (data, textStatus, jqXHR) {
            if(data.trim()=="REGISTERED"){
                swal({
                     title: "Table Created Succesfully!",
                     text: "",
                     icon: "success",
                    
                 }).then((value) => {
                     window.location="home.jsp"
                 });
            }
            else{
                swal("Something went wrong try again with some other tablename!!");
            }
       // console.log(data);
        },
        
        error: function (jqXHR,textStatus,errorThrown){
            swal("Something went wrong try again!!");
        },
        processData: false,
        contentType:false
        
    });
});





});
        </script>-->
    </body>
</html>
