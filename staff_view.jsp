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
              <h3> VIEW STAFF               
              </h3>
            </div>

            <div class="card-body">
              <table class="table table-bordered">
                <tbody>
                  <tr>
                    <th scope="row" style="width:25%;">NAME</th>
                    <td><c:out value="${staff.staff_name}" /></td>
                  </tr>
                  <tr>
                    <th scope="row">BIRTH DATE</th>
                    <td><c:out value="${staff.staff_birth_date}" /></td>
                  </tr>
                  <tr>
                    <th scope="row">ADDRESS</th>
                    <td colspan="2"><c:out value="${staff.staff_address}" /></td>
                  </tr>
                  <tr>
                    <th scope="row">CONTACT NUMBER</th>
                    <td colspan="2"><c:out value="${staff.staff_contact_num}" /></td>
                  </tr>
                  <tr>
                    <th scope="row">SALARY</th>
                    <td colspan="2"><c:out value="${staff.staff_salary}" /></td>
                  </tr>
                  <tr>
                    <th scope="row">POSITION</th>
                    <td colspan="2"><c:out value="${staff.staff_position}" /></td>
                  </tr>
                  <tr>
                    <th scope="row">HIRE DATE</th>
                    <td colspan="2"><c:out value="${staff.staff_hire_date}" /></td>
                  </tr>
                  <tr>
                    <th scope="row">EMAIL</th>
                    <td colspan="2"><c:out value="${staff.staff_email}" /></td>
                  </tr>
                  <tr>
                    <th scope="row">PASSWORD</th>
                    <td colspan="2"><c:out value="${staff.staff_password.toString()}" /></td>
                  </tr>
                </tbody>
              </table>
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