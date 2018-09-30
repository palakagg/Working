<%@page import="com.beans.Transaction"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>SETTLED | Libra Application</title>
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
    <div class="container-fluid page-body-wrapper" style="padding-top: 50px">
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
          <li class="nav-item" style="background: #242424;"> 
            <a class="nav-link" href="check1">
              <span class="menu-title">Dashboard</span>
              <i class="mdi mdi-home menu-icon"></i>
            </a>
          </li>
         
          </li> -->
          <li class="nav-item">
	 <a class="nav-link" href="shortage">
              <span class="menu-title">Funds</span>
              <i class="mdi mdi-cash-usd menu-icon"></i>
            </a>
		
	</li>
	<li class="nav-item">
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
              <span class="menu-title">About us</span>
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
            
 
          </div>
         <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
              <h4 style="color: white;">SETTLED TRADES</h4>
                <div class="card-body" >
                  <h4 class="card-title">TRADE LIST</h4>
                  
                  <%
					List<Transaction> list1 = (List<Transaction>)request.getAttribute("transactions");
            
					%>
                  <table class="table table-dark">
                    <thead>
                      <tr>
                        
                        <th>
                          TRANSACTION ID
                        </th>
                        <th>
                          SECURITY ID
                        </th>
                        <th>
                          QUANTITY
                        </th>
                        <th>
                          PRICE
                        </th>
                         <th>
                          BUYER CLEARING MEMBER
                        </th>
                         <th>
                          SELLER CLEARING MEMBER
                        </th>
                        
                      </tr>
                    </thead>
                    <%
                    int i=0;
                    for(Transaction t : list1){
                    	i++;
                    %>
                    
                    <tbody>
                      <tr>
                       
                        <td id="tradeid_row<%=i %>">
                        <%out.println(t.getTransId()); %>
                        </td>
                        <td id="security_row<%=i%>">
                           <%String sec=t.getSecurityId();
                           String name=null;
                           if(sec.equals("S01")){
                            name="Apple";}
                           else if(sec.equals("S02")){
                            name="GE";}
                           else if(sec.equals("S03")){
                                name="Walmart";}
                           else if(sec.equals("S04")){
                                name="LinkedIn";}
                           else if(sec.equals("S05")){
                                name="Facebook";}
                          
                          out.println(name); %>
                        </td >
                        <td id="quantity_row<%=i%>">
                          <% out.println(t.getQuantity()); %>
                        </td>
                        <td id="price_row<%=i %>">
                          <% out.println(t.getPrice()); %>
                        </td>
                        <td id="buyer_row<%=i %>">
                          <% String sec1=t.getBuyerCompId();
                          String name1=null;
                          if(sec1.equals("C01")){
                           name1="Citi";}
                          else if(sec1.equals("C02")){
                           name1="GoldmanSachs";}
                          else if(sec1.equals("C03")){
                               name1="DeutscheBank";}
                          else if(sec1.equals("C04")){
                               name1="JPMorgan";}
                         
                         
                         out.println(name1);
                          
                          
                          %>
                        </td>
                        <td id="seller_row<%=i%>">
                          <% String sec2=t.getSellerCompId();
                          String name2=null;
                          if(sec2.equals("C01")){
                           name2="Citi";}
                          else if(sec2.equals("C02")){
                           name2="GoldmanSachs";}
                          else if(sec2.equals("C03")){
                               name2="DeutscheBank";}
                          else if(sec2.equals("C04")){
                               name2="JPMorgan";}
                         
                         
                         out.println(name2);
                          
                          
                          %>
                        </td>
                        
                        
					
                      </tr>
                    
                      <% } %>
                    
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
			
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
function edit_row(no)
{
	//alert(no);
	//var no = x.parentNode.parentNode.rowIndex;
 document.getElementById("edit_button"+no).style.display="none";
 var x =document.getElementById("save_button"+no).style.display="block";
 
 var trade=document.getElementById("tradeid_row"+no);
 //alert(trade);
 var security=document.getElementById("security_row"+no);
 var quantity=document.getElementById("quantity_row"+no);
 var price=document.getElementById("price_row"+no);
 var buyer=document.getElementById("buyer_row"+no);
 var seller=document.getElementById("seller_row"+no);

 var trade_data=trade.innerHTML;

 var security_data=security.innerHTML;
 var quantity_data=quantity.innerHTML;
 var price_data=price.innerHTML;
 var buyer_data=buyer.innerHTML;
 var seller_data=seller.innerHTML;
 
 trade.innerHTML="<input type='text' id='trade_text"+no+"' value='"+trade_data+"'>";
 security.innerHTML="<input type='text' id='security_text"+no+"' value='"+security_data+"'>";
 quantity.innerHTML="<input type='text' id='quantity_text"+no+"' value='"+quantity_data+"'>";
 price.innerHTML="<input type='text' id='price_text"+no+"' value='"+price_data+"'>";
 buyer.innerHTML="<input type='text' id='buyer_text"+no+"' value='"+buyer_data+"'>";
 seller.innerHTML="<input type='text' id='seller_text"+no+"' value='"+seller_data+"'>";
}
function save_row(no)
{
	var trade_val=document.getElementById("trade_text"+no).value;
	var trade_val=trade_val.trim();
	 var security_val=document.getElementById("security_text"+no).value;
	 var security_val=security_val.trim();
	 var quantity_val=document.getElementById("quantity_text"+no).value;
	 var quantity_val=quantity_val.trim();
	 var price_val=document.getElementById("price_text"+no).value;
	 var price_val=price_val.trim();
	 var buyer_val=document.getElementById("buyer_text"+no).value;
	 var buyer_val=buyer_val.trim();
	 
	 var seller_val=document.getElementById("seller_text"+no).value;
	 var seller_val=seller_val.trim();
	 var base="updatetransaction?transId=";
	 var url =base.concat(trade_val,"&security=",security_val,"&quantity=",quantity_val,"&price=",price_val,"&buyclearingmember=",buyer_val,"&sellclearingmember=",seller_val);
	 window.location.assign(url);
	
}
function add_row()
{

 var new_trade=document.getElementById("new_trade").value;
 var new_trade = new_trade.trim();
 
 var new_security=document.getElementById("new_security").value;
 var new_security = new_security.trim();
 var new_quantity=document.getElementById("new_quantity").value;
 var new_quantity = new_quantity.trim();
 var new_price=document.getElementById("new_price").value;
 var new_price = new_price.trim();
 var new_buyer=document.getElementById("new_buyer").value;
 var new_buyer = new_buyer.trim();
 var new_seller=document.getElementById("new_seller").value;
 var new_seller = new_seller.trim();
 alert(new_seller);	
 var base="addtransaction?transId=";
 var url =base.concat(new_trade,"&new_security=",new_security,"&new_quantity=",new_quantity,"&new_price=",new_price,"&new_buyer=",new_buyer,"&new_seller=",new_seller);
window.location.assign(url);
 // var table=document.getElementById("table_format");
// var table_len=(table.rows.length)-1;
// var row = table.insertRow(table_len).outerHTML="<tr id='row"+table_len+"'><td id='trade_row"+table_len+"'>"+new_trade+"</td><td id='security_row"+table_len+"'>"+new_security+"</td><td id='quantity_row"+table_len+"'>"+new_quantity+"</td><td id='price_row"+table_len+"'>"+new_price+"</td><td id='buyer_row"+table_len+"'>"+new_buyer+"</td><td id='seller"+table_len+"'>"+new_seller+"</td><td><input type='button' id='edit_button"+table_len+"' value='Edit' class='edit' onclick='edit_row("+table_len+")'> <input type='button' id='save_button"+table_len+"' value='Save' class='save' onclick='save_row("+table_len+")'> <input type='button' value='Delete' class='delete' onclick='delete_row("+table_len+")'></td></tr>";

}
</script>
  

</body>
</html>