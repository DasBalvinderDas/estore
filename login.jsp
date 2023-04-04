<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="dist/css/signin.css" rel="stylesheet">
    <!-- Sweetalert -->
    <link href="sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <!-- Sweetalert -->
  </head>

  <body class="text-center" style="background-image: url(bg.jpg)">

  <div class="card" style="width: 20rem;">
    <div class="card-body">
      <form class="form-signin" method="GET" action="LoginController">
        <img class="mb-4" src="logo.png" style="width: 75%;">
        <%-- <h5 class="h5 mb-3 font-weight-normal">Please sign in</h5> --%>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="staff_email" id="staff_email" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="staff_password" id="staff_password" class="form-control" placeholder="Password" required>
        <div class="checkbox mb-3">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" id="target" type="submit">Sign in</button>
        <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
      </form>
    </div>
  </div>

  </body>
  	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
    <!--sweetalert -->
    <script src="sweetalert2/sweetalert2.min.js"></script>
    <!--sweetalert -->

    <script>
    $( document ).ready(function() {
    	var Msg ='<%=request.getAttribute("errorMessage")%>';;

    	if (Msg != "null") {
		    	  swal({
		    		  type: 'error',
		    		  title: 'Oops...',
		    		  text: 'You have wrong username or password!',
	    		})
    	}
    });
    </script>
  
</html>
