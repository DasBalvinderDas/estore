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
              <h3> EDIT PRODUCT               
              </h3>
            </div>

            <div class="card-body">
              <form name="product_edit_form" method="POST" action="ProductController">
              <input type="hidden" class="form-control" id="product_id" name="product_id" value="<c:out value="${product.product_id}" />">
                <div class="form-group row">
                  <label for="product_name" class="col-sm-2 col-form-label">Name</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" id="product_name" name="product_name" value="<c:out value="${product.product_name}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_description" class="col-sm-2 col-form-label">Description</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" id="product_description" name="product_description" rows="3"><c:out value="${product.product_description}" /></textarea>
                  </div>
                </div>                
                <div class="form-group row">
                  <label for="product_ori_price" class="col-sm-2 col-form-label">Original Price</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="product_ori_price" name="product_ori_price" value="<c:out value="${product.product_ori_price}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_sell_price" class="col-sm-2 col-form-label">Selling Price</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="product_sell_price" name="product_sell_price" value="<c:out value="${product.product_sell_price}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_profit" class="col-sm-2 col-form-label">Profit</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="product_profit"  name="product_profit" value="<c:out value="${product.product_profit}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_quantity" class="col-sm-2 col-form-label">Quantity</label>
                  <div class="col-sm-10">
                    <input type="number" class="form-control" id="product_quantity" name="product_quantity" value="<c:out value="${product.product_quantity}" />">
                  </div>
                </div>
                <div class="form-group row">
                  <label for="product_supplier" class="col-sm-2 col-form-label">Supplier Name</label>
                  <div class="col-sm-10">
                    <select class="supplier_name" name="product_supplier" style="width: 100%">
                      <option value="AL">Alabama</option>
                        ...
                      <option value="WY">Wyoming</option>
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