
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
        <!--css-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

        <main class=" d-flex align-items-center banner-background p-5" style="background-color:whitesmoke">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card">
                            <div class="card-header  text-center text-white" style="background-color:black">
                                <span style="color:whitesmoke" class="fa fa-user-circle fa-3x"></span>
                                <br/>
                                <h3 style="color:whitesmoke">Register here</h3>
                            </div>
                            <div class="card-body">
                                <form action="RegisterServlet" method="post" id="reg-form">
                                    <div class="form-group">
                                        <label for="user_name">UserName<span style="color:#FF0800; font-size: 20px">*</span></label>
                                        <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter username">
                                        <div id="error-username"></div>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address<span style="color:#FF0800; font-size: 20px">*</span></label>
                                        <input name="user_email" type="email" class="form-control" id="user_emai1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                        <div id="error-email"></div>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password<span style="color:#FF0800; font-size: 20px">*</span></label>
                                        <input name="user_password" type="password" class="form-control" id="user_password" placeholder="Password">
                                        <i class="fa fa-eye-slash" id="eye" aria-hidden="true" style="position: absolute; right: 25px; margin-top: -27px;"></i>
                                        <div id="error-password"></div>
                                    </div>
                                    
                                    
                                    <div class="form-group">
                                        <label for="gender">Select Gender<span style="color:#FF0800;font-size: 20px">*</span></label>
                                        <br/>
                                        <input type="radio" class="user_gender" name="gender" value="Male">Male
                                        <input type="radio" class="user_gender"name="gender" value="Female">Female
                                          <div id="error-gender"></div>
                                    </div>
                                  
                                    <div class="form-check">
                                        <input name="check" type="checkbox" class="form-check-input" id="user_check">
                                        <label class="form-check-label" for="exampleCheck1">agree terms and conditions<span style="color:#FF0800; font-size: 20px">*</span></label>
                                        <div id="error-check"></div>
                                    </div>
                                    
                                    <br/><div class="text-center">
                                        <p><span style="color: #888888">If you have already registered before ,</span> <a href="login_page.jsp">Login Here</a></p>
                                        <button id="form-submit" type="submit" class="btn btn-dark btn-lg ">Submit</button></div>
                              
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
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function(){
$('#error-username').hide();
$('#error-email').hide();
$('#error-password').hide();
$('#error-gender').hide();
$('#error-check').hide();
var username_err=true;
var email_err=true;
var password_err=true;
var gender_err=true;
var check_err=true;

$('#user_name').keyup(function(){
    username_check();
});

function username_check(){
    var username=$("#user_name").val();
    //username validation
    if(username.trim()==""){
        $("#error-username").show();
        $("#error-username").html("**The username must be filled");
        $("#error-username").focus();
        $("#error-username").css('color','red');
        username_err=false;
        return false;
    }
    else{
        $("#error-username").hide();
        username_err=true;
    }
    if(username.length<=2 || username.length>25)
    {
        $("#error-username").show();
        $("#error-username").html("**The username must be between 3 and 25 letters");
        $("#error-username").focus();
        $("#error-username").css('color','red');
        username_err=false;
        return false;
    }
    else 
    {
        $("#error-username").hide();
        username_err=true;
    }
}


$("#user_emai1").keyup(function(){
    email_check();
});

function email_check(){
    var email=$("#user_emai1").val();
    var email_regx=/^([a-z0-9\.-]+)@([a-z0-9-]+)\.([a-z]{2,8})$/;
    if(email.trim()==""){
        $("#error-email").show();
        $("#error-email").html("**The email must be filled");
        $("#error-email").focus();
        $("#error-email").css('color','red');
        email_err=false;
        return false;
    }
    else{
        $("#error-email").hide();
        email_err=true;
    }
    if(email_regx.test(email)==false)
    {
        $("#error-email").show();
        $("#error-email").html("**The email format is invalid");
        $("#error-email").focus();
        $("#error-email").css('color','red');
        email_err=false;
        return false;
    }
    else{
        $("#error-email").hide();
        email_err=true;
    }
}

$('#user_password').keyup(function(){
    password_check();
});

function password_check(){
    var password=$("#user_password").val();
    var pass_regx=/^(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,20}$/;
    
    if(password.trim()==""){
        $("#error-password").show();
        $("#error-password").html("**The password may not be empty");
        $("#error-password").focus();
        $("#error-password").css('color','red');
        password_err=false;
        return false;
     }
    else{
        $("#error-password").hide();
        password_err=true;
    }
    if(password.length<=5){
        $("#error-password").show();
        $("#error-password").html("**password too short");
        $("#error-password").focus();
        $("#error-password").css('color','red');
        password_err=false;
        return false;
    }
    else{
        $("#error-password").hide();
        password_err=true;
    }
    if(pass_regx.test(password)==false)
    {
        $("#error-password").show();
        $("#error-password").html("password too weak");
        $("#error-password").focus();
        $("#error-password").css('color','red');
        password_err=false;
        return false;
    }
    else{
        $("#error-password").hide();
        password_err=true;
    }
}

$('.user_gender').click(function(){
    gender_check();
});
function gender_check(){
    //gender validation
    var value=$('input:radio[name=gender]:checked').val();
    
    if(value==null){
        $("#error-gender").show();
        $("#error-gender").html("**please select gender");
        $("#error-gender").css('color','red');
        gender_err=false;
        return false;
}
else {
    $("#error-gender").hide();
    gender_err=true;
}
}
$('#user_check').click(function(){
    checkbox_check();
});
function checkbox_check(){
    
    var check=$("input[type='checkbox']").prop('checked');
    if(check==false){
        $("#error-check").show();
        $("#error-check").html("**please agree terms and conditions");
        $("#error-check").css('color','red');
        check_err=false;
        return false;
}
    else{
        $('#error-check').hide();
        check_err=true;
    
    }
}

$("#form-submit").click(function(){
    username_err=true;
    email_err=true;
    password_err=true;
    gender_err=true;
    check_err=true;
    
    username_check();
    email_check();
    password_check();
    gender_check();
    checkbox_check();
    if(username_err==true && password_err==true && email_err==true && gender_err==true && check_err==true)
    {
        return true;
    }
    else return false;
});

$('#reg-form').on('submit',function(event){
    event.preventDefault();
    let form=new FormData(this);
    
    //sending data to register servlet through ajax
    $.ajax({
        url:"RegisterServlet",
        type:'post',
        data:form,
        success: function (data, textStatus, jqXHR) {
            if(data.trim()=="REGISTERED"){
                swal({
                     title: "Registered Succesfully!",
                     text: "We are redirecting you to login page",
                     icon: "success",
                    
                 }).then((value) => {
                     window.location="login_page.jsp"
                 });
            }
            else{
                swal("Something went wrong try again!!");
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
        </script>
        <script>
            $(document).ready(function(){
                $('#eye').click(function(){
                   if(document.getElementById("user_password").type=="password"){
                       document.getElementById("user_password").type="text";
                       this.classList.add("fa-eye");
                       this.classList.remove("fa-eye-slash");
                   }
                   else{
                       document.getElementById("user_password").type="password";
                       this.classList.remove("fa-eye");
                       this.classList.add("fa-eye-slash");
                   }
                });
            });
            
            
        </script>
    </body>
</html>

