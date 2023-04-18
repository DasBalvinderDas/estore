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
  
  
    <nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark" style="background-color:#004085!important" >
     <img src="logo2.png" style="width: 15%;">
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span style="color:white"><c:out value="${sessionScope.storeName}" />
</span>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Logout <span class="sr-only">(current)</span></a>
          </li>
<!--           <li class="nav-item">
            <a class="nav-link" href="#">Features</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Pricing</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Dropdown link
            </a>
            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
              <a class="dropdown-item" href="#">Action</a>
              <a class="dropdown-item" href="#">Another action</a>
              <a class="dropdown-item" href="#">Something else here</a>
            </div>
          </li> -->
        </ul>
      </div>
    </nav>
  
    
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
                  MONTHLY'S SALES
                  </h5>

					<div id="piechart"></div>
					
					<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
					
					<script type="text/javascript">
					// Load google charts
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);
					
					var janSale = <c:out value="${sessionScope.saleInMonth.jan}" />
					var febSale = <c:out value="${sessionScope.saleInMonth.feb}" />
					var marSale = <c:out value="${sessionScope.saleInMonth.mar}" />
					var aprSale = <c:out value="${sessionScope.saleInMonth.apr}" />
					var maySale = <c:out value="${sessionScope.saleInMonth.may}" />
					
					// Draw the chart and set the chart values
					function drawChart() {
					  var data = google.visualization.arrayToDataTable([
					  ['Month', 'Sales'],
					  ['Jan Sale', janSale],
					  ['Feb Sale', febSale],
					  ['Mar Sale', marSale],
					  ['Apr Sale', aprSale],
					  ['May Sale', maySale]
					]);
					
					  // Optional; add a title and set the width and height of the chart
					  var options = {'title':'My Average Day', 'width':300, 'height':450};
					
					  // Display the chart inside the <div> element with id="piechart"
					  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
					  chart.draw(data, options);
					}
					</script>

                </div>
              </div>
            </div>
              
            <div class="col-md-4">
              <div class="card">

                <!-- <div class="card-header">
                </div> -->

                <div class="card-body">
                  <h5>
                  MONTHLY'S SALES
                  </h5>

                  
                  <div id="barchart"></div>
					
					<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
					
					<script type="text/javascript">
					// Load google charts
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);
					
					var janSale = <c:out value="${sessionScope.saleInMonth.jan}" />
					var febSale = <c:out value="${sessionScope.saleInMonth.feb}" />
					var marSale = <c:out value="${sessionScope.saleInMonth.mar}" />
					var aprSale = <c:out value="${sessionScope.saleInMonth.apr}" />
					var maySale = <c:out value="${sessionScope.saleInMonth.may}" />
					
					// Draw the chart and set the chart values
					function drawChart() {
					  var data = google.visualization.arrayToDataTable([
					  ['Month', 'Sales'],
					  ['Jan Sale', janSale],
					  ['Feb Sale', febSale],
					  ['Mar Sale', marSale],
					  ['Apr Sale', aprSale],
					  ['May Sale', maySale]
					]);
					
					  // Optional; add a title and set the width and height of the chart
					  var options = {'title':'My Average Day', 'width':300, 'height':450};
					
					  // Display the chart inside the <div> element with id="piechart"
					  var chart = new google.visualization.BarChart(document.getElementById('barchart'));
					  chart.draw(data, options);
					}
					</script>

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

                  <div id="barchart2"></div>
					
					<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
					
					<script type="text/javascript">
					// Load google charts
					google.charts.load('current', {'packages':['corechart']});
					google.charts.setOnLoadCallback(drawChart);
					
					var janSale = <c:out value="${sessionScope.saleInMonth.jan}" />
					var febSale = <c:out value="${sessionScope.saleInMonth.feb}" />
					var marSale = <c:out value="${sessionScope.saleInMonth.mar}" />
					var aprSale = <c:out value="${sessionScope.saleInMonth.apr}" />
					var maySale = <c:out value="${sessionScope.saleInMonth.may}" />
					
					// Draw the chart and set the chart values
					function drawChart() {
					  var data = google.visualization.arrayToDataTable([
					  ['Month', 'Sales'],
					  ['Jan Sale', janSale],
					  ['Feb Sale', febSale],
					  ['Mar Sale', marSale],
					  ['Apr Sale', aprSale],
					  ['May Sale', maySale]
					]);
					
					  // Optional; add a title and set the width and height of the chart
					  var options = {'title':'My Average Day', 'width':300, 'height':450};
					
					  // Display the chart inside the <div> element with id="piechart"
					  var chart = new google.visualization.BarChart(document.getElementById('barchart2'));
					  chart.draw(data, options);
					}
					</script>

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