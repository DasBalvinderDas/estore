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

    <!-- Sweetalert -->
    <link href="sweetalert2/sweetalert2.min.css" rel="stylesheet" />
    <!-- Sweetalert -->

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
              <h3>SUPPLIER               
                <a href="supplier_add.jsp" class="btn btn-primary float-right">
                <span data-feather="plus-circle">
                </span>
                ADD SUPPLIER</a>
              </h3>
            </div>

            <div class="card-body">
              <div class="table-responsive">
                <br>
                <table class="table table-striped table-sm">
                  <thead>
                    <tr>
                      <th>#</th>
                      <th>Supplier Name</th>
                      <th>Address</th>
                      <th>Contact Number</th>
                      <th>Description</th>
                      <th style="width: 15%;">Action</th>
                    </tr>
                  </thead>
                  <tbody>
                  
                   <c:forEach items="${suppliers}" var="supplier">
                    <tr class="tablerow">
                      <td></td>
                      <td><c:out value="${supplier.supplier_name}" /></td>
                      <td><c:out value="${supplier.supplier_address}" /></td>
                      <td><c:out value="${supplier.supplier_contact_num}" /></td>
                      <td><c:out value="${supplier.supplier_description}" /></td>
                      <td>
<%--                    <a href="SupplierController?action=SupplierView&supplierid=<c:out value="${supplier.supplier_id}" />" class="btn btn-info btn-sm">
                          <span data-feather="eye"></span>
                        </a> --%>
                        <a href="SupplierController?action=SupplierEdit&supplierid=<c:out value="${supplier.supplier_id}" />" class="btn btn-warning btn-sm">
                          <span data-feather="edit"></span>
                        </a>
                        <button data-supplier-id="<c:out value="${supplier.supplier_id}" />" class="btn btn-danger btn-sm deletesupplier">
                          <span data-feather="trash"></span>
                        </button>
                      </td>
                    </tr>
                    </c:forEach>

                  </tbody>
                </table>
              </div>
            </div>

          </div>

        </main>

      </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

    <!--select2 -->
    <script src="select2/js/select2.min.js"></script>

<!--     <script>
        $(document).ready(function() {
        $('.addproduct').select2(
          {
            width: '80%'
          });
    });
    </script> -->
    <!-- end Select2 -->

    <!--sweetalert -->
    <script src="sweetalert2/sweetalert2.min.js"></script>
    <!--sweetalert -->

<script>
  $('.deletesupplier').click(function(event){
      var supplierId = $(this).data('supplier-id');
  swal({
  title: 'Are you sure?',
  text: "You won't be able to revert this!",
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#3085d6',
  cancelButtonColor: '#d33',
  confirmButtonText: 'Yes, delete it!'
  }).then((result) => {
	  if (result.value) {
		    swal(
		      'Deleted!',
		      'Your file has been deleted.',
		      'success'
		    ).then(function() { 
		        $.ajax({
		            type: "GET",
		            url: "SupplierController?action=SupplierDelete&supplierid="+ supplierId,
		            success: function (response) {
		                window.location.href = 'SupplierController?action=SupplierList';
		                console.log("success");
		            }
		        });
		      })
		  }
		})
});
</script>

	<script>
    $('.tablerow').each(function (i) {
    	   $("td:first", this).html(i + 1);
    	});
    </script>

  </body>
</html>