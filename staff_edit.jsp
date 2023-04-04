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

    <title>Hello, world!</title>
  </head>

  <body style="background-color: #f2f3f8">
<jsp:include page="my-header.jsp"/>
    
    <div class="container-fluid">
      <div class="row">
<jsp:include page="my-sidebar.jsp"/>

        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 pt-3 px-4">

          <div class="card">
            <div class="card-header">
              <h3> EDIT STAFF               
              </h3>
            </div>
			
            <div class="card-body">
              <form name="staff_edit_form" method="POST" action="StaffController">
              <input type="hidden" class="form-control" id="staff_id" name="staff_id" value="<c:out value="${staff.staff_id}" />">
                <div class="form-group row">
                  <label for="staff_name" class="col-sm-2 col-form-label">Name</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="staff_name" name="staff_name" value="<c:out value="${staff.staff_name}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_birthdate" class="col-sm-2 col-form-label">Birth Date</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" id="staff_birth_date" name="staff_birth_date" value="<c:out value="${staff.staff_birth_date}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_address" class="col-sm-2 col-form-label">Address</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" id="staff_address" name="staff_address" rows="3" ><c:out value="${staff.staff_address}" /></textarea>
                  </div>
                </div>               
                <div class="form-group row">
                  <label for="staff_contact" class="col-sm-2 col-form-label">Contact Num</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="staff_contact" name="staff_contact_num" value="<c:out value="${staff.staff_contact_num}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_name" class="col-sm-2 col-form-label">Salary</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="staff_salary" name="staff_salary" value="<c:out value="${staff.staff_salary}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_position" class="col-sm-2 col-form-label">Position</label>
                  <div class="col-sm-10">
                      <select class="form-control" id="staff_position" name="staff_position">
                        <option>Choose...</option>
                        <option value="admin" <c:if test="${staff.staff_position eq 'admin'}">selected</c:if>>Admin</option>
                        <option value="cashier" <c:if test="${staff.staff_position eq 'cashier'}">selected</c:if>>Cashier</option>
                        <option value="supervisor" <c:if test="${staff.staff_position eq 'supervisor'}">selected</c:if>>Supervisor</option>
                      </select>
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_hiredate" class="col-sm-2 col-form-label">Hire Date</label>
                  <div class="col-sm-10">
                    <input type="date" class="form-control" id="staff_hire_date" name="staff_hire_date" value="<c:out value="${staff.staff_hire_date}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="staff_email" class="col-sm-2 col-form-label">Email </label>
                  <div class="col-sm-10">
                    <input type="email" class="form-control" id="staff_email" name="staff_email" value="<c:out value="${staff.staff_email}" />">
                  </div>
                </div>

                <div class="float-right">
                  <button type="submit" class="btn btn-success active" role="button" aria-pressed="true">SUBMIT
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