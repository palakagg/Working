<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.List"%>
    <%@page import="com.beans.Manages" %>
<%@page import="com.beans.Company" %>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Funds | Libra Application</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
</head>
<body>
HttpSession session2=request.getSession(false);
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" > <!--change logo-->
      <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center">
        <a class="navbar-brand brand-logo" href="index.jsp"><img src="images/Libra-text-logo-white.png" alt="logo"/></a>
        <!-- <a class="navbar-brand brand-logo-mini" href="index.jsp"><img src="images/logo-mini.svg" alt="logo"/></a> -->
      </div>
      <div class="navbar-menu-wrapper d-flex align-items-stretch">
        <!-- <div class="search-field d-none d-md-block">
          <form class="d-flex align-items-center h-100" action="index.jsp">
            <div class="input-group">
              <div class="input-group-prepend bg-transparent">
                  <i class="input-group-text border-0 mdi mdi-magnify"></i>                
              </div>
              <input type="text" class="form-control bg-transparent border-0" placeholder="Search">
            </div>
          </form>
        </div> -->
        <ul class="navbar-nav navbar-nav-right">

          <li class="nav-item d-none d-lg-block full-screen-link">
            <a class="nav-link">
              <i class="mdi mdi-fullscreen" id="fullscreen-button"></i>
            </a>
          </li>

          
          <li class="nav-item nav-logout d-none d-lg-block">
            <a class="nav-link" href="logout">
              <i class="mdi mdi-power"></i>
            </a>
          </li>

        </ul>
       <!-- <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
          <span class="mdi mdi-menu"></span>
        </button>-->
      </div>
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper" style="padding-top: 50px;">
      <!-- partial:partials/_sidebar.html -->
     <nav class="sidebar sidebar-offcanvas" id="sidebar">
     <div id="nav">
        <ul id="nav" class="nav">
        
          <li class="nav-item nav-profile">
            <a href="#" class="nav-link">
              <div class="nav-profile-image">
                <img src="images/Employee.png" alt="profile">
                <span class="login-status online"></span> <!--change to offline or busy as needed-->              
              </div>
              <div class="nav-profile-text d-flex flex-column">
                <span class="font-weight-bold mb-2">Mr. Chirag Tank</span>
                <!-- <span class="text-secondary text-small">Training Assistant</span> -->
              </div>
              <i class="mdi mdi-bookmark-check text-success nav-profile-badge"></i>
            </a>
          </li>
          <li class="nav-item"> 
            <a class="nav-link" href="check1">
              <span class="menu-title">Dashboard</span>
              <i class="mdi mdi-home menu-icon"></i>
            </a>
          </li>
<li class="nav-item">
	 <a class="nav-link" href="shortage">
              <span class="menu-title">Funds</span>
               <i class="mdi mdi-cash-usd menu-icon"></i> 
            </a>
		
	</li>
	 <li class="nav-item" style="background-color: #464646;"> 
            <a class="nav-link" href="shortage1">
              <span class="menu-title">Securities</span>
               <i class="mdi mdi-file-document menu-icon"></i>
            </a>
          </li>
	
	<li class="nav-item">
		<a class="nav-link" href="adminchart">
              <span class="menu-title">Charts</span>
              <i class="mdi mdi-chart-bar menu-icon"></i>
            </a>
	</li>
	<li class="nav-item">
		<a class="nav-link" href="about.jsp">
              <span class="menu-title">About Us</span>
             <i class="mdi mdi-account-multiple menu-icon"></i>
            </a>
	</li>
	 </ul>
       </div>
     <div id="nav1" class="nav1">
     </div>
          <!-- <li class="nav-item"> 
            <a class="nav-link" href="index.jsp">
               <div class="settleList" id="settleList"></div>
               
            </a>
          </li> -->
    </nav>
     <!-- partial -->
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="page-header">
            <h3 class="page-title">
              <span class="page-title-icon bg-gradient-primary text-white mr-2">
                <span class="mdi mdi-cash-usd"></span>                
              </span>
              FUNDS
            </h3>
 
          </div>
	<div class="row">
            <div class="col-lg-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body" >
                  
                 
                  <%
					List<Company> list1 = (List<Company>)request.getAttribute("table1");
               	
					%>
                  <table class="table table-dark">
                    <thead>
                      <tr>
                      <th>
                          S.NO
                        </th>
                        <th>
                          COMPANY NAME
                        </th>
                        <th>
                          AVAILABLE FUNDS
                        </th>
                        <th>
                          NETTED FUNDS
                        </th>
                        <th>
                          COST OF SETTLEMENT
                        </th>
                      </tr>
                    </thead>
                    <%
                    int i=0;
                    for(Company t : list1){
                    	i++;
                    %>
                    
                    <tbody>
                      <tr>
                        <td>
                     	<% out.println(i); %>
                        </td>
                        <td>
                          <% out.println(t.getCompanyName()); %>
                        </td>
                        <td>
                          <% out.println(t.getAvailableFunds()); %>
                        </td>
                        <td>
                          <% out.println(t.getNettedFunds()); %>
                        </td>
                        <td>
                          <% out.println(t.getCostOfSettlementForFunds()); %>
                        </td>
                      </tr>
                      <% } %>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
	
	<!-- <br><ul>
		<li>Funds</li><br>
		<li>Securities</li><br>
		<li>Cost of settlement</li><br>
		<li>Shortages</li><br>
		<li>Generate PDF</li>
	</ul> -->
	 <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
       
        <!-- partial -->
      </div>
      <!-- main-panel ends -->
    </div>
     <footer class="footer">
        <span class="container-fluid" style="padding: 10px;">
           <nav class="pull-left">
                    <ul style="list-style: none;">
                        <li>
                            <a href="#">
                                About us
                            </a>
                        </li>
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script> Powered by CITI, All rights reserved
                </p>
            </div>
    </footer>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->

  <!-- plugins:js -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
 <!--  --> <script src="js/scripts.js"></script>
  <script src="vendors/js/vendor.bundle.base.js"></script>
  <script src="vendors/js/vendor.bundle.addons.js"></script>
  <script src="data.js"></script>
  <!-- endinject -->
  <!-- Plugin js for this page-->
  <!-- End plugin js for this page-->
  <!-- inject:js -->
  <script src="js/off-canvas.js"></script>
  <script src="js/misc.js"></script>
  
  <!-- endinject -->
  <!-- Custom js for this page-->
  <script src="js/dashboard.js"></script>
  <!-- End custom js for this page-->
  <script type="text/javascript">

</body>
</html>