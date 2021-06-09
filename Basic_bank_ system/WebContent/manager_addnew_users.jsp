<%@page errorPage="error.jsp"  %>
<%@include file="db.jsp" %>
<%@page import="java.util.*"%>
<%
	String mid = (String)session.getAttribute("mid");
	String mpwd = (String)session.getAttribute("mpwd");
if(mid == null && mpwd == null){
	response.sendRedirect("index.jsp");
}

Random rand = new Random();
long accno = rand.nextInt(900911000) + 0000000001;
%>
<!DOCTYPE html>
<html>
<head>
  <title>Banking</title>
  
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="css/custom.css">
<link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.min.css">

  
</head>
<body style="background:#808000;background-size: 100%">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
 <a class="navbar-brand" href="#">
    <img src="images/logo.png" width="30" height="30" class="d-inline-block align-top" alt="">
   <%="Bank"%>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item ">
        <a class="nav-link " href="mindex.jsp">User Accounts <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item ">  <a class="nav-link" href="manage_cashier_accounts.jsp">Cashier Accounts</a></li>
      <li class="nav-item active">  <a class="nav-link" href="manager_addnew_users.jsp">Add New Account</a></li>
      <li class="nav-item ">  <a class="nav-link" href="manager_feedback.jsp">Feedback</a></li>
      


    </ul>
     <form class="form-inline my-2 my-lg-0">
       
        <a href="logout.jsp" data-toggle="tooltip" title="Logout" class="btn btn-outline-danger mx-1" ><i class="fa fa-sign-out fa-fw"></i></a>    
</form>
    
  </div>
</nav><br><br><br>
 <%
 String name = request.getParameter("name");
 String cnic = request.getParameter("cnic");
 String accountNo = request.getParameter("accountNo");
 String accountType = request.getParameter("accountType");
 String city = request.getParameter("city");
 String address = request.getParameter("address");
 String email = request.getParameter("email");
 String password = request.getParameter("password");
 String balance = request.getParameter("balance");
 String source = request.getParameter("source");
 String number = request.getParameter("number");
 String branch = request.getParameter("branch");
 if(name != null && cnic != null && accountNo != null && accountType != null && city != null && address != null && email != null && password != null && balance != null && source != null && number != null && branch != null){
String qr = "insert into useraccounts (name,cnic,accountNo,accountType,city,address,email,password,balance,source,number,branch) values (?,?,?,?,?,?,?,?,?,?,?,?)";
PreparedStatement ps = con.prepareStatement(qr);
ps.setString(1, name);
ps.setString(2, cnic);
ps.setString(3, accountNo);
ps.setString(4, accountType);
ps.setString(5, city);
ps.setString(6, address);
ps.setString(7, email);
ps.setString(8, password);
ps.setString(9, balance);
ps.setString(10, source);
ps.setString(11, number);
ps.setString(12, branch);
int set = ps.executeUpdate();
if(set !=0){
	out.println("<div class='alert alert-success'>Successfully Added.</div>");
}
else{
	out.println("<div class='alert alert-success'>Failed.</div>");	
}
 }
 %>
<div class="container">
<div class="card w-100 text-center shadowBlue">
  <div class="card-header">
   New Account Forum
  </div>
  <div class="text-white card-body bg-dark ">
    <table class="table">
      <tbody>
        <tr>
          <form method="POST" action="manager_addnew_users.jsp">
          <th style="color: white;">Name</th>
          <td><input type="text" name="name" class="form-control input-sm" required></td>
          <th style="color: white;">Aadhar No.</th>
          <td><input type="number" name="cnic" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th style="color: white;">Account Number</th>
          <td><input type="" name="accountNo" readonly value="<%=accno %>" class="form-control input-sm" required></td>
          <th style="color: white;">Account Type</th>
          <td>
            <select class="form-control input-sm" name="accountType" required>
              <option value="current" selected>Current</option>
              <option value="saving" selected>Saving</option>
            </select>
          </td>
        </tr>
        <tr>
          <th style="color: white;">City</th>
          <td><input type="text" name="city" class="form-control input-sm" required></td>
          <th style="color: white;">Address</th>
          <td><input type="text" name="address" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th style="color: white;">Email</th>
          <td><input type="email" name="email" class="form-control input-sm" required></td>
          <th style="color: white;">Password</th>
          <td><input type="password" name="password" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th style="color: white;">Deposit</th>
          <td><input type="number" name="balance" min="500" class="form-control input-sm" required></td>
          <th style="color: white;">Source of income</th>
          <td><input type="text" name="source" class="form-control input-sm" required></td>
        </tr>
        <tr>
          <th style="color: white;">Contact Number</th>
          <td><input type="number" name="number"  class="form-control input-sm" required></td>
          <th style="color: white;">Branch</th>
          <td>
            <select name="branch" required class="form-control input-sm">
              <option selected value="">Please Select..</option>
              <%
              String qr = "select * from branch";
              Statement st = con.createStatement();
              ResultSet rs = st.executeQuery(qr);
              if(rs.next()){
            	  do{
            		  String branchId = rs.getString("branchId");
            		  String branchName = rs.getString("branchName");
            		  %>
            	<option value='<%=branchId%>'><%=branchName%></option>
            	 <% 
            	  }
            	  while(rs.next());
              }
            	  else{
            		  out.println("<option value='1'>Main Branch</option>");
            	  }
            	  
              %>
             
            </select>
          </td>
        </tr>
        <tr>
          <td colspan="4">
            <button type="submit" name="saveAccount" class="btn btn-primary btn-sm">Save Account</button>
            <button type="Reset" class="btn btn-secondary btn-sm">Reset</button></form>
          </td>
        </tr>
      </tbody>
    </table>
    

  </div>
  <div class="card-footer text-muted">
    <%="Bank"%>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">New Cashier Account</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <form method="POST">
          Enter Details
         <input class="form-control w-75 mx-auto" type="email" name="email" required placeholder="Email">
         <input class="form-control w-75 mx-auto" type="password" name="password" required placeholder="Password">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" name="saveAccount" class="btn btn-primary">Save Account</button>
      </form>
      </div>
    </div>
  </div>
</div>
</body>
<script src='js/jquery-3.2.1.min.js'></script>
<script src='js/popper.min.js'></script>
<script src='js/bootstrap.min.js'></script>

</html>