<%@ page language="java" 
    contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"
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
              <h3> ADD STAFF               
              </h3>
            </div>

            <div class="card-body">
              <form name="staff_add_form" method="POST" id="validateform" action="StaffController">
                <div class="form-group row">
                  <label for="staff_name" class="col-sm-2 col-form-label">Name</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="staff_name" name="staff_name">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_birth_date" class="col-sm-2 col-form-label">Birth Date</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" id="staff_birth_date" name="staff_birth_date">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_address" class="col-sm-2 col-form-label">Address</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" id="staff_address" name="staff_address" rows="3"></textarea>
                  </div>
                </div>               
                <div class="form-group row">
                  <label for="staff_contact_num" class="col-sm-2 col-form-label">Contact Num</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="staff_contact_num" name="staff_contact_num">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_name" class="col-sm-2 col-form-label">Salary</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="staff_salary" name="staff_salary">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_position" class="col-sm-2 col-form-label">Position</label>
                  <div class="col-sm-10">
                      <select class="form-control" id="staff_position" name="staff_position">
                        <option></option>
                        <option value="admin">Admin</option>
                        <option value="cashier">Cashier</option>
                        <option value="supervisor">Supervisor</option>
                      </select>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_hire_date" class="col-sm-2 col-form-label">Hire Date</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" id="staff_hire_date" name="staff_hire_date">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_email" class="col-sm-2 col-form-label">Email </label>
                  <div class="col-sm-10">
                    <input type="email" class="form-control" id="staff_email" name="staff_email">
                  </div>
                </div>
                 <div class="form-group row">
                  <label for="staff_password" class="col-sm-2 col-form-label">Password </label>
                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="staff_password" name="staff_password">
                  </div>
                </div> 

                <div class="float-right">
                  <button class="btn btn-success active" role="button" type="submit" aria-pressed="true">SUBMIT
                  </button> 
                  <a href="staff.html" class="btn btn-secondary active" role="button" aria-pressed="true">CANCEL
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

    <!-- Icons -->
    <script src="https://unpkg.com/feather-icons/dist/feather.min.js"></script>
    <script>
      feather.replace()
    </script>

	<!--jquery -->
    <script src="jquery-validate/jquery.js"></script>
    <script src="jquery-validate/jquery.validate.js"></script>
	<!--jquery -->
	
	<script>
	 $("#validateform").validate({
		   rules: {
		     // no quoting necessary
		     staff_name: "required",
		     staff_birth_date: "required",
		     staff_address: "required",
		     staff_contact_num: "required",
		     staff_salary: "required",
		     staff_position: "required",
		     staff_hire_date: "required",
		     staff_email: "required",
		     staff_password: "required",
		   }
		 });
	</script>
	
    <!--select2 -->
    <script src="select2/js/select2.min.js"></script>

    <script>
        $(document).ready(function() {
        $('.supplier_name').select2(
          {
            width: 'resolve'
          });
    });
    </script>
    <!-- end Select2 -->

  </body>
</html>