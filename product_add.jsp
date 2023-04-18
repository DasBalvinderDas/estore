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
	
    <!-- Select2 -->
    <link href="select2/css/select2.min.css" rel="stylesheet" />
    <!-- end Select2 -->
    
    <style>
    	input.error,
		select.error,
		textarea.error {
		    border: 2px solid red !important;
		}
		label.error {
			color: red !important;
			font-style: italic !important;;
		}
    </style>

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

          <div class="card">
            <div class="card-header">
              <h3> ADD PRODUCT               
              </h3>
            </div>

            <div class="card-body">
              <form name="product_add_form" method="POST" id="validateform" action="ProductController">
                <div class="form-group row">
                  <label for="product_name" class="col-sm-2 col-form-label">Name</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="product_name" name="product_name">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_description" class="col-sm-2 col-form-label">Description</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" id="product_description" name="product_description" rows="3"></textarea>
                  </div>
                </div>                
                <div class="form-group row">
                  <label for="product_ori_price" class="col-sm-2 col-form-label">Original Price</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control ori-price" id="currency"  name="product_ori_price">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_sell_price" class="col-sm-2 col-form-label">Selling Price</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control sell-price" id="currency" name="product_sell_price">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_profit" class="col-sm-2 col-form-label">Profit</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control profit" id="product_profit" name="product_profit" readonly>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_quantity" class="col-sm-2 col-form-label">Quantity</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="product_quantity" name="product_quantity">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_supplier" class="col-sm-2 col-form-label">Supplier Name</label>
                  <div class="col-sm-10">
                    <select class="product_supplier" name="product_supplier" style="width: 100%">
                    <c:forEach items="${suppliers}" var="supplier">
                      <option value="<c:out value="${supplier.supplier_name}" />"><c:out value="${supplier.supplier_name}" /></option>
                      </c:forEach>
                    </select>
                  </div>
                </div>

                <div class="float-right">
                  <button type ="submit"  class="btn btn-success active" role="button" aria-pressed="true">SUBMIT
                  </button> 
                  <a href="products.html" class="btn btn-secondary active" role="button" aria-pressed="true">CANCEL
                  </a>
                </div>          

              </form>
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
	
    <!--jquery -->
    <script src="jquery-validate/jquery.js"></script>
    <script src="jquery-validate/jquery.validate.js"></script>
	<!--jquery -->
	
    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!--select2 -->
    <script src="select2/js/select2.min.js"></script>
    
    <script>
        $(document).ready(function() {
        $('.product_supplier').select2(
          {
            width: 'resolve'
          });
    });
    </script>
    <!-- end Select2 -->

	<script>
	 $("#validateform").validate({
		   rules: {
		     // no quoting necessary
		     product_name: "required",
		     product_description: "required",
		     product_ori_price: "required",
		     product_sell_price: "required",
		     product_name: "required",
		     product_profit: "required",
		     product_quantity: "required",
		     product_supplier: "required"
		   }
		 });
	</script>
	
	<script>
	$(".currency").on("keyup", function(){
	    var valid = /^\d{0,4}(\.\d{0,2})?$/.test(this.value),
	        val = this.value;
	    
	    if(!valid){
	        console.log("Invalid input!");
	        this.value = val.substring(0, val.length - 1);
	    }
	});
	</script>
	
	<script>
	$(document).on("change", "#currency", function() {
	    var sum = 0;
	    $("#currency").each(function(){
	    var a= $(".ori-price").val();
	    var b= $(".sell-price").val();
	    sum = b-a;
	    });
	    $(".profit").val(sum);
	});
	
	</script>

  </body>
</html>