<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("currentSessionUser")==null)
      response.sendRedirect("/jsp-projek/login.jsp");

%>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="dist/css/dashboard.css" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>

  <body style="background-color: #f2f3f8">
<jsp:include page="my-header.jsp"/>
    
    <div class="container-fluid">
      <div class="row">
<jsp:include page="my-sidebar.jsp"/>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

          <div class="card mb-3">
            <div class="card-body">
              <h5>
              Welcome,
              </h5>
            </div>
          </div> 

          <div class="row justify-content-center">
            
            <div class="col-md-4">
              <div class="card">

                <!-- <div class="card-header">
                </div> -->

                <div class="card-body">
                  <h5>
                  TODAY'S STATS
                  </h5>

                  Today earnings and items sales <br><br>
                  Earning: $400 USD<br>
                  Items Sold: 20 Items<br>
                  Last Hour Sales: $34 USD<br>

                </div>
              </div>
            </div>
              
            <div class="col-md-4">
              <div class="card">

                <!-- <div class="card-header">
                </div> -->

                <div class="card-body">
                  <h5>
                  MONTHLY'S STATS
                  </h5>

                  Monthly earnings and items sales<br><br>
                  Earning: $400 USD<br>
                  Items Sold: 20 Items<br>
                  Last Hour Sales: $34 USD<br>

                </div>
              </div>
            </div>

            <div class="col-md-4">
              <div class="card">

                <!-- <div class="card-header">
                </div> -->

                <div class="card-body">
                  <h5>
                  YEARLY'S STATS
                  </h5>

                  All earnings and items sales<br><br>
                  Earning: $400 USD<br>
                  Items Sold: 20 Items<br>
                  Last Hour Sales: $34 USD<br>

                </div>
              </div>
            </div>

          </div>

        </main>

      </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

  </body>
</html>