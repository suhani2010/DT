
<%@page import="java.util.ArrayList"%>
<%@page import="com.table.dao.UserDao"%>
<%@page import="com.table.helper.ConnectionProvider"%>
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
        <nav class="navbar navbar-dark bg-dark ">
  <a class="navbar-brand" href="home.jsp">
      
<i class="fa fa-th-large"></i>
<b style="font-size:25px">Dynamic Tables</b>
  </a>
            <div class="container">
            <a  class="nav-link btn btn-dark" href="home.jsp" style="color: #fff; text-decoration: none;float:right">Home</a>
            </div>
    <a  class="nav-link btn btn-dark" href="LogoutServlet" style="color: #fff; text-decoration: none"><span class="fa fa-user-circle"></span> Logout</a>
</nav>
<!--        <div class="mt-5 mr-2">
        
        </div>-->
            <main class="d-flex align-items-center banner-background p-5" >
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
                        <div class="card">
                            <div class="card-header  text-center" style="background-color:black">
                                <br/>
                                <h3 style="color: #ffffff">Filter</h3>
                            </div>
                            <div class="card-body">
        <%
            String tableName=request.getParameter("tablenameR");
            System.out.println(tableName);
            UserDao dao=new UserDao(ConnectionProvider.getConnection());
        ArrayList<String> tfields=dao.getFields(tableName);
        ArrayList<String> tType=dao.getFieldTypes(tableName);
        
        %>
        <form action="ShowFilterServlet" id="filterform" method="post">
            
        <%
        for(int i=0;i<tfields.size();i++)
        {
         %>
         <div class="row mt-2">
                      <div class="col-6 form-group">
                          
                          <%
                              if(tType.get(i).equalsIgnoreCase("varchar(51)")){
                          %>
                          <label><%=tfields.get(i)%> : </label>
                          <div class="form-group">
                                    <select id="" name="<%=tfields.get(i)%>" class="form-control"
                                        placeholder="Choose Type">
                                        <option selected value="">Choose Type</option>
                                        <option value="iseq">is eq</option>
                                        <option value="noteq">not eq</option>
                                        <option value="startswith">starts with</option>
                                        <option value="endwith">end with</option>
                                        <option value="contain">contain</option>
                                        <option value="notcontain">does not contain</option>
                                        <option value="null">null</option>
                                        <option value="notnull">not null</option>
                                    </select>
                          </div>
                          <div class="form-group">
                                    <input type="text" class="form-control" name="<%=tfields.get(i)%>op"
                                        id="" placeholder="<%=tfields.get(i)%>">
                          </div>
                          <%
                              }
                              if(tType.get(i).equalsIgnoreCase("varchar(255)")){
                          %>
                          <label><%=tfields.get(i)%> : </label>
                                <div class="form-group">
                                    <select id="" name="<%=tfields.get(i)%>" class="form-control"
                                        placeholder="Choose Type">
                                        <option selected value="">Choose Type</option>
                                        <option value="iseq">is eq</option>
                                        <option value="noteq">not eq</option>
                                        <option value="startswith">starts with</option>
                                        <option value="endwith">end with</option>
                                        <option value="contain">contain</option>
                                        <option value="notcontain">does not contain</option>
                                        <option value="null">null</option>
                                        <option value="notnull">not null</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" name="<%=tfields.get(i)%>op"
                                        id="" placeholder="<%=tfields.get(i)%>">
                                </div>
                          <%
                              }
                              if(tType.get(i).equalsIgnoreCase("tinyint(1)"))
                                      {
                          %>
                          <label><%=tfields.get(i)%> : </label>
                          <div class="form-group">
                                <select id="" name="<%=tfields.get(i)%>" class="form-control" placeholder="Choose Type">
                                    <option value="" selected>Choose Type</option>
                                    <option value="true">True</option>
                                    <option value="false">False</option>
                                </select>
                           </div>
                          
                          <%
                              }
                              if(tType.get(i).equalsIgnoreCase("int")){
                          %>
                          <label><%=tfields.get(i)%> : </label>
                          <div class="form-group">
                               <select id=""name="<%=tfields.get(i)%>" class="form-control"
                                   placeholder="Choose Type">
                                   <option selected value="">Choose Type</option>
                                   <option value="greater">greater then</option>
                                   <option value="lesser">less then</option>
                                   <option value="iseq">is eq</option>
                                   <option value="notequal">not eq</option>
                                   <option value="null">null</option>
                                   <option value="notnull">not null</option>
                               </select>
                            </div>
                                <div class="form-group">
                                    <input type="number" class="form-control" name="<%=tfields.get(i)%>op"
                                        id="" placeholder="<%=tfields.get(i)%>">
                                </div>
                          <%
                              }
                          %>
                      </div>
         </div>
        <%
        }
        %>
        <input type="text" name="tablenameR" value="<%=tableName%>" hidden/ >
        <div>
                        <button type="submit" class="btn btn-outline-dark mt-4">Filter</button>
        </div>
        </form>
        </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </body>
</html>



  



