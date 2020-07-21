<%-- 
    Document   : signup
    Created on : Jul 21, 2020, 4:00:16 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
            
    </head>
    <body style="background: url(img/orsrc39592.jpg); background-size: cover; background-attachment: fixed;">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">
                            <h3 style="margin-top: 10px;" class="center-align"> Register here !!</h3>
                            <h5 id="msg" class="center-align"></h5>
                            <div class="form center-align">
                                <!--creating form-->
                                <form action="Register" method="post"id="myform">
                                    <input type="text" name="user_name" placeholder="Enetr your name" required>
                                    <input type="password" name="user_password" placeholder="Enetr your password" required>
                                    <input type="email" name="user_email" placeholder="Enetr your email" required>
                                    
                                    <button type="submit" class="btn red ">Submit</button>
                                    <button type="reset" class="btn red" id="but">Reset</button>
                                    
                                </form>
                                
                            </div>
                            <div class="loader center-align" style="margin-top: 10px; display: none;">
                                <div class="preloader-wrapper active">
                                    <div class="spinner-layer spinner-red-only">
                                        <div class="circle-clipper left">
                                            <div class="circle">
                                                
                                            </div>
                                        </div>
                                        <div class="gap-patch">
                                                    <div class="circle">
                                                        
                                                    </div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle">
                                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <h5> Please Wait </h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script
                 src="https://code.jquery.com/jquery-3.5.1.min.js"
                integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
                crossorigin="anonymous">
                    
        </script>
        <script>
            $(document).ready(function()
            {
                console.log("page ready.....")
                $("#myform").on('submit',function(event){
                    event.preventDefault();
                    var f = $(this).serialize();
                    console.log(f);
                    $(".loader").show();
                    $(".form").hide();
                    $.ajax({
                        url:"Register",
                        data:f,
                        type:'post',
                        success: function (data,textStatus,jqXHR){
                            console.log(data);
                            console.log("Success....");
                            $(".loader").hide();
                            $(".form").show();
                            if(data.trim() === 'Done')
                            {
                                $('#msg').html("Successfully Registered !!");
                                $('#msg').addClass('green-text');
                                
                            }
                            else
                            {
                                $('#msg').html("Something went wrong on server...");
                                $('#msg').addClass('red-text');
                            }
                            
                        },
                        error: function(jqXHR,textStatus,errorThrown){
                            console.log(data);
                            console.log("Error....");
                            $(".loader").hide();
                            $(".form").show();
                            $('#msg').html("Something went wrong on server...");
                            $('#msg').addClass('red -text');
                        }
                    });
                });
                $("#myform").on('reset',function(event){
                    $('#msg').hide();
                });
                            
            });
        </script>
    </body>
</html>
