<%@page import="com.beans.Transaction"%>
<%@page import="com.beans.Security"%>
<%@page import="com.operations.*"%>
<%@page import="com.operations.impl.*"%>
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
  <title>Admin | Libra Application</title>
  <!-- plugins:css -->
  <link rel="stylesheet" href="vendors/iconfonts/mdi/css/materialdesignicons.min.css">
  <link rel="stylesheet" href="vendors/css/vendor.bundle.base.css">
  <!-- endinject -->
  <!-- inject:css -->
  <link rel="stylesheet" href="css/style.css">
  <!-- endinject -->
  
</head>
<body>
<%
	HttpSession session2=request.getSession(false);
	
%>
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
    <div class="container-fluid page-body-wrapper">
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
          <li class="nav-item" style="background: #242424"> 
            <a class="nav-link" href="check1">
              <span class="menu-title">Dashboard</span>
              <i class="mdi mdi-home menu-icon"></i>
            </a>
          </li>
           <li class="nav-item"> 
            <a class="nav-link" href="history">
              <span class="menu-title">History</span>
              <i class="mdi mdi-history menu-icon"></i>
            </a>
          </li>
          <!-- <li class="nav-item">
            <a class="nav-link" data-toggle="collapse" href="#ui-basic" aria-expanded="false" aria-controls="ui-basic">
              <span class="menu-title">Clearing Members</span>
              <i class="menu-arrow"></i>
              <i class="mdi mdi-account-multiple"></i>
            </a>
            <div class="collapse" id="ui-basic">
              <ul class="nav flex-column sub-menu">
                <li class="nav-item"> <a class="nav-link" href="ClearingMember.jsp">Citibank</a></li>
                <li class="nav-item"> <a class="nav-link" href="ClearingMember.jsp">JP Morgan</a></li>
                <li class="nav-item"> <a class="nav-link" href="ClearingMember.jsp">Goldman Sachs</a></li>
                <li class="nav-item"> <a class="nav-link" href="ClearingMember.jsp">Deutsche Bank</a></li>
              </ul>
            </div>
          </li> -->
          <li class="nav-item">
            <a class="nav-link" href="settlenow">
              <button type="button" class="settle" id="settle" >SETTLE NOW!</button>
              <!-- <i class="mdi mdi-book-multiple menu-icon"></i> -->
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
                <i class="mdi mdi-home"></i>                 
              </span>
              Dashboard
            </h3>
 
          </div>
         <div class="row">
            <div class="col-lg-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body" >
                  <h5>End of Day Trade List</h5>
                  <%
					List<Transaction> list1 = (List<Transaction>)request.getAttribute("transactions");
            
					%>
                  <table id="table_format" class="table table-bordered">
                    <thead>
                      <tr>
                        
                        <th class="tableHead">
                          TRANSACTION ID
                        </th>
                        <th class="tableHead">
                          SECURITY NAME
                        </th>
                        <th class="tableHead">
                          QUANTITY<a class="edit" href="filterquan"><i class="mdi mdi-sort-ascending"></i></i></a>
                          
                        </th>
                        <th class="tableHead">
                          PRICE <a class="edit" href="filterprice"><i class="mdi mdi-sort-ascending"></i></i></a>
                        </th>
                         <th class="tableHead">
                          BUYER CLEARING MEMBER
                        </th>
                         <th class="tableHead">
                          SELLER CLEARING MEMBER
                        </th>
                         <th class="tableHead">
                          ACTIONS
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
                       
                        <td class="tableData" id="tradeid_row<%=i %>">
                        <%out.println(t.getTransId()); %>
                        </td>
                        <td class="tableData" id="security_row<%=i%>">
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
                        <td class="tableData" id="quantity_row<%=i%>">
                          <% out.println(t.getQuantity()); %>
                        </td>
                        <td class="tableData" id="price_row<%=i %>">
                          <% out.println(t.getPrice()); %>
                        </td>
                        <td class="tableData" id="buyer_row<%=i %>">
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
                        <td class="tableData" id="seller_row<%=i%>">
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
                        
                        <td class="buttons">
                        	<button id="edit_button<%=i %>" value="Edit" class="edit" onclick="edit_row('<%=i%>')"><i class="mdi mdi-pencil"></i></button>
                   			<button id="save_button<%=i %>" class="save" onclick="save_row('<%=i%>')"><i class="mdi mdi-content-save"></i></button>
                        	<a class="delete" href="deletetransaction?transId=<c:out value='<%=t.getTransId() %>'/>"><i class="mdi mdi-delete"></i></a>
                      </td></tr>
                    
                      <% } %>
                    <tr>
 <td class="input"><!--  <input class="addNew" type="text" id="new_trade">--></td> 
<td class="input"><select class="addNew" id="new_security">
		<option value="Facebook">Facebook</option>
		<option value="Apple">Apple</option>
    	<option value="GE">GE</option>
    	<option value="Walmart">Walmart</option>
    	<option value="LinkedIn">LinkedIn</option>
    	</select></td>
<td class="input"><input class="addNew" type="number" id="new_quantity" value="Integer only" min="1000" ></td>
<td class="input"><input class="addNew" type="number" id="new_price" value="Decimal only"></td>
<td class="input"><select class="addNew" id="new_buyer">
		<option value="Citi">Citi</option>
    	<option value="JPMorgan">JPMorgan</option>
    	<option value="DeutscheBank">DeutscheBank</option>
    	<option value="GoldmanSach">GoldmanSachs</option></select></td>
<td class="input"><select class="addNew" id="new_seller">
		
		<option value="Citi">Citi</option>
    	<option value="JPMorgan">JPMorgan</option>
    	<option value="DeutscheBank">DeutscheBank</option>
    	<option value="GoldmanSach">GoldmanSachs</option></select></td>
<td class="buttons"><button class="add" onclick="add_row();" value="Add Row"><i class="mdi mdi-plus-circle"></i></button></td>
</tr>
                    </tbody>
                  </table>
             <br>
             <br>
             
             
             <div class="clicks">
             
             <button id="button1" value="Random" class="random" onclick="pop()">Generate Random Data</button>
  
               <button id="button2" value="Default" class="default" onclick="defo()">Get Default Data</button>
            
           
            
            </div>
           
            
           
                      
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
var trade=document.getElementById("tradeid_row"+no);
	
	//var no = x.parentNode.parentNode.rowIndex;
 document.getElementById("edit_button"+no).style.display="none";
 var x =document.getElementById("save_button"+no).style.display="block";
 
 
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
 
 
 security.innerHTML="<select class='addNew' id='ew_security' style='width: auto;'><option value='Facebook'>Facebook</option><option value='Apple'>Apple</option><option value='GE'>GE</option><option value='Walmart'>Walmart</option><option value='LinkedIn'>LinkedIn</option></select>"
 quantity.innerHTML="<input type='number' id='quantity_text"+no+"' min='1000' value='"+quantity_data+"' style='width: 100%;'>";
 price.innerHTML="<input type='number' id='price_text"+no+"' value='"+price_data+"' style='width: 100%;'>";
 buyer.innerHTML="<select class='addNew' id='new_buyer'><option value='Citi'>Citi</option><option value='JPMorgan'>JPMorgan</option><option value='DeutscheBank'>DeutscheBank</option><option value='GoldmanSach'>GoldmanSachs</option></select>";
 buyer.innerHTML="<select class='addNew' id='new_buyer'><option value='Citi'>Citi</option><option value='JPMorgan'>JPMorgan</option><option value='DeutscheBank'>DeutscheBank</option><option value='GoldmanSach'>GoldmanSachs</option></select>";
}
function save_row(no)
{
	var trade=document.getElementById("tradeid_row"+no);
	 var trade_val=trade.innerHTML;
	var trade_val=trade_val.trim();
	
	 var security_val=document.getElementById("security_text"+no).value;
	 var security_val=security_val.trim();
	 
	 if(security_val=="Apple")
		 security_val="S01";
	 else if(security_val=="GE")
		 security_val="S02";
	 else if(security_val=="Walmart")
		 security_val="S03";
	 else if(security_val=="LinkedIn")
		 security_val="S04";
	 else if(security_val=="Facebook")
		 security_val="S05";
	 var quantity_val=document.getElementById("quantity_text"+no).value;
	 var quantity_val=quantity_val.trim();
	 var price_val=document.getElementById("price_text"+no).value;
	 var price_val=price_val.trim();
	 var buyer_val=document.getElementById("buyer_text"+no).value;
	 var buyer_val=buyer_val.trim();
	 if( buyer_val=="Citi")
		 buyer_val="C01";
	 else if( buyer_val=="GoldmanSachs")
		 buyer_val="C02";
	 else if( buyer_val=="DeutscheBank")
		 buyer_val="C03";
	 else if( buyer_val=="JPMorgan")
		 buyer_val="C04";
	 var seller_val=document.getElementById("seller_text"+no).value;
	 var seller_val=seller_val.trim();
	 if(seller_val=="Citi")
		 seller_val="C01";
	 else if(seller_val=="GoldmanSachs")
		 seller_val="C02";
	 else if(seller_val=="DeutscheBank")
		 seller_val="C03";
	 else if(seller_val=="JPMorgan")
		 seller_val="C04";
	 var base="updatetransaction?transId=";
	 var url =base.concat(trade_val,"&security=",security_val,"&quantity=",quantity_val,"&price=",price_val,"&buyclearingmember=",buyer_val,"&sellclearingmember=",seller_val);
	 window.location.assign(url);
	
}
function add_row()
{
// var new_trade=document.getElementById("new_trade").value;
 //var new_trade = new_trade.trim();
 
var new_security=document.getElementById("new_security").value;
 
 var new_security = new_security.trim();
 if(new_security=="Apple")
	 new_security="S01";
 else if(new_security=="GE")
	 new_security="S02";
 else if(new_security=="Walmart")
	 new_security="S03";
 else if(new_security=="LinkedIn")
	 new_security="S04";
 else if(new_security=="Facebook")
	 new_security="S05";
 
 var new_quantity=document.getElementById("new_quantity").value;
 var new_quantity = new_quantity.trim();
/* var quantity = parseInt(new_quantity, 10)
 alert(typeof quantity);
 if(typeof quantity=='string'){
	 alert("enter integer value for quantity");
	 var base="check1?none=";
		var str="none";
		 var url =base.concat(str);
		   window.location.assign(url);
 
 }else{*/
 var new_price=document.getElementById("new_price").value;
 
 var new_price = new_price.trim();
 
 /*if(typeof new_price=='string'){
	 alert("enter decimal value for price");
	 var base="check1?none=";
		var str="none";
		 var url =base.concat(str);
		   window.location.assign(url);
	 }else{*/
 var new_buyer=document.getElementById("new_buyer").value;
 var new_buyer = new_buyer.trim();
 if(new_buyer=="Citi")
	 new_buyer="C01";
 else if(new_buyer=="GoldmanSachs")
		 new_buyer="C02";
 else if(new_buyer=="DeutscheBank")
	 new_buyer="C03";
 else if(new_buyer=="JPMorgan")
	 new_buyer="C04";
 var new_seller=document.getElementById("new_seller").value;
 var new_seller = new_seller.trim();
 if(new_seller=="Citi")
	 new_seller="C01";
 else if(new_seller=="GoldmanSachs")
		 new_seller="C02";
 else if(new_seller=="DeutscheBank")
	 new_seller="C03";
 else if(new_seller=="JPMorgan")
	 new_seller="C04";
 var base="addtransaction?transId=";
 var url =base.concat("1","&new_security=",new_security,"&new_quantity=",new_quantity,"&new_price=",new_price,"&new_buyer=",new_buyer,"&new_seller=",new_seller);
window.location.assign(url);//}}
 // var table=document.getElementById("table_format");
// var table_len=(table.rows.length)-1;
// var row = table.insertRow(table_len).outerHTML="<tr id='row"+table_len+"'><td id='trade_row"+table_len+"'>"+new_trade+"</td><td id='security_row"+table_len+"'>"+new_security+"</td><td id='quantity_row"+table_len+"'>"+new_quantity+"</td><td id='price_row"+table_len+"'>"+new_price+"</td><td id='buyer_row"+table_len+"'>"+new_buyer+"</td><td id='seller"+table_len+"'>"+new_seller+"</td><td><input type='button' id='edit_button"+table_len+"' value='Edit' class='edit' onclick='edit_row("+table_len+")'> <input type='button' id='save_button"+table_len+"' value='Save' class='save' onclick='save_row("+table_len+")'> <input type='button' value='Delete' class='delete' onclick='delete_row("+table_len+")'></td></tr>";
}
function pop() {
	 var name=prompt("Please enter no of trades",20);
    var num = name;
    var base="randomtable?nooftransaction=";
    var url =base.concat(num);
    window.location.assign(url);
   
}
function defo() {
	 
  
   var base="defaulttable?none=";
   var str="none";
   var url =base.concat(str);
   window.location.assign(url);
  
}
function filterquantity(){
	alert("lasya");
	var base="filterquan?none=";
	var str="none";
	   var url =base.concat(str);
	   window.location.assign(url);
}
function filterprice(){
	var base="filterprice?none=";
	var str="none";
	   var url =base.concat(str);
	   window.location.assign(url);
	
}
</script>
  

</body>
</html>